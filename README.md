GeoServer CITE Tools
====================

Requirements
------------

* git
* maven
* ant

Building the Tools
------------------

1. Clone the ``geoserver-cite-tools`` repository:

        % git clone git://github.com/jdeolive/geoserver-cite-tools.git 
        
1. Update/initialize submodules:

        % git submodule update --init

1. Build the tools with Ant:

        % ant build

Testing from Command Line
-------------------------

The ``build.xml`` file is used to perform test runs. Run ant with no arguments
to show information about available targets:

    % ant 
    usage:
     [echo] 
     [echo] Targets:
     [echo] 
     [echo]  wfs-1.0        --> Run WFS 1.0 tests
     [echo]  wfs-1.0-log    --> View WFS 1.0 test log
     [echo]  wfs-1.1        --> Run WFS 1.1 tests
     [echo]  wfs-1.1-log    --> View WFS 1.1 test log
     [echo]  wms-1.1        --> Run WMS 1.1 tests
     [echo]  wms-1.1-log    --> View WMS 1.1 test log
     [echo]  wms-1.3        --> Run WMS 1.3 tests
     [echo]  wms-1.3-log    --> View WMS 1.3 test log
     [echo]  wcs-1.0        --> Run WCS 1.0 tests
     [echo]  wcs-1.0-log    --> View WCS 1.0 test log
     [echo]  wcs-1.1        --> Run WCS 1.1 tests
     [echo]  wcs-1.1-log    --> View WCS 1.1 test log
     [echo]  csw2-2.0.2      --> Run CSW 2.0.2 tests
     [echo]  csw2-2.0.2-log  --> View CSW 2.0.2 test log
     [echo]  clean          --> Cleans results from previous test runs
     [echo]  webapp         --> Runs teamengine web application

To perform a test run execute the ant command passing it the service to test.
For example to test the WFS 1.0 service:

    ant wfs-1.0

To view the log of a test run execute the ant command passing it the service 
name suffixed with "-log". For example, to view the WFS 1.0 logs:

    ant wfs-1.0-log

To clean results from previous test runs run the command:

    ant clean

Testing from the Web Application
--------------------------------

TEAMEngine comes with a web application that can be used to execute tests and 
view test results. To run the teamengine web application:

    ant webapp

By default the engine is available at http://localhost:9090/teamengine. To 
change the webapp port edit the file ``engine/pom.xml``.

Updating TeamEngine
-------------------

The TeamEngine is linked into this build as a git submodule, pointing to a specific revision
(normally a tag, but if we need some yet un-released fix or functionality, it might be a specific,
non officially tagged revision).

To switch to a different revision of the TeamEngine, and make the change permanent, get a fix
on the target revision and execute the following commands form the checkout root directory:

    cd engine
    git fetch origin
    git checkout <targetRevision>
    cd ..
    git commit -m "Updating the TeamEngine to <tag/revision> for <whatever reason>"
   
Updating a CITE test
--------------------

Just like the TeamEngine, all CITE test suites are linked into the build as git submodules, normally
pointing at a specific tag.

In order to update one of the CITE tests to a different revision play the same commands
used to update the TeamEngine, referring to a CITE test revision instead.

Adding a new CITE test
----------------------

Adding a new CITE test is involves adding a new git submodule, changing the main Ant script,
and get the right form contents to run the test headless.

In order to add the new git submodule, for example for WPS 1.0, check the location and revision
of the  WPS tests at https://github.com/opengeospatial/ and then run the following commands (in particular,
these are adding verison 0.4 of the test suite):

    git submodule add https://github.com/opengeospatial/ets-wps10
    git checkout 1e78a36ca8071584171e356288a3bbcee6b39668

Get into the WPS test suite module and manually build it, then check the target contents, which
might contain one or two zip files (a ctl file, and then eventually a set of resource jars needed
for the tests):

    mvn clean install -nsu
    la target

