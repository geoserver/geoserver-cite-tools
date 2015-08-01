#!/bin/bash

if [ $# -lt 2 ]; then
  echo "This program is used to run the GeoServer CITE nightly tests"
  echo "Usage: $0 <profile> [<version>]"
  exit
fi

. ~/.bash_profile

set -x

mvn -version

PROFILE=$1
VERSION=master
if [ $# -eq 2 ]; then
  VERSION=$2
fi

PORT=11010
DIST=/var/www/geoserver

# kill old cite jobs hanging around
ps aux | grep java | grep cite | sed 's/  */ /g' | cut -d ' ' -f 2 | xargs kill -9

# prepare the work area
WORK=work
rm -rf work
mkdir work

# grab latest geoserver
unzip $DIST/${VERSION}/geoserver-${VERSION}-latest-bin.zip -d work

# grab the right data directory
pushd work
if [ "$VERSION" == "master" ]; then
   svn export "https://github.com/geoserver/geoserver/master/data/cite${PROFILE}"
else
   svn export "https://github.com/geoserver/geoserver/branches/${VERSION}/data/cite${PROFILE}"
fi
popd

GEOSERVER_DIR="`ls -d work/geoserver*`"
GEOSERVER_URL="http://localhost:${PORT}/geoserver"
GEOSERVER_DATA="work/cite${PROFILE}"
GEOSERVER_DIR_ABS=`pwd`/$GEOSERVER_DIR

# advertise geoserver version information
cat $GEOSERVER_DIR/VERSION.txt 

# initialize the data directory
pushd ${GEOSERVER_DATA}
if [ -e init.sh ]; then
   ./init.sh $GEOSERVER_DIR_ABS
fi
popd

pushd ${GEOSERVER_DIR}/bin

#hack the start/stop scripts
sed -i 's/-DSTOP.PORT=8079/-Djetty.port=11010 -DSTOP.PORT=11009/g' startup.sh
sed -i 's/-DSTOP.PORT=8079/-DSTOP.PORT=11009/g' shutdown.sh

# start geoserver
export GEOSERVER_DATA_DIR=$GEOSERVER_DATA
JAVA_OPTS="-Xmx256m -XX:MaxPermSize=128m" ./startup.sh -Djetty.port=$PORT >& geoserver.log &
PID=$!
popd

# prepare the form files for the port used here
cp -r forms work/forms
sed -i "s/localhost:8080/localhost:${PORT}/g" work/forms/*.xml

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


# run the test
ant -debug -Dformsdir="work/forms" $PROFILE

# generate the log, looking for failures
ant ${PROFILE}-log | grep Failed
if [ "$?" == "0" ]; then
  RETURN=1
else
  RETURN=0
fi

echo "RETURN=${RETURN}"
popd

#s hut down geoserver
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
