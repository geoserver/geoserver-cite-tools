<?xml version="1.0" encoding="UTF-8"?>
<ctl:package
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:ctl="http://www.occamlab.com/ctl"
 xmlns:parsers="http://www.occamlab.com/te/parsers"
 xmlns:p="http://teamengine.sourceforge.net/parsers"
 xmlns:saxon="http://saxon.sf.net/"
 xmlns:csw="http://www.opengis.net/cat/csw"
 xmlns:ows="http://www.opengis.net/ows"
 xmlns:xlink="http://www.w3.org/1999/xlink"
 xmlns:xi="http://www.w3.org/2001/XInclude">
	
	<ctl:test name="csw:basic-tests">
		<ctl:param name="csw.GetCapabilities.document"/>
		<ctl:assertion>
        Assess readiness of the IUT. Check the retrieved capabilities document 
        for available service endpoints; determine if the service is available 
        and test data have been loaded.
        </ctl:assertion>
        <ctl:comment>
        The capabilities document is first checked for the presence of required 
        elements (e.g. HTTP method bindings, filter operators). Then a 
        GetCapabilities request is submitted to the IUT using the GET method. 
        A subsequent GetRecordById request to retrieve one of the records in 
        the test data set is then submitted and checked for a non-empty response. 
        If any of these checks fail, execution of the test suite is aborted.
        </ctl:comment>
		<ctl:code>
            <ctl:call-test name="ctl:SchematronValidatingParser">
		        <ctl:with-param name="doc" select="$csw.GetCapabilities.document" />
		        <ctl:with-param name="schema">sch/csw/2.0.1/Capabilities.sch</ctl:with-param>
		        <ctl:with-param name="phase">RequiredElementsPhase</ctl:with-param>
	        </ctl:call-test>

            <xsl:variable name="GetCapabilities.get.endpoint">
		        <xsl:value-of select="$csw.GetCapabilities.document//ows:OperationsMetadata/ows:Operation[@name='GetCapabilities']/ows:DCP/ows:HTTP/ows:Get/@xlink:href"/>
		    </xsl:variable>
            <xsl:variable name="GetRecordById.get.endpoint">
			    <xsl:value-of select="$csw.GetCapabilities.document//ows:OperationsMetadata/ows:Operation[@name='GetRecordById']/ows:DCP/ows:HTTP/ows:Get/@xlink:href"/>
		    </xsl:variable>
            <xsl:choose>
              <xsl:when test="not(starts-with($GetCapabilities.get.endpoint,'http'))">
                  <ctl:message>
                  FAILURE: HTTP endpoint for GetCapabilities using GET method not found in capabilities document.
                  </ctl:message>
                  <ctl:fail />
              </xsl:when>
              <xsl:when test="not(starts-with($GetRecordById.get.endpoint,'http'))">
                  <ctl:message>
                  FAILURE: HTTP endpoint for GetRecordById using GET method not found in capabilities document.
                  </ctl:message>
                  <ctl:fail />
              </xsl:when>
              <xsl:otherwise>
                <xsl:variable name="response1">
                  <!-- Submit GetCapabilities request --> 
				  <ctl:request>
					<ctl:url>
						<xsl:value-of select="$GetCapabilities.get.endpoint"/>
					</ctl:url>
					<ctl:method>GET</ctl:method>
					<ctl:param name="service">CSW</ctl:param>
					<ctl:param name="version">2.0.1</ctl:param>
					<ctl:param name="request">GetCapabilities</ctl:param>
					<p:XMLValidatingParser.CSW/>
				  </ctl:request>
			    </xsl:variable>

                <xsl:variable name="response2">
                  <!-- Submit GetRecordById request -->
                  <ctl:request>
                    <ctl:url>
						<xsl:value-of select="$GetRecordById.get.endpoint"/>
					</ctl:url>
					<ctl:method>GET</ctl:method>
					<ctl:param name="service">CSW</ctl:param>
					<ctl:param name="version">2.0.1</ctl:param>
					<ctl:param name="request">GetRecordById</ctl:param>
                    <ctl:param name="id">urn:uuid:94bc9c83-97f6-4b40-9eb8-a8e8787a5c63</ctl:param>
					<p:XMLValidatingParser.CSW/>
				  </ctl:request>
			    </xsl:variable>
              
                <xsl:choose>
                  <xsl:when test="not($response1/*)">
                    <ctl:message>
                    FAILURE: The response from {$GetCapabilities.get.endpoint} could not be read or is invalid.
                    </ctl:message>
                    <ctl:fail/>
                  </xsl:when>
                  <xsl:when test="not($response1/csw:Capabilities)">
                    <ctl:message>
                    FAILURE: The response entity is NOT a csw:Capabilities document.
                    The document element has [local name] = <xsl:value-of select="local-name($response1/*[1])"/> and [namespace name] = <xsl:value-of select="namespace-uri($response1/*[1])"/>.
                    </ctl:message>
                    <ctl:fail/>
                  </xsl:when>
                  <xsl:when test="count($response2/csw:GetRecordByIdResponse/*) != 1">
                    <ctl:message>
                    FAILURE: The GetRecordByIdResponse entity does NOT include only one matching item from the test data set (id = urn:uuid:94bc9c83-97f6-4b40-9eb8-a8e8787a5c63).
                    </ctl:message>
                    <ctl:fail/>
                  </xsl:when>
                  <xsl:otherwise>
                    <ctl:call-test name="csw:capability-tests">
			          <ctl:with-param name="csw.GetCapabilities.document" 
                                    select="$csw.GetCapabilities.document"/>															
		            </ctl:call-test>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
		</ctl:code>
	</ctl:test>	
    
</ctl:package>

