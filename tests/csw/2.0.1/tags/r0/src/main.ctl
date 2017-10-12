<?xml version="1.0" encoding="UTF-8"?>
<ctl:package
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:ctl="http://www.occamlab.com/ctl"
 xmlns:parsers="http://www.occamlab.com/te/parsers"
 xmlns:p="http://teamengine.sourceforge.net/parsers"
 xmlns:saxon="http://saxon.sf.net/"
 xmlns:csw="http://www.opengis.net/cat/csw"
 xmlns:ows="http://www.opengis.net/ows"
 xmlns:dc="http://purl.org/dc/elements/1.1/" 
 xmlns:dct="http://purl.org/dc/terms/" 
 xmlns:xi="http://www.w3.org/2001/XInclude"
 xmlns:xsd="http://www.w3.org/2001/XMLSchema">

   <xi:include href="functions.ctl"/>
   <xi:include href="parsers.ctl"/>
   <xi:include href="basic-tests.ctl"/>
   <xi:include href="capability-tests.ctl"/>
   
   <ctl:suite name="csw:csw-2.0.1-compliance-suite">
       <ctl:title>CSW 2.0.1 Compliance Test Suite</ctl:title>
       <ctl:description>
       Validates a CSW 2.0.1 catalogue implementation against all applicable 
       abstract test suites. No specific CSW application profile is presumed.
       These tests are not intended to stand alone, but to be incorporated into 
       profile-specific test suites.
       </ctl:description>
       <ctl:link>data/data-csw-2.0.1.zip</ctl:link>
       <ctl:link>docs/csw/2.0.1/</ctl:link>
      <ctl:starting-test>csw:csw-main</ctl:starting-test>
   </ctl:suite>
   
   <ctl:test name="csw:csw-main">
      <ctl:assertion>Run the CSW 2.0.1 compliance tests</ctl:assertion>
      <ctl:code>
   		<!--RI: http://www.crisalis-tech.com:8081/geonetwork/srv/en/csw-->
   		<!--http://geonetwork.mysdi.org:8081/geonetwork/srv/en/csw-->   
		<!--http://geobrain.laits.gmu.edu:8099/LAITSCSW2/discovery-->         
         <xsl:variable name="form-values">
            <ctl:form height="600" width="800">
               <body>
                  <h2>CSW Catalogue 2.0.1 - Test setup</h2>
                  <h3>Service metadata</h3>
                  <p>
                  Please provide a URL from which a capabilities document can 
                  be retrieved. Modify the URL template below to specify the 
                  location of an OGC capabilities document for the CSW 
                  implementation under test (this can refer to a static document 
                  or to a service endpoint).
                  </p>
                  <br/>
                  <table border="2" padding="4" bgcolor="#00ffff">
                    <tr>
                      <td align="left">Capabilities URL</td>
                      <td align="center">
                          <input name="capabilities.url" size="128" 
                                 type="text"
                                 value="http://hostname:port/path?p1=v1"/>
                      </td>
                    </tr>
                  </table>
                  <p>
                  <div bgcolor="#ffffcc"><strong> WARNING </strong> Don't forget to add the test data!</div>
                  </p>
                  <br />
                  <input type="submit" value="Start"/>
               </body>
            </ctl:form>
         </xsl:variable>

		<!-- Populate global variables from form data -->
		<xsl:variable name="csw.capabilities.url" 
                      select="$form-values/values/value[@key='capabilities.url']"/>

		<!-- Attempt to retrieve capabilities document -->
		<xsl:variable name="csw.GetCapabilities.document">
			<ctl:request>
				<ctl:url>
					<xsl:value-of select="$csw.capabilities.url"/>
				</ctl:url>
				<ctl:method>GET</ctl:method>
			</ctl:request>
		</xsl:variable>
        
        <xsl:choose>
          <xsl:when test="not($csw.GetCapabilities.document/csw:Capabilities)">
		    <ctl:message>FAILURE: Did not receive a csw:Capabilities document! Skipping remaining tests.</ctl:message>	
			<ctl:fail/>
          </xsl:when>
          <xsl:otherwise>
            <ctl:call-test name="csw:basic-tests">
			  <ctl:with-param name="csw.GetCapabilities.document" select="$csw.GetCapabilities.document"/>															
		    </ctl:call-test>
          </xsl:otherwise>
        </xsl:choose>
      </ctl:code>
   </ctl:test>
</ctl:package>
