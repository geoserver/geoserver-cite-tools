<?xml version="1.0" encoding="UTF-8"?>
<ctl:package
 xmlns="http://www.w3.org/2001/XMLSchema"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:ctl="http://www.occamlab.com/ctl"
 xmlns:parsers="http://www.occamlab.com/te/parsers"
 xmlns:myparsers="http://teamengine.sourceforge.net/parsers"
 xmlns:saxon="http://saxon.sf.net/"
 xmlns:wfs="http://www.opengis.net/wfs" 
 xmlns:sf="http://cite.opengeospatial.org/gmlsf" 
 xmlns:ows="http://www.opengis.net/ows"
 xmlns:xi="http://www.w3.org/2001/XInclude"
 xmlns:xlink="http://www.w3.org/1999/xlink"  
 xmlns:xsd="http://www.w3.org/2001/XMLSchema">

	<xi:include href="functions.ctl"/>	
	<xi:include href="parsers.ctl"/>	
	<xi:include href="readiness-tests.ctl"/>	
	<xi:include href="basic-tests.ctl"/>
	<xi:include href="wfs-transaction/transaction-tests.ctl"/>
	
	
	<ctl:suite name="ctl:wfs-1.1.0-compliance-suite">
		  <ctl:title>WFS 1.1.0 Compliance Test Suite</ctl:title>
		  <ctl:description>Verifies that a WFS 1.1.0 implementation complies with a given conformance class.</ctl:description>
          <ctl:link>docs/wfs/1.1.0/</ctl:link>
          <ctl:link>data/data-wfs-1.1.0.zip</ctl:link>
		  <ctl:starting-test>wfs:wfs-main</ctl:starting-test>
	</ctl:suite>

   <ctl:test name="wfs:wfs-main">
      <ctl:assertion>WFS 1.1.0 Tests</ctl:assertion>
      <ctl:code>
		<!--RI: http://geo.openplans.org:8080/geoserver/wfs/GetCapabilities-->
		<!--http://nautilus.baruch.sc.edu/wms/in_situ-->
         <xsl:variable name="form-values">
            <ctl:form height="640" width="800">
               <body>
                  <h2>Compliance test suite for Web Feature Service (WFS) 1.1.0</h2>
                  <h3>Service metadata</h3>
                  <p>
                  Please provide a URL from which a capabilities document can 
                  be retrieved. Modify the URL template below to specify the 
                  location of an OGC capabilities document for the WFS implementation 
                  under test (this can refer to a static document or to a service endpoint).
                  </p>
                  <blockquote>
                     <table border="2" padding="4" bgcolor="#00ffff">
                        <tr>
                           <td align="left">Capabilities URL:</td>                        
                           <td align="center">
                              <input name="capabilities-url" size="128" 
                              type="text" 
                              value="http://hostname:port/path?query"/>
                           </td>
                        </tr>
                     </table>
                  </blockquote>
                  <p>
                  <strong>Note: </strong>The reference implementation is currently 
                  available at <code>&lt;http://geo.openplans.org:8080/geoserver/wfs/GetCapabilities?request=GetCapabilities&amp;service=WFS&amp;version=1.1.0&gt;</code>.
                  </p>
				  <br/>
				  
                  <h3>WFS conformance class</h3>
                  <p>
                  The conformance class indicates the general functional capabilities provided by the WFS under test.
                  </p>
                  <blockquote>
                     <table border="2" padding="4" bgcolor="#00ffff">
                        <tr>
                           <td align="center">
                              <input name="conformance" type="radio" value="basic" checked="checked"/>
                           </td>
                           <td align="left">WFS-Basic - Supports <strong>GetCapabilities</strong>, <strong>DescribeFeatureType</strong> and <strong>GetFeature</strong> requests</td>
                        </tr>
                        <tr>
                           <td align="center">
                              <input name="conformance" type="radio" value="transaction"/>
                           </td>
                           <td align="left">WFS-Transaction - As for WFS-Basic, plus support for <strong>Transaction</strong> requests (<strong>LockFeature</strong> and <strong>GetFeatureWithLock</strong> are optional)</td>
                        </tr>
                        <!--
                        <tr>
                           <td align="center">
                              <input name="conformance" type="radio" value="xlink" />
                           </td>
                           <td align="left">WFS-XLink - As for WFS-Basic, plus support for the <strong>GetGmlObject</strong> request</td>
                        </tr>
                        -->
                     </table>
                  </blockquote>
				  <br/>
				  
                  <h3>GML Simple Features (GMLSF) compliance level</h3>
                  <p>
                  This indicates the scope of GML 3 support, as documented in OGC 06-049.  
                  Only test data for levels SF-0 and SF-1 are currently available.
                  </p>
                  <blockquote>
                     <table border="2" padding="4" bgcolor="#00ffff">
                        <tr>
                           <td align="center">
                              <input name="profile" type="radio" value="sf-0" checked="checked"/>
                           </td>
                           <td align="left">SF-0 - Level 0 (only simple non-spatial property types; Curve and Surface geometries are excluded)</td>
                        </tr>
                        <tr>
                           <td align="center">
                              <input name="profile" type="radio" value="sf-1"/>
                           </td>
                           <td align="left">SF-1 - Level 1 (complex non-spatial property types, plus Curve and Surface geometries)</td>
                        </tr>
                     </table>
                  </blockquote>
				  <p>
                  <div bgcolor="#ffffcc"><strong> WARNING </strong> Don't forget to add the test data!</div>
                  </p>
                  <br />
                  <input type="submit" value="Start"/>
               </body>
            </ctl:form>
         </xsl:variable>

		<!-- Get user input: -->
		<xsl:variable name="wfs.GetCapabilities.get.url" select="$form-values/values/value[@key='capabilities-url']"/>
        <xsl:variable name="wfs.conformance.class" select="$form-values/values/value[@key='conformance']"/>
		<xsl:variable name="gmlsf.profile.level" select="$form-values/values/value[@key='profile']"/>

		<!--TODO: Get GMLSF profile level from DescribeFeatureType and XPath expression (gmlsf conformance level 0 or 1) rather than user input-->

		<!-- Attempt to retrieve capabilities document -->
		<xsl:variable name="wfs.GetCapabilities.document">
			<ctl:request>
				<ctl:url>
					<xsl:value-of select="$wfs.GetCapabilities.get.url"/>
				</ctl:url>
				<ctl:method>GET</ctl:method>
			</ctl:request>
		</xsl:variable>	
 
		 <!-- Call the readiness tests, which then call the conformance class tests -->
		 <xsl:choose>
				<xsl:when test="not($wfs.GetCapabilities.document//wfs:WFS_Capabilities)">
					<ctl:message>FAILURE: Did not receive a wfs:WFS_Capabilities document! Skipping remaining tests.</ctl:message>	
					<ctl:fail/>
				</xsl:when>
				<xsl:otherwise>
					<ctl:call-test name="wfs:readiness-tests">
						<ctl:with-param name="wfs.GetCapabilities.document" select="$wfs.GetCapabilities.document"/>														
						<ctl:with-param name="wfs.conformance.class" select="$wfs.conformance.class"/>
						<ctl:with-param name="gmlsf.profile.level" select="$gmlsf.profile.level"/>	
					</ctl:call-test>
				</xsl:otherwise>
		 </xsl:choose>
      </ctl:code>
   </ctl:test>	
	
</ctl:package>

