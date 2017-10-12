<?xml version="1.0" encoding="UTF-8"?>
<ctl:package
 xmlns="http://www.occamlab.com/ctl"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:ctl="http://www.occamlab.com/ctl"
 xmlns:parsers="http://www.occamlab.com/te/parsers"
 xmlns:p="http://teamengine.sourceforge.net/parsers"
 xmlns:saxon="http://saxon.sf.net/"
 xmlns:csw="http://www.opengis.net/cat/csw" 
 xmlns:gml="http://www.opengis.net/gml"
 xmlns:ogc="http://www.opengis.net/ogc"
 xmlns:xi="http://www.w3.org/2001/XInclude">

  <!-- include test groups for optional capabilities -->
  <xi:include href="spatialops/GetRecords-POST-spatialops.xml"/>
    
  <ctl:test name="csw:run-GetRecords-POST">
    <param name="csw.GetCapabilities.document" />
    <ctl:assertion>
    Run test group for GetRecords requests using the POST method.
    </ctl:assertion>
    <ctl:code>
	<xsl:variable name="csw.GetRecords.post.url">
        	<xsl:for-each select="$csw.GetCapabilities.document//ows:OperationsMetadata/ows:Operation[@name='GetRecords']/ows:DCP/ows:HTTP">
			<xsl:choose>
				<xsl:when test="ows:Post[ows:Constraint[@name='PostEncoding']/ows:Value='XML']">
					<xsl:value-of select="ows:Post[ows:Constraint[@name='PostEncoding']/ows:Value='XML']/@xlink:href"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="ows:Post[not(ows:Constraint[@name='PostEncoding'])]/@xlink:href"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:variable>
      <ctl:message>Target endpoint is <xsl:value-of select="$csw.GetRecords.post.url"/></ctl:message>
        
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc1.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc2.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc2.2">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc3.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc4.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc4.2">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc5.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc5.2">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc6.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc6.2">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc7.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc8.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc8.2">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc9.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc10.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc11.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc11.2">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc12.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc13.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc14.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc14.2">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc15.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc16.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc16.2">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc17.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc17.2">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc18.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  <ctl:call-test name="csw:csw-2.0.1-GetRecords-tc19.1">
    <ctl:with-param name="csw.GetRecords.post.url" select="$csw.GetRecords.post.url"/>
  </ctl:call-test>
  
        <!-- run tests for optional capabilities that are implemented -->
        <xsl:if test="count($csw.GetCapabilities.document//ogc:Spatial_Capabilities/ogc:SpatialOperators/ogc:SpatialOperator) gt 1">
          <ctl:call-test name="csw:run-GetRecords-POST-spatialops">
		    <ctl:with-param name="csw.GetCapabilities.document" select="$csw.GetCapabilities.document"/>
		  </ctl:call-test>
        </xsl:if>
      </ctl:code>
    </ctl:test>
   
    <test name="csw:csw-2.0.1-GetRecords-tc1.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      A GetRecords request that omits all optional elements must produce a response containing only a summary of the result set.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element is empty.</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw" 
                        service="CSW" version="2.0.1">
                        <csw:Query typeNames="csw:Record">
                          <csw:ElementSetName>brief</csw:ElementSetName>
                        </csw:Query>
                      </csw:GetRecords>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc1.1.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <ctl:call-test name="ctl:SchematronValidatingParser">
		            <ctl:with-param name="doc" select="$response" />
		            <ctl:with-param name="schema">sch/csw/2.0.1/GetRecords.sch</ctl:with-param>
		            <ctl:with-param name="phase">DefaultPhase</ctl:with-param>
	            </ctl:call-test>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc2.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that specifies a "summary" view must 
      include the corresponding record representations not exeeding the value 
      of the default maxRecords attribute (10).
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element contains exactly 10 csw:SummaryRecord child elements.</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw" 
                        service="CSW" version="2.0.1" resultType="results">
                        <csw:Query typeNames="csw:Record">
                          <csw:ElementSetName>summary</csw:ElementSetName>
                        </csw:Query>
                      </csw:GetRecords>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc2.1.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <ctl:call-test name="ctl:SchematronValidatingParser">
		            <ctl:with-param name="doc" select="$response" />
		            <ctl:with-param name="schema">sch/csw/2.0.1/GetRecords.sch</ctl:with-param>
		            <ctl:with-param name="phase">TenRecordsPhase</ctl:with-param>
	            </ctl:call-test>
                <xsl:if test="count($response/csw:GetRecordsResponse/csw:SearchResults/csw:SummaryRecord) != 10">
                  <ctl:message>FAILURE: 10 csw:SummaryRecord elements expected in response.</ctl:message>
                  <ctl:fail/>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc2.2">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that specifies a "brief" view must 
      include the corresponding record representations not exeeding the value 
      of the default maxRecords attribute (10).
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element contains exactly 10 csw:BriefRecord child elements.</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw" 
                        service="CSW" version="2.0.1" resultType="results">
                        <csw:Query typeNames="csw:Record">
                          <csw:ElementSetName>brief</csw:ElementSetName>
                        </csw:Query>
                      </csw:GetRecords>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc2.2.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <ctl:call-test name="ctl:SchematronValidatingParser">
		            <ctl:with-param name="doc" select="$response" />
		            <ctl:with-param name="schema">sch/csw/2.0.1/GetRecords.sch</ctl:with-param>
		            <ctl:with-param name="phase">TenRecordsPhase</ctl:with-param>
	            </ctl:call-test>
                <xsl:if test="count($response/csw:GetRecordsResponse/csw:SearchResults/csw:BriefRecord) != 10">
                  <ctl:message>FAILURE: 10 csw:BriefRecord elements expected in response.</ctl:message>
                  <ctl:fail/>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc3.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that specifies an ad hoc view must 
      include the corresponding csw:Record representations not exeeding the value 
      of the default maxRecords attribute (10).
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element contains exactly 10 csw:Record child elements, each containing only 
      the requested elements.</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc3.1.body.xml"/>-->
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw" 
                        service="CSW" version="2.0.1" resultType="results">
                        <csw:Query typeNames="csw:Record" 
                          xmlns:dc="http://purl.org/dc/elements/1.1/"
                          xmlns:dct="http://purl.org/dc/terms/">
                          <csw:ElementName>./dc:identifier</csw:ElementName>
                          <csw:ElementName>./dc:type</csw:ElementName>
                          <csw:ElementName>./dct:modified</csw:ElementName>
                        </csw:Query>
                      </csw:GetRecords>
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:for-each select="$response//csw:Record/*">
                  <xsl:variable name="local-name" select="local-name(.)"/>
                  <xsl:if test="empty(index-of(('identifier', 'type', 'modified'), $local-name))">
                    <ctl:message>FAILURE: Unexpected record property: <xsl:value-of select="$local-name"/> (<xsl:value-of select="../dc:identifier"/>)</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc4.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that specifies sorting criteria
      must include the corresponding record representations in the correct 
      sort order.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element contains exactly 10 csw:BriefRecord child elements; (4) the records
      are sorted by dc:identifier in ascending order.</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords service="CSW" version="2.0.1" 
                        xmlns:csw="http://www.opengis.net/cat/csw" 
                        resultType="results">
                        <csw:Query typeNames="csw:Record">
                          <csw:ElementSetName>brief</csw:ElementSetName>
                          <ogc:SortBy xmlns:ogc="http://www.opengis.net/ogc">
                            <ogc:SortProperty>
                              <ogc:PropertyName xmlns:dc="http://purl.org/dc/elements/1.1/">dc:identifier</ogc:PropertyName>
                              <ogc:SortOrder>ASC</ogc:SortOrder>
                            </ogc:SortProperty>
                          </ogc:SortBy>
                        </csw:Query>
                      </csw:GetRecords>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc4.1.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <ctl:call-test name="ctl:SchematronValidatingParser">
		            <ctl:with-param name="doc" select="$response" />
		            <ctl:with-param name="schema">sch/csw/2.0.1/GetRecords.sch</ctl:with-param>
		            <ctl:with-param name="phase">TenRecordsPhase</ctl:with-param>
	            </ctl:call-test>
                <xsl:if test="count($response/csw:GetRecordsResponse/csw:SearchResults/csw:BriefRecord) != 10">
                  <ctl:message>FAILURE: 10 csw:BriefRecord elements expected in response.</ctl:message>
                  <ctl:fail/>
                </xsl:if>
                <xsl:variable name="r1.id" select="$response//csw:SearchResults/*[1]/dc:identifier" /> 
                <xsl:variable name="r2.id" select="$response//csw:SearchResults/*[2]/dc:identifier" />
                <xsl:variable name="r3.id" select="$response//csw:SearchResults/*[3]/dc:identifier" />
                <xsl:if test="(compare($r1.id,$r2.id) ne -1) or (compare($r2.id,$r3.id) ne -1)">
                  <ctl:message>FAILURE: Search results are not sorted correctly by dc:identifier in ascending order.</ctl:message>
                  <ctl:fail/>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc4.2">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that specifies an ad hoc view and 
      sorting criteria must include the corresponding csw:Record representations 
      in the correct sort order.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element contains exactly 10 csw:Record child elements, each containing only 
      the requested elements; (4) the records are sorted by dct:modified in 
      descending order.</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw" 
                        service="CSW" version="2.0.1" resultType="results">
                        <csw:Query typeNames="csw:Record"
                          xmlns:dc="http://purl.org/dc/elements/1.1/" 
                          xmlns:dct="http://purl.org/dc/terms/">
                          <csw:ElementName>./dc:identifier</csw:ElementName>
                          <csw:ElementName>./dc:type</csw:ElementName>
                          <csw:ElementName>./dct:modified</csw:ElementName>
                          <ogc:SortBy xmlns:ogc="http://www.opengis.net/ogc">
                            <ogc:SortProperty>
                              <ogc:PropertyName>dct:modified</ogc:PropertyName>
                              <ogc:SortOrder>DESC</ogc:SortOrder>
                            </ogc:SortProperty>
                          </ogc:SortBy>
                        </csw:Query>
                      </csw:GetRecords>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc4.2.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:for-each select="$response//csw:Record/*">
                  <xsl:variable name="local-name" select="local-name(.)"/>
                  <xsl:if test="empty(index-of(('identifier', 'type', 'modified'), $local-name))">
                    <ctl:message>FAILURE: Unexpected record property: <xsl:value-of select="$local-name"/> (<xsl:value-of select="../dc:identifier"/>)</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                </xsl:for-each>
                <xsl:variable name="r1.modified" select="$response//csw:SearchResults/*[1]/dct:modified" />
                <xsl:variable name="r2.modified" select="$response//csw:SearchResults/*[2]/dct:modified" />
                <xsl:variable name="r3.modified" select="$response//csw:SearchResults/*[3]/dct:modified" />
                <xsl:if test="not(xsd:date($r1.modified) gt xsd:date($r2.modified)) or not(xsd:date($r2.modified) gt xsd:date($r3.modified))">
                  <ctl:message>FAILURE: Search results are not sorted correctly by dct:modified in descending order.</ctl:message>
                  <ctl:fail/>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc5.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having a
      BBOX operator must include all matching record representations.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element contains 1-10 matching csw:Record child elements.</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                        service="CSW" version="2.0.1"
                        resultType="results">
                        <csw:Query typeNames="csw:Record" 
                          xmlns:dc="http://purl.org/dc/elements/1.1/" 
                          xmlns:ows="http://www.opengis.net/ows">
                          <csw:ElementName>./dc:identifier</csw:ElementName>
                          <csw:ElementName>./ows:BoundingBox</csw:ElementName>
                          <csw:Constraint version="1.1.0">
                            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc"
                               xmlns:gml="http://www.opengis.net/gml">
                              <ogc:BBOX>
                                <ogc:PropertyName>./ows:BoundingBox</ogc:PropertyName>
                                <gml:Envelope srsName="urn:x-ogc:def:crs:EPSG:6.11:4326">
                                  <gml:lowerCorner>47.0 -4.5</gml:lowerCorner>
                                  <gml:upperCorner>52.0 1.0</gml:upperCorner>
                                </gml:Envelope>
                              </ogc:BBOX>
                            </ogc:Filter>
                          </csw:Constraint>
                        </csw:Query>
                      </csw:GetRecords>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc5.1.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <ctl:call-test name="ctl:SchematronValidatingParser">
		            <ctl:with-param name="doc" select="$response" />
		            <ctl:with-param name="schema">sch/csw/2.0.1/GetRecords.sch</ctl:with-param>
		            <ctl:with-param name="phase">OneToTenRecordsPhase</ctl:with-param>
	            </ctl:call-test>
                <xsl:if test="count($response//csw:SearchResults/csw:Record) != count($response//csw:SearchResults/*)">
                  <ctl:message>FAILURE: Only csw:Record elements expected in response.</ctl:message>
                  <ctl:fail/>
                </xsl:if>
                <xsl:variable name="env">
                  <gml:Envelope srsName="urn:x-ogc:def:crs:EPSG:6.11:4326">
                    <gml:lowerCorner>47.0 -4.5</gml:lowerCorner>
                    <gml:upperCorner>52.0 1.0</gml:upperCorner>
                  </gml:Envelope>
                </xsl:variable>
                <xsl:for-each select="$response//csw:SearchResults/*">
                  <xsl:if test="csw:disjoint-envelopes($env,ows:BoundingBox) != 0">
                    <ctl:message>FAILURE: Envelopes do NOT intersect or @srsName value does not match 'urn:x-ogc:def:crs:EPSG:6.11:4326'(<xsl:value-of select="dc:identifier"/>)</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc5.2">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having a
      spatial operator that does not refer to a geometry-valued property must 
      include an exception report.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is a valid ows:ExceptionReport; (2) the reported exceptionCode is "InvalidParameterValuePhase".</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc5.2.body.xml"/>-->
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                        service="CSW" version="2.0.1"
                        resultType="results">
                        <csw:Query typeNames="csw:Record">
                          <csw:ElementSetName>brief</csw:ElementSetName>
                          <csw:Constraint version="1.1.0">
                            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc"
                               xmlns:gml="http://www.opengis.net/gml">
                              <ogc:BBOX>
                                <ogc:PropertyName xmlns:dct="http://purl.org/dc/terms/">dct:spatial</ogc:PropertyName>
                                <gml:Envelope srsName="urn:x-ogc:def:crs:EPSG:6.11:4326">
                                  <gml:lowerCorner>47.0 -4.5</gml:lowerCorner>
                                  <gml:upperCorner>52.0 1.0</gml:upperCorner>
                                </gml:Envelope>
                              </ogc:BBOX>
                            </ogc:Filter>
                          </csw:Constraint>
                        </csw:Query>
                      </csw:GetRecords>
					</body>
					<p:XMLValidatingParser.OWS/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <ctl:call-test name="ctl:SchematronValidatingParser">
		            <ctl:with-param name="doc" select="$response" />
		            <ctl:with-param name="schema">sch/ows/1.0.0/ExceptionReport.sch</ctl:with-param>
		            <ctl:with-param name="phase">InvalidParameterValuePhase</ctl:with-param>
	            </ctl:call-test>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc6.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having a
      PropertyIsEqualTo predicate (case-sensitive by default) must include all 
      matching record representations.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element contains exactly one matching csw:BriefRecord instance.</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                        service="CSW" version="2.0.1" resultType="results">
                       <csw:Query typeNames="csw:Record">
                         <csw:ElementSetName>brief</csw:ElementSetName>
                         <csw:Constraint version="1.1.0">
                           <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc" 
                             xmlns:gml="http://www.opengis.net/gml">
                             <ogc:PropertyIsEqualTo>
                               <ogc:PropertyName xmlns:dc="http://purl.org/dc/elements/1.1/">dc:title</ogc:PropertyName>
                               <ogc:Literal>Fuscé vitae ligulä</ogc:Literal>
                             </ogc:PropertyIsEqualTo>
                           </ogc:Filter>
                         </csw:Constraint>
                       </csw:Query>
                     </csw:GetRecords>
                     <!--<xi:include href="./csw-2.0.1-GetRecords-tc6.1.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:choose>
                  <xsl:when test="$response/csw:GetRecordsResponse/csw:SearchResults//dc:identifier='urn:uuid:e9330592-0932-474b-be34-c3a3bb67c7db'" />
                  <xsl:otherwise>
                    <ctl:message>FAILURE: Expected record is missing (urn:uuid:e9330592-0932-474b-be34-c3a3bb67c7db).</ctl:message>
                    <ctl:fail/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc6.2">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having a
      PropertyIsEqualTo predicate (case-insensitive) must include all matching 
      record representations.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element contains exactly one matching csw:BriefRecord instance.</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                        service="CSW" version="2.0.1" resultType="results">
                        <csw:Query typeNames="csw:Record">
                          <csw:ElementSetName>brief</csw:ElementSetName>
                          <csw:Constraint version="1.1.0">
                            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml">
                              <ogc:PropertyIsEqualTo matchCase="false">
                                <ogc:PropertyName xmlns:dc="http://purl.org/dc/elements/1.1/">dc:subject</ogc:PropertyName>
                                <ogc:Literal>pHYSIOGRAPHy</ogc:Literal>
                              </ogc:PropertyIsEqualTo>
                            </ogc:Filter>
                          </csw:Constraint>
                        </csw:Query>
                      </csw:GetRecords>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc6.2.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:choose>
                  <xsl:when test="$response/csw:GetRecordsResponse/csw:SearchResults//dc:identifier='urn:uuid:ab42a8c4-95e8-4630-bf79-33e59241605a'" />
                  <xsl:otherwise>
                    <ctl:message>FAILURE: Expected record is missing (urn:uuid:ab42a8c4-95e8-4630-bf79-33e59241605a).</ctl:message>
                    <ctl:fail/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc7.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an unsupported function 
      must include an exception report.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is a valid ows:ExceptionReport; (2) the reported exceptionCode is "InvalidParameterValue" 
      (ogc:Function/@name).</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                        service="CSW" version="2.0.1" resultType="results">
                        <csw:Query typeNames="csw:Record">
                          <csw:ElementSetName>brief</csw:ElementSetName>
                          <csw:Constraint version="1.1.0">
                            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml">
                              <ogc:PropertyIsEqualTo>
                                <ogc:PropertyName xmlns:dc="http://purl.org/dc/elements/1.1/">dc:title</ogc:PropertyName>
                                <ogc:Function name="DummyFunction">
                                  <ogc:Literal>input.argument</ogc:Literal>
                                </ogc:Function>
                              </ogc:PropertyIsEqualTo>
                            </ogc:Filter>
                          </csw:Constraint>
                        </csw:Query>
                      </csw:GetRecords>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc7.1.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.OWS/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <ctl:call-test name="ctl:SchematronValidatingParser">
		            <ctl:with-param name="doc" select="$response" />
		            <ctl:with-param name="schema">sch/ows/1.0.0/ExceptionReport.sch</ctl:with-param>
		            <ctl:with-param name="phase">InvalidParameterValuePhase</ctl:with-param>
	            </ctl:call-test>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc8.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having a
      PropertyIsNotEqualTo predicate (case-sensitive by default) must exclude  
      matching record representations.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element does NOT contain any records with a matching title.</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                        service="CSW" version="2.0.1" resultType="results">
                       <csw:Query typeNames="csw:Record">
                         <csw:ElementSetName>brief</csw:ElementSetName>
                         <csw:Constraint version="1.1.0">
                           <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc" 
                             xmlns:gml="http://www.opengis.net/gml">
                             <ogc:PropertyIsNotEqualTo>
                               <ogc:PropertyName xmlns:dc="http://purl.org/dc/elements/1.1/">dc:title</ogc:PropertyName>
                               <ogc:Literal>Fuscé vitae ligulä</ogc:Literal>
                             </ogc:PropertyIsNotEqualTo>
                           </ogc:Filter>
                         </csw:Constraint>
                       </csw:Query>
                     </csw:GetRecords>
                     <!--<xi:include href="./csw-2.0.1-GetRecords-tc8.1.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <ctl:call-test name="ctl:SchematronValidatingParser">
		            <ctl:with-param name="doc" select="$response" />
		            <ctl:with-param name="schema">sch/csw/2.0.1/GetRecords.sch</ctl:with-param>
		            <ctl:with-param name="phase">TenRecordsPhase</ctl:with-param>
	            </ctl:call-test>
                <!-- WARNING item to exclude might be buried in large result set -->
                <xsl:for-each select="$response//csw:SearchResults/*">
                  <xsl:if test="dc:identifier = 'urn:uuid:e9330592-0932-474b-be34-c3a3bb67c7db'">
                    <ctl:message>FAILURE: Unexpected record is included (urn:uuid:e9330592-0932-474b-be34-c3a3bb67c7db).</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc8.2">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having a
      PropertyIsNotEqualTo predicate (case-insensitive) must exclude matching 
      record representations.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element does NOT contain any records with a matching subject.</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc8.2.body.xml"/>-->
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                        service="CSW" version="2.0.1" resultType="results" maxRecords="20">
                        <csw:Query typeNames="csw:Record">
                          <csw:ElementSetName>brief</csw:ElementSetName>
                          <csw:Constraint version="1.1.0">
                            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml">
                              <ogc:PropertyIsNotEqualTo matchCase="false">
                                <ogc:PropertyName xmlns:dc="http://purl.org/dc/elements/1.1/">dc:subject</ogc:PropertyName>
                                <ogc:Literal>pHYSIOGRAPHy</ogc:Literal>
                              </ogc:PropertyIsNotEqualTo>
                            </ogc:Filter>
                          </csw:Constraint>
                        </csw:Query>
                      </csw:GetRecords>
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:variable name="recordCount" select="count($response//csw:SearchResults/csw:BriefRecord)" />
                <xsl:if test="$recordCount gt 20">
                  <ctl:message>FAILURE: A maximum of 20 csw:BriefRecord elements expected in response (<xsl:value-of select="$recordCount"/> included)</ctl:message>
                  <ctl:fail/>
                </xsl:if>
                <xsl:for-each select="$response//csw:SearchResults/*">
                  <xsl:if test="compare(upper-case(dc:subject),'PHYSIOGRAPHY') = 0">
                    <ctl:message>FAILURE: Unexpected record having dc:subject matching 'pHYSIOGRAPHy' (case-insensitive) - (<xsl:value-of select="dc:identifier"/>)</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc9.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having a
      PropertyIsGreaterThan predicate must include matching record representations.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element contains 1-10 csw:Record child elements having dct:modified values 
      occurring after 2004-01-01.</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                        service="CSW" version="2.0.1" resultType="results">
                        <csw:Query typeNames="csw:Record"
                          xmlns:dc="http://purl.org/dc/elements/1.1/" 
                          xmlns:dct="http://purl.org/dc/terms/">
                          <csw:ElementName>./dc:identifier</csw:ElementName>
                          <csw:ElementName>./dc:type</csw:ElementName>
                          <csw:ElementName>./dct:modified</csw:ElementName>
                          <csw:Constraint version="1.1.0">
                            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
                              <ogc:PropertyIsGreaterThan>
                                <ogc:PropertyName>dct:modified</ogc:PropertyName>
                                <ogc:Literal>2004-01-01Z</ogc:Literal>
                              </ogc:PropertyIsGreaterThan>
                            </ogc:Filter>
                          </csw:Constraint>
                        </csw:Query>
                      </csw:GetRecords>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc9.1.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <ctl:call-test name="ctl:SchematronValidatingParser">
		            <ctl:with-param name="doc" select="$response" />
		            <ctl:with-param name="schema">sch/csw/2.0.1/GetRecords.sch</ctl:with-param>
		            <ctl:with-param name="phase">OneToTenAdHocRecordsPhase</ctl:with-param>
	            </ctl:call-test>
                <xsl:for-each select="$response//csw:SearchResults/*">
                  <xsl:if test="xsd:date(dct:modified) le xsd:date('2004-01-01Z')">
                    <ctl:message>FAILURE: Included record modified on or before 2004-01-01Z (<xsl:value-of select="dct:modified"/>)</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc10.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having a
      PropertyIsLessThan predicate must include matching record representations.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element contains 1-10 csw:Record child elements having dct:modified values 
      occurring before 2006-05-01.</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                        service="CSW" version="2.0.1" resultType="results">
                        <csw:Query typeNames="csw:Record"
                          xmlns:dc="http://purl.org/dc/elements/1.1/" 
                          xmlns:dct="http://purl.org/dc/terms/">
                          <csw:ElementName>./dc:identifier</csw:ElementName>
                          <csw:ElementName>./dc:type</csw:ElementName>
                          <csw:ElementName>./dct:modified</csw:ElementName>
                          <csw:Constraint version="1.1.0">
                            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
                              <ogc:PropertyIsLessThan>
                                <ogc:PropertyName>dct:modified</ogc:PropertyName>
                                <ogc:Literal>2006-05-01Z</ogc:Literal>
                              </ogc:PropertyIsLessThan>
                            </ogc:Filter>
                          </csw:Constraint>
                        </csw:Query>
                      </csw:GetRecords>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc10.1.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <ctl:call-test name="ctl:SchematronValidatingParser">
		            <ctl:with-param name="doc" select="$response" />
		            <ctl:with-param name="schema">sch/csw/2.0.1/GetRecords.sch</ctl:with-param>
		            <ctl:with-param name="phase">OneToTenAdHocRecordsPhase</ctl:with-param>
	            </ctl:call-test>
                <xsl:for-each select="$response//csw:SearchResults/*">
                  <xsl:if test="xsd:date(dct:modified) ge xsd:date('2006-05-01Z')">
                    <ctl:message>FAILURE: Included record modified on or after 2006-05-01Z (<xsl:value-of select="dct:modified"/>)</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc11.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having a
      PropertyIsLike predicate must include matching record representations.
      </assertion>
      <comment>Pass if the csw:SearchResults element contains only csw:SummaryRecord 
      instances having a dc:title value starting with the string "Lorem ipsum".</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                        service="CSW" version="2.0.1" resultType="results">
                        <csw:Query typeNames="csw:Record">
                          <csw:ElementSetName>summary</csw:ElementSetName>
                          <csw:Constraint version="1.1.0">
                            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
                              <ogc:PropertyIsLike wildCard="*" singleChar="?" escapeChar="\" >
                                <ogc:PropertyName xmlns:dc="http://purl.org/dc/elements/1.1/">dc:title</ogc:PropertyName>
                                <ogc:Literal>Lorem ipsum*</ogc:Literal>
                              </ogc:PropertyIsLike>
                            </ogc:Filter>
                          </csw:Constraint>
                        </csw:Query>
                      </csw:GetRecords>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc11.1.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:if test="count($response//csw:SearchResults/csw:SummaryRecord) lt 2">
                  <ctl:message>FAILURE: At least two csw:SummaryRecord elements expected in response.</ctl:message>
                  <ctl:fail/>
                </xsl:if>
                <xsl:for-each select="$response//csw:SearchResults/*">
                  <xsl:if test="starts-with(dc:title,'Lorem ipsum') != true()">
                    <ctl:message>FAILURE: Unexpected record is included (dc:title does not match expression "Lorem ipsum*")</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc11.2">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having a
      PropertyIsLike predicate must include matching record representations.
      </assertion>
      <comment>Pass if the csw:SearchResults element contains only csw:SummaryRecord 
      instances having a dct:modified value satisfying the expression 200?-10-*.</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                        service="CSW" version="2.0.1" resultType="results">
                        <csw:Query typeNames="csw:Record">
                          <csw:ElementSetName>summary</csw:ElementSetName>
                          <csw:Constraint version="1.1.0">
                            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
                              <ogc:PropertyIsLike wildCard="*" singleChar="?" escapeChar="\" >
                                <ogc:PropertyName xmlns:dct="http://purl.org/dc/terms/">dct:modified</ogc:PropertyName>
                                <ogc:Literal>200?-10-*</ogc:Literal>
                              </ogc:PropertyIsLike>
                            </ogc:Filter>
                          </csw:Constraint>
                        </csw:Query>
                      </csw:GetRecords>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc11.2.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:if test="count($response//csw:SearchResults/csw:SummaryRecord) lt 1">
                  <ctl:message>FAILURE: AT least one csw:SummaryRecord element expected in response.</ctl:message>
                  <ctl:fail/>
                </xsl:if>
                <xsl:for-each select="$response//csw:SearchResults/*">
                  <xsl:if test="matches(dct:modified,'200\d-10-.*') != true()">
                    <ctl:message>FAILURE: Unexpected record is included (dct:modified does not match expression "200?-10-*")</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc12.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having a
      PropertyIsLessThanOrEqualTo predicate must include matching record 
      representations.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element contains at least two csw:Record elements having dct:modified 
      values occurring on or before 2005-10-24.</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                        service="CSW" version="2.0.1" resultType="results">
                        <csw:Query typeNames="csw:Record" 
                          xmlns:dc="http://purl.org/dc/elements/1.1/" 
                          xmlns:dct="http://purl.org/dc/terms/">
                          <csw:ElementName>./dc:identifier</csw:ElementName>
                          <csw:ElementName>./dc:type</csw:ElementName>
                          <csw:ElementName>./dct:modified</csw:ElementName>
                          <csw:Constraint version="1.1.0">
                            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
                              <ogc:PropertyIsLessThanOrEqualTo>
                                <ogc:PropertyName>dct:modified</ogc:PropertyName>
                                <ogc:Literal>2005-10-24Z</ogc:Literal>
                              </ogc:PropertyIsLessThanOrEqualTo>
                            </ogc:Filter>
                          </csw:Constraint>
                        </csw:Query>
                      </csw:GetRecords>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc12.1.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:if test="count($response//csw:SearchResults/csw:Record) lt 2">
                  <ctl:message>FAILURE: AT least two csw:Record elements expected in response.</ctl:message>
                  <ctl:fail/>
                </xsl:if>
                <xsl:for-each select="$response//csw:SearchResults/*">
                  <xsl:if test="xsd:date(dct:modified) gt xsd:date('2005-10-24Z')">
                    <ctl:message>FAILURE: Included record modified after 2005-10-24Z (<xsl:value-of select="dct:modified"/>)</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc13.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having a
      PropertyIsGreaterThanOrEqualTo predicate must include matching record 
      representations.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element contains at least two csw:Record elements having dct:modified 
      values occurring on or after 2006-03-26.</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                        service="CSW" version="2.0.1" resultType="results">
                        <csw:Query typeNames="csw:Record" 
                          xmlns:dc="http://purl.org/dc/elements/1.1/" 
                          xmlns:dct="http://purl.org/dc/terms/">
                          <csw:ElementName>./dc:identifier</csw:ElementName>
                          <csw:ElementName>./dc:type</csw:ElementName>
                          <csw:ElementName>./dct:modified</csw:ElementName>
                          <csw:Constraint version="1.1.0">
                            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
                              <ogc:PropertyIsGreaterThanOrEqualTo>
                                <ogc:PropertyName>dct:modified</ogc:PropertyName>
                                <ogc:Literal>2006-03-26Z</ogc:Literal>
                              </ogc:PropertyIsGreaterThanOrEqualTo>
                            </ogc:Filter>
                          </csw:Constraint>
                        </csw:Query>
                      </csw:GetRecords>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc13.1.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:if test="count($response//csw:SearchResults/csw:Record) lt 2">
                  <ctl:message>FAILURE: AT least two csw:Record elements expected in response.</ctl:message>
                  <ctl:fail/>
                </xsl:if>
                <xsl:for-each select="$response//csw:SearchResults/*">
                  <xsl:if test="xsd:date(dct:modified) lt xsd:date('2006-03-26Z')">
                    <ctl:message>FAILURE: Included record modified before 2006-03-26Z (<xsl:value-of select="dct:modified"/>)</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc14.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having a
      Not logical predicate must include only matching record representations.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element contains 10-20 csw:SummaryRecord elements having titles that do 
      not start with the string "Lorem ipsum".</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                        service="CSW" version="2.0.1" resultType="results" maxRecords="20">
                        <csw:Query typeNames="csw:Record">
                          <csw:ElementSetName>summary</csw:ElementSetName>
                          <csw:Constraint version="1.1.0">
                            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
                              <ogc:Not>
                              <ogc:PropertyIsLike wildCard="*" singleChar="?" escapeChar="\" >
                                <ogc:PropertyName xmlns:dc="http://purl.org/dc/elements/1.1/">dc:title</ogc:PropertyName>
                                <ogc:Literal>Lorem ipsum*</ogc:Literal>
                              </ogc:PropertyIsLike>
                              </ogc:Not>
                            </ogc:Filter>
                          </csw:Constraint>
                        </csw:Query>
                      </csw:GetRecords>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc14.1.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:variable name="summaryRecCount" select="count($response//csw:SearchResults/csw:SummaryRecord)" />
                <xsl:if test="($summaryRecCount &lt; 10) or ($summaryRecCount &gt; 20)">
                  <ctl:message>FAILURE: 10-20 csw:SummaryRecord elements expected in response (<xsl:value-of select="$summaryRecCount"/> included)</ctl:message>
                  <ctl:fail/>
                </xsl:if>
                <xsl:for-each select="$response//csw:SearchResults/*">
                  <xsl:if test="starts-with(dc:title,'Lorem ipsum') = true()">
                    <ctl:message>FAILURE: Unexpected record is included (dc:title starts with "Lorem ipsum*")</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc14.2">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having a
      Not logical predicate must include only matching record representations.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element contains 11-20 csw:Record elements having extents that are either 
      disjoint from the given bounding box or have no ows:BoundingBox child element.</comment>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                        service="CSW" version="2.0.1" resultType="results" maxRecords="20">
                        <csw:Query typeNames="csw:Record" 
                          xmlns:dc="http://purl.org/dc/elements/1.1/" 
                          xmlns:ows="http://www.opengis.net/ows">
                          <csw:ElementName>./dc:identifier</csw:ElementName>
                          <csw:ElementName>./ows:BoundingBox</csw:ElementName>
                          <csw:Constraint version="1.1.0">
                            <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml">
                              <ogc:Not>
                               <ogc:BBOX>
                                 <ogc:PropertyName>ows:BoundingBox</ogc:PropertyName>
                                 <gml:Envelope srsName="urn:x-ogc:def:crs:EPSG:6.11:4326">
                                   <gml:lowerCorner>60.0 12.0</gml:lowerCorner>
                                   <gml:upperCorner>70.0 20.0</gml:upperCorner>
                                 </gml:Envelope>
                               </ogc:BBOX>
                             </ogc:Not>
                           </ogc:Filter>
                         </csw:Constraint>
                       </csw:Query>
                     </csw:GetRecords>
                     <!--<xi:include href="./csw-2.0.1-GetRecords-tc14.2.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:variable name="recordCount" select="count($response//csw:SearchResults/csw:Record)" />
                <xsl:if test="($recordCount lt 11) or ($recordCount gt 20)">
                  <ctl:message>FAILURE: 11-20 csw:Record elements expected in response (<xsl:value-of select="$recordCount"/> included)</ctl:message>
                  <ctl:fail/>
                </xsl:if>
                <xsl:variable name="env">
                  <gml:Envelope srsName="urn:x-ogc:def:crs:EPSG:6.11:4326">
                    <gml:lowerCorner>60.0 12.0</gml:lowerCorner>
                    <gml:upperCorner>70.0 20.0</gml:upperCorner>
                  </gml:Envelope>
                </xsl:variable>
                <xsl:for-each select="$response//csw:SearchResults/*">
                  <xsl:if test="ows:BoundingBox">
                      <xsl:if test="csw:disjoint-envelopes($env,ows:BoundingBox) != 1">
						<ctl:message>FAILURE: Envelopes intersect (<xsl:value-of select="dc:identifier"/>)</ctl:message>
						<ctl:fail/>
					  </xsl:if>
				  </xsl:if>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc15.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an invalid filter 
      expression must include an exception report.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is a valid ows:ExceptionReport; (2) the reported exceptionCode is "NoApplicableCode".</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                      <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                        service="CSW" version="2.0.1" resultType="hits">
                        <csw:Query typeNames="csw:Record">
                          <csw:ElementSetName>brief</csw:ElementSetName>
                          <csw:Constraint version="1.1.0">
                            <ogc:Filter xmlns:ogc="http://www.opengis.net/foo">
                              <ogc:PropertyIsEqualTo>
                                <ogc:PropertyName xmlns:dc="http://purl.org/dc/elements/1.1/">dc:title</ogc:PropertyName>
                                <ogc:Literal>Maecenas enim</ogc:Literal>
                              </ogc:PropertyIsEqualTo>
                            </ogc:Filter>
                          </csw:Constraint>
                        </csw:Query>
                      </csw:GetRecords>
                      <!--<xi:include href="./csw-2.0.1-GetRecords-tc15.1.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.OWS/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <ctl:call-test name="ctl:SchematronValidatingParser">
		            <ctl:with-param name="doc" select="$response" />
		            <ctl:with-param name="schema">sch/ows/1.0.0/ExceptionReport.sch</ctl:with-param>
		            <ctl:with-param name="phase">NoApplicableCodePhase</ctl:with-param>
	            </ctl:call-test>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc16.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having 
      the Or logical predicate must include only matching record representations.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element contains 1-10 csw:SummaryRecord elements that have dc:type = 
      "http://purl.org/dc/dcmitype/Image" OR dc:format = "application/*xml".</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                     <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                       service="CSW" version="2.0.1" resultType="results">
                       <csw:Query typeNames="csw:Record">
                         <csw:ElementSetName>summary</csw:ElementSetName>
                         <csw:Constraint version="1.1.0">
                           <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
                             <ogc:Or>
                               <ogc:PropertyIsLike wildCard="*" singleChar="?" escapeChar="\" >
                                 <ogc:PropertyName xmlns:dc="http://purl.org/dc/elements/1.1/">dc:format</ogc:PropertyName>
                                 <ogc:Literal>application/*xml</ogc:Literal>
                               </ogc:PropertyIsLike>
                               <ogc:PropertyIsEqualTo>
                                 <ogc:PropertyName xmlns:dc="http://purl.org/dc/elements/1.1/">dc:type</ogc:PropertyName>
                                 <ogc:Literal>http://purl.org/dc/dcmitype/Image</ogc:Literal>
                               </ogc:PropertyIsEqualTo>
                             </ogc:Or>
                           </ogc:Filter>
                         </csw:Constraint>
                       </csw:Query>
                     </csw:GetRecords>
                     <!--<xi:include href="./csw-2.0.1-GetRecords-tc16.1.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <ctl:call-test name="ctl:SchematronValidatingParser">
		            <ctl:with-param name="doc" select="$response" />
		            <ctl:with-param name="schema">sch/csw/2.0.1/GetRecords.sch</ctl:with-param>
		            <ctl:with-param name="phase">TypeFormatElementsPhase</ctl:with-param>
	            </ctl:call-test>
                <xsl:for-each select="$response//csw:SummaryRecord">
                  <xsl:if test="not(dc:format or dc:type)">
                    <ctl:message>FAILURE: csw:Record is missing an expected property: dc:format or dc:type (<xsl:value-of select="dc:identifier"/>)</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                  <xsl:choose>
                    <xsl:when test="dc:format and dc:type">
                      <xsl:if test="(dc:type/text() != 'http://purl.org/dc/dcmitype/Image') and (matches(dc:format/text(),'application/.*\+?xml') != true())">
                        <ctl:message>FAILURE: dc:type != "http://purl.org/dc/dcmitype/Image" AND dc:format does not match expression "application/*xml" (<xsl:value-of select="dc:identifier"/>)</ctl:message>
                        <ctl:fail/>
                      </xsl:if>
                    </xsl:when>
                    <xsl:when test="dc:format">
                      <xsl:if test="matches(dc:format/text(),'application/.*\+?xml') != true()">
                          <ctl:message>FAILURE: dc:format does not match expression "application/*xml" (<xsl:value-of select="dc:identifier"/>)</ctl:message>
                          <ctl:fail/>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="dc:type/text() != 'http://purl.org/dc/dcmitype/Image'">
                          <ctl:message>FAILURE: dc:type != "http://purl.org/dc/dcmitype/Image" (<xsl:value-of select="dc:identifier"/>)</ctl:message>
                          <ctl:fail/>
                        </xsl:if>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc16.2">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having 
      the Or logical predicate must include only matching record representations.
      </assertion>
      <comment>Pass if all of the following conditions are true: (1) the response 
      is schema valid; (2) SearchStatus/@status="complete"; (3) the csw:SearchResults 
      element contains 1-10 csw:Record child elements that have a matching extent OR 
      were modified after 2006-01-01.</comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                     <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                       service="CSW" version="2.0.1" resultType="results">
                       <csw:Query typeNames="csw:Record" 
                         xmlns:dc="http://purl.org/dc/elements/1.1/"
                         xmlns:ows="http://www.opengis.net/ows"
                         xmlns:dct="http://purl.org/dc/terms/">
                         <csw:ElementName>./dc:identifier</csw:ElementName>
                         <csw:ElementName>./dct:modified</csw:ElementName>
                         <csw:ElementName>./ows:BoundingBox</csw:ElementName>
                         <csw:Constraint version="1.1.0">
                           <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml">
                             <ogc:Or>
                               <ogc:BBOX>
                                 <ogc:PropertyName>ows:BoundingBox</ogc:PropertyName>
                                 <gml:Envelope srsName="urn:x-ogc:def:crs:EPSG:6.11:4326">
                                   <gml:lowerCorner>47.0 -4.5</gml:lowerCorner>
                                   <gml:upperCorner>52.0 1.0</gml:upperCorner>
                                 </gml:Envelope>
                               </ogc:BBOX>
                               <ogc:PropertyIsGreaterThan>
                                 <ogc:PropertyName>dct:modified</ogc:PropertyName>
                                 <ogc:Literal>2006-01-01Z</ogc:Literal>
                               </ogc:PropertyIsGreaterThan>
                             </ogc:Or>
                           </ogc:Filter>
                         </csw:Constraint>
                       </csw:Query>
                     </csw:GetRecords>
                     <!--<xi:include href="./csw-2.0.1-GetRecords-tc16.2.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:variable name="env">
                  <gml:Envelope srsName="urn:x-ogc:def:crs:EPSG:6.11:4326">
                    <gml:lowerCorner>47.0 -4.5</gml:lowerCorner>
                    <gml:upperCorner>52.0 1.0</gml:upperCorner>
                  </gml:Envelope>
                </xsl:variable>
                <xsl:for-each select="$response//csw:Record">
                  <xsl:if test="not(dct:modified or ows:BoundingBox)">
                    <ctl:message>FAILURE: csw:Record is missing an expected property: dct:modified or ows:BoundingBox (<xsl:value-of select="dc:identifier"/>)</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                  <xsl:choose>
                    <xsl:when test="dct:modified and ows:BoundingBox">
                      <xsl:if test="(xsd:date(dct:modified) le xsd:date('2006-01-01Z')) and (csw:disjoint-envelopes($env,ows:BoundingBox) != 0)">
                        <ctl:message>FAILURE: Record modified on or before 2006-01-01Z AND envelopes do not intersect (<xsl:value-of select="dc:identifier"/>)</ctl:message>
                        <ctl:fail/>
                      </xsl:if>
                    </xsl:when>
                    <xsl:when test="dct:modified">
                      <xsl:if test="xsd:date(dct:modified) le xsd:date('2006-01-01Z')">
                          <ctl:message>FAILURE: Record modified on or before 2006-01-01Z (<xsl:value-of select="dc:identifier"/>)</ctl:message>
                          <ctl:fail/>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="csw:disjoint-envelopes($env,ows:BoundingBox) != 0">
                          <ctl:message>FAILURE: envelopes do not intersect (<xsl:value-of select="dc:identifier"/>)</ctl:message>
                          <ctl:fail/>
                        </xsl:if>
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc17.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having 
      the And logical predicate must include only matching record representations.
      </assertion>
      <comment>
      Pass if the csw:SearchResults element contains 1-10 csw:SummaryRecord 
      elements that have dc:format="image/*" AND are related to the given record.
      </comment>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                    <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                      service="CSW" version="2.0.1" resultType="results">
                      <csw:Query typeNames="csw:Record">
                        <csw:ElementSetName>summary</csw:ElementSetName>
                        <csw:Constraint version="1.1.0">
                          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
                            <ogc:And>
                              <ogc:PropertyIsLike wildCard="*" singleChar="?" escapeChar="\" >
                                <ogc:PropertyName xmlns:dc="http://purl.org/dc/elements/1.1/">dc:format</ogc:PropertyName>
                                <ogc:Literal>image/*</ogc:Literal>
                              </ogc:PropertyIsLike>
                              <ogc:PropertyIsEqualTo>
                                <ogc:PropertyName xmlns:dc="http://purl.org/dc/elements/1.1/">dc:relation</ogc:PropertyName>
                                <ogc:Literal>urn:uuid:9a669547-b69b-469f-a11f-2d875366bbdc</ogc:Literal>
                              </ogc:PropertyIsEqualTo>
                            </ogc:And>
                          </ogc:Filter>
                        </csw:Constraint>
                      </csw:Query>
                    </csw:GetRecords>
                    <!--<xi:include href="./csw-2.0.1-GetRecords-tc17.1.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
			
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:variable name="recordCount" select="count($response//csw:SearchResults/csw:SummaryRecord)" />
                <xsl:if test="($recordCount lt 1) or ($recordCount gt 10)">
                  <ctl:message>FAILURE: 1-10 csw:SummaryRecord elements expected in response (<xsl:value-of select="$recordCount"/> included)</ctl:message>
                  <ctl:fail/>
                </xsl:if>
                <xsl:for-each select="$response//csw:SearchResults/*">
                  <xsl:if test="dc:relation != 'urn:uuid:9a669547-b69b-469f-a11f-2d875366bbdc'">
                    <ctl:message>FAILURE: Record not related to 'urn:uuid:9a669547-b69b-469f-a11f-2d875366bbdc' (<xsl:value-of select="dc:identifier"/>)</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                  <xsl:if test="matches(dc:format,'image/.*') != true()">
                    <ctl:message>FAILURE: dc:format does not match expression "image/*" (<xsl:value-of select="dc:identifier"/>)</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc17.2">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having 
      the And logical predicate must include only matching record representations.
      </assertion>
      <comment>
      Pass if the csw:SearchResults element contains 1-10 csw:Record elements 
      that have envelopes intersecting the given bounding box AND were modified 
      after 2006-01-01.
      </comment>
      <link>csw-</link>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                    <csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
                      service="CSW" version="2.0.1" resultType="results">
                      <csw:Query typeNames="csw:Record" 
                        xmlns:dc="http://purl.org/dc/elements/1.1/"
                        xmlns:ows="http://www.opengis.net/ows"
                        xmlns:dct="http://purl.org/dc/terms/">
                        <csw:ElementName>./dc:identifier</csw:ElementName>
                        <csw:ElementName>./dct:modified</csw:ElementName>
                        <csw:ElementName>./ows:BoundingBox</csw:ElementName>
                        <csw:Constraint version="1.1.0">
                          <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml">
                            <ogc:And>
                              <ogc:BBOX>
                                <ogc:PropertyName>ows:BoundingBox</ogc:PropertyName>
                                <gml:Envelope srsName="urn:x-ogc:def:crs:EPSG:6.11:4326">
                                  <gml:lowerCorner>47.0 -4.5</gml:lowerCorner>
                                  <gml:upperCorner>52.0 1.0</gml:upperCorner>
                                </gml:Envelope>
                              </ogc:BBOX> 
                              <ogc:PropertyIsGreaterThan>
                                <ogc:PropertyName>dct:modified</ogc:PropertyName>
                                <ogc:Literal>2006-01-01Z</ogc:Literal>
                              </ogc:PropertyIsGreaterThan>
                            </ogc:And>
                          </ogc:Filter>
                        </csw:Constraint>
                      </csw:Query>
                    </csw:GetRecords>
                    <!--<xi:include href="./csw-2.0.1-GetRecords-tc17.2.body.xml"/>-->
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
         
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:variable name="recordCount" select="count($response//csw:SearchResults/csw:Record)" />
                <xsl:if test="($recordCount &lt; 1) or ($recordCount &gt; 10)">
                  <ctl:message>FAILURE: 1-10 csw:Record elements expected in response (<xsl:value-of select="$recordCount"/> included)</ctl:message>
                  <ctl:fail/>
                </xsl:if>
                <xsl:variable name="env">
                  <gml:Envelope srsName="urn:x-ogc:def:crs:EPSG:6.11:4326">
                    <gml:lowerCorner>47.0 -4.5</gml:lowerCorner>
                    <gml:upperCorner>52.0 1.0</gml:upperCorner>
                  </gml:Envelope>
                </xsl:variable>
                <xsl:for-each select="$response//csw:SearchResults/*">
                  <xsl:if test="xsd:date(dct:modified) le xsd:date('2006-01-01Z')">
                    <ctl:message>FAILURE: dct:modified value on or before 2006-01-01Z (<xsl:value-of select="dc:identifier"/>)</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                  <xsl:if test="csw:disjoint-envelopes($env,ows:BoundingBox) != 0">
                    <ctl:message>FAILURE: Envelopes do NOT intersect (<xsl:value-of select="dc:identifier"/>)</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc18.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having 
      the And logical predicate must include the specified view of records that 
      satisfy all constraints.
      </assertion>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                    <!--<xi:include href="./csw-2.0.1-GetRecords-tc18.1.body.xml"/>-->
<csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
  service="CSW" version="2.0.1" resultType="results">
  <csw:Query typeNames="csw:Record" xmlns:ows="http://www.opengis.net/ows">
    <csw:ElementName>./dc:identifier</csw:ElementName>
    <csw:ElementName>./dc:type</csw:ElementName>
    <csw:ElementName>./ows:BoundingBox</csw:ElementName>
    <csw:Constraint version="1.1.0">
      <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml">
        <ogc:And>
          <ogc:Not>
            <ogc:BBOX>
              <ogc:PropertyName>ows:BoundingBox</ogc:PropertyName>
              <gml:Envelope srsName="urn:x-ogc:def:crs:EPSG:6.11:4326">
                <gml:lowerCorner>40.0 -9.0</gml:lowerCorner>
                <gml:upperCorner>50.0 -5.0</gml:upperCorner>
              </gml:Envelope>
            </ogc:BBOX>
          </ogc:Not>
          <ogc:PropertyIsEqualTo matchCase="false">
            <ogc:PropertyName xmlns:dc="http://purl.org/dc/elements/1.1/">dc:type</ogc:PropertyName>
            <ogc:Literal>HTTP://purl.org/dc/dcmitype/dataset</ogc:Literal>
          </ogc:PropertyIsEqualTo>
        </ogc:And>
      </ogc:Filter>
    </csw:Constraint>
  </csw:Query>
</csw:GetRecords>
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:variable name="recordCount" select="count($response//csw:SearchResults/csw:Record)" />
                <xsl:if test="($recordCount &lt; 1) or ($recordCount &gt; 10)">
                  <ctl:message>FAILURE: 1-10 csw:Record elements expected in response (<xsl:value-of select="$recordCount"/> included)</ctl:message>
                  <ctl:fail/>
                </xsl:if>
                <xsl:variable name="env">
                  <gml:Envelope srsName="urn:x-ogc:def:crs:EPSG:6.11:4326">
                    <gml:lowerCorner>40.0 -9.0</gml:lowerCorner>
                    <gml:upperCorner>50.0 -5.0</gml:upperCorner>
                  </gml:Envelope>
                </xsl:variable>
                <xsl:for-each select="$response//csw:SearchResults/*">
                  <xsl:if test="compare(lower-case(dc:type),'http://purl.org/dc/dcmitype/dataset') != 0">
                    <ctl:message>FAILURE: Unexpected record having dc:type not matching 'HTTP://purl.org/dc/dcmitype/dataset' (case-insensitive) - (<xsl:value-of select="dc:identifier"/>)</ctl:message>
                    <ctl:fail/>
                  </xsl:if>
                  <xsl:if test="ows:BoundingBox">
                      <xsl:if test="csw:disjoint-envelopes($env,ows:BoundingBox) != 1">
                        <ctl:message>FAILURE: Envelopes intersect (<xsl:value-of select="dc:identifier"/>)</ctl:message>
                        <ctl:fail/>
                      </xsl:if>
				  </xsl:if>
                </xsl:for-each>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
    
    <test name="csw:csw-2.0.1-GetRecords-tc19.1">
      <param name="csw.GetRecords.post.url"/>
      <assertion>
      The response to a GetRecords request that includes an ogc:Filter having a
      PropertyIsLike predicate must include the specified view of all matching 
      records. If a PropertyName value is not supplied, the predicate is evaluated 
      against all applicable record properties.
      </assertion>
		<code>
			<xsl:variable name="response">
				<request>
					<url>
						<xsl:value-of select="$csw.GetRecords.post.url"/>
					</url>
                    <method>POST</method>
					<body>
                    <!--<xi:include href="./csw-2.0.1-GetRecords-tc19.1.body.xml"/>-->
<csw:GetRecords xmlns:csw="http://www.opengis.net/cat/csw"
  service="CSW" version="2.0.1" resultType="results">
  <csw:Query typeNames="csw:Record">
    <csw:ElementSetName>full</csw:ElementSetName>
    <csw:Constraint version="1.1.0">
      <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
        <ogc:PropertyIsLike wildCard="*" singleChar="." escapeChar="\" >
          <ogc:PropertyName />
          <ogc:Literal>*lorem*</ogc:Literal>
        </ogc:PropertyIsLike>
      </ogc:Filter>
    </csw:Constraint>
  </csw:Query>
</csw:GetRecords>  
                      
					</body>
					<p:XMLValidatingParser.CSW/>
				</request>
			</xsl:variable>
            <xsl:choose>
              <xsl:when test="not($response/*)">
                  <ctl:message>FAILURE: Missing or invalid response entity.</ctl:message>
                  <ctl:fail/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:if test="count($response//csw:SearchResults/csw:Record) lt 5">
                  <ctl:message>FAILURE: Expected at least 5 csw:Record elements with property values matching the expression "*lorem*".</ctl:message>
                  <ctl:fail/>
                </xsl:if>
              </xsl:otherwise>
            </xsl:choose>
		</code>
	</test>
</ctl:package>