Modify the main Ant file to make it unpack the scripts in te_base, e.g.:

    --- a/build.xml
    +++ b/build.xml
    @@ -40,6 +40,8 @@
         <echo message=" wcs-1.1-log    --&gt; View WCS 1.1 test log" />
         <echo message=" csw-2.0.2      --&gt; Run CSW 2.0.2 tests" />
         <echo message=" csw-2.0.2-log  --&gt; View CSW 2.0.2 test log" />
    +    <echo message=" wps-1.0        --&gt; Run WPS 1.0 tests" />
    +    <echo message=" wps-1.0-log    --&gt; View WPS 1.0 test log" />
         <echo message=" clean          --&gt; Cleans results from previous test runs" />
         <echo message=" webapp         --&gt; Runs teamengine web application" />
       </target>
    @@ -83,6 +85,9 @@
         <exec dir="${basedir}/ets-csw202" executable="mvn">
           <arg line="install -DskipTests" />
         </exec>
    +    <exec dir="${basedir}/ets-wps10" executable="mvn">
    +      <arg line="install -DskipTests" />
    +    </exec>
     
         <!-- unzip the console runner -->
         <mkdir dir="${basedir}/te_console" />
    @@ -154,6 +159,11 @@
           <fileset dir="${basedir}/ets-csw202/target/" includes="ets-csw20-**-ctl.zip" />
         </first>
         <unzip src="${toString:ets_csw202_ctl}" dest="${basedir}/te_base/scripts" />
    +    <!-- unzip the wps 1.0 tests in place -->
    +    <first id="ets_wps10_ctl">
    +      <fileset dir="${basedir}/ets-wps10/target/" includes="ets-wps10-**-ctl.zip" />
    +    </first>
    +    <unzip src="${toString:ets_wps10_ctl}" dest="${basedir}/te_base/scripts" />
     
         <!-- copy the configuration declaring all cite tests -->
         <copy file="config.xml" tofile="${basedir}/te_base/config.xml" />

Check the files are correctly unpacked in ${te_base}/scripts and then run the web application
for a round of interactive testing in order to collect suitable form results:

    ant webapp
    
The webapp logs will contain logs detailing the contents of the forms file, like in this example::

     [exec] INFO: Setting form results:
     [exec]  <?xml version="1.0" encoding="UTF-8"?>
     [exec] <values>
     [exec]    <value key="service-url">http://localhost:8080/geoserver/wps</value>
     [exec]    <value key="updatesequence-high">1000</value>
     [exec]    <value key="updatesequence-low">0</value>
     [exec] </values>

Thus, create a ``forms/wps-1.0.0.xml`` file with the following contents:

     <?xml version="1.0" encoding="UTF-8"?>
     <values>
        <value key="service-url">http://localhost:8080/geoserver/wps</value>
        <value key="updatesequence-high">1000</value>
        <value key="updatesequence-low">0</value>
     </values>
     
Now it's possible to add the headless test command to ``build.xml``:

    <target name="wps-1.0.0">
      <antcall target="run-test">
        <param name="sources" value="-source=${scriptdir}/wps/1.0.0/ctl/DescribeProcess.xml 
          -source=${scriptdir}/wps/1.0.0/ctl/Execute.xml
          -source=${scriptdir}/wps/1.0.0/ctl/functions.xml
          -source=${scriptdir}/wps/1.0.0/ctl/GetCapabilities.xml
          -source=${scriptdir}/wps/1.0.0/ctl/OWS.xml
          -source=${scriptdir}/wps/1.0.0/ctl/wps.xml" />
        <param name="session" value="wps-1.0.0" />
        <param name="forms" value="-form=${forms}/wps-1.0.0.xml" />
      </antcall>
    </target>
    <target name="wps-1.0.0-log">
      <antcall target="view-log">
        <param name="session" value="wps-1.0.0" />
      </antcall>
    </target>
    
And finally commit all the changes. 

Running tests on a build server
===============================

Two scripts have been provided to help build server integration.

``cite-build.sh`` forces the update of submodules (Team Engine, test scripts)
and performs a clean build of them all. This module takes no parameters.
It's a slow to run script that one should run once a day, just before starting to run all the CITE tests.

``cite.sh`` runs a particular test from a checkout previously built using ``cite-build.sh``.
In particular, it unpacks the right version of GeoServer from the nightly builds, sets up the
required data directory, runs the setup command ``init.sh`` found in the data directory,
starts GeoServer, runs the test, stops GeoServer and verifies if the test passed, or not.
The return status will be 0 for a pass, 1 for a failure.

The command line invocation is ``cite.sh <profile> <version>`` where profile is one of the
GeoServer CITE profiles, and version is the GeoServer branch to be tested (e.g. ``master``, ``2.7.x``).
The scripts assumes it will find the corresponding nightly build at ``/var/www/geoserver/${VERSION}/geoserver-${VERSION}-latest-bin.zip``

