#!/bin/bash

set -x

if [ $# -lt 2 ]; then
  echo "Usage: $0 <profile> [<version>]"
  exit
fi

. ~/.bash_profile

set -x

mvn -version

PROFILE=$1
VERSION=2.4.x
if [ $# -eq 2 ]; then
  VERSION=$2
fi

PORT=11010
DIST=/var/www/geoserver 

# kill old cite jobs hanging around
ps aux | grep java | grep cite | sed 's/  */ /g' | cut -d ' ' -f 2 | xargs kill -9

# initialize the git checkout
pushd git
git reset --hard HEAD
git clean -f -d
git pull origin master
popd

# set up any synlinks that we need
pushd geoserver_data
if [ ! -e $VERSION ]; then
  ln -sf ../git/data $VERSION
fi
popd

# grap latest geoserver
rm -rf geoserver
mkdir geoserver
unzip $DIST/${VERSION}/geoserver-${VERSION}-latest-bin.zip -d geoserver

GEOSERVER_DIR="geoserver/`ls geoserver`"
GEOSERVER_URL="http://localhost:${PORT}/geoserver"
GEOSERVER_DATA="`pwd`/geoserver_data/${VERSION}/cite${PROFILE}"
GEOSERVER_DIR_ABS=`pwd`/$GEOSERVER_DIR


#spit out geoserver version information
cat $GEOSERVER_DIR/VERSION.txt 

#initialize the data directory
pushd ${GEOSERVER_DATA}
if [ -e init.sh ]; then
   ./init.sh $GEOSERVER_DIR_ABS
fi
popd

pushd ${GEOSERVER_DIR}/bin

#hack the start/stop scripts
sed -i 's/-DSTOP.PORT=8079/ -Djetty.http.port=11010 -DSTOP.PORT=11009/g' startup.sh
sed -i 's/-DSTOP.PORT=8079/-DSTOP.PORT=11009/g' shutdown.sh
sed -i 's/8080/11010/g' ../etc/jetty.xml
#echo "jetty.http.port=11010" > ../start.ini
sed -i  "s/jetty.port=8080/jetty.port=11010/g" ../start.ini

# start geoserver
export GEOSERVER_DATA_DIR=$GEOSERVER_DATA
export JAVA_OPTS="-Xmx256m -XX:MaxPermSize=128m"
#export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
pwd
( ./startup.sh -Djetty.http.port=$PORT > geoserver.log ) &
PID=$!
echo $PID
popd

# wait until geoserver has started
N=100
ONLINE=0
for ((  i = 1 ;  i <= ${N};  i++ ))
do
  sleep 2
  echo "Pinging GeoServer at $GEOSERVER_URL"
  curl -G $GEOSERVER_URL
  if [ "$?" == "0" ]; then
    ONLINE=1
    break
  fi
done

if [ "$ONLINE" == "0" ]; then
  echo "GeoServer did not startup properly"
  exit 1
else
  echo "GeoServer is online"
fi

#  build the tools
pushd tools

# gran updates
git pull origin master
git submodule update

# build the engine
mvn -o clean install
ant clean

# run the test
pushd ..
FORMS="`pwd`/forms"
popd

ant -Dcite.headless=true -Dcite.headless.formroot=$FORMS $PROFILE

# generate the log, looking for failures
ant ${PROFILE}-log | grep Failed
if [ "$?" == "0" ]; then
  RETURN=1
else
  RETURN=0
fi

echo "RETURN=${RETURN}"
popd

#shut down geoserver
pushd ${GEOSERVER_DIR}/bin
./shutdown.sh >& shutdown.log &
popd

ONLINE=1
for ((  i = 1 ;  i <= ${N};  i++ ))
do
  sleep 2
  echo "Pinging GeoServer at $GEOSERVER_URL"
  curl -G $GEOSERVER_URL
  if [ "$?" != "0" ]; then
    ONLINE=0
    break
  fi
done

if [ "$ONLINE" == "1" ]; then
  echo "GeoServer did not shutdown properly"
  exit 1
else
  echo "GeoServer is offline"
fi

# check pid and kill if necessary
ps $PID
if [ "$?" == "0" ]; then
  kill -9 $PID
fi
exit $RETURN
