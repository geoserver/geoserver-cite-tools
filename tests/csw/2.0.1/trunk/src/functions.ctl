<?xml version="1.0" encoding="UTF-8"?>
<ctl:package
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:ctl="http://www.occamlab.com/ctl"
 xmlns:saxon="http://saxon.sf.net/"
 xmlns:ows="http://www.opengis.net/ows"
 xmlns:gml="http://www.opengis.net/gml"
 xmlns:csw="http://www.opengis.net/cat/csw">

	<!-- Sample usage:
    (1)
    <ctl:call-test name="ctl:assert-xpath">
		<ctl:with-param name="expr">/csw:Capabilities</ctl:with-param>
		<ctl:with-param name="doc" select="$doc"/>
    </ctl:call-test>
    (2)
    <xsl:variable name="expression">/csw:Capabilities</xsl:variable>
	<ctl:call-test name="ctl:assert-xpath">
	    <ctl:with-param name="expr" select="$expression"/>
	    <ctl:with-param name="doc" select="$doc"/>
	</ctl:call-test>
    -->
	<ctl:test name="ctl:assert-xpath">
		<ctl:param name="expr">An XPath expression</ctl:param>
		<ctl:param name="doc">An XML document</ctl:param>
		<ctl:assertion>
        Evaluates the given XPath expression against the input document and 
        returns a boolean result according to the XPath specification (see 
        http://www.w3.org/TR/xpath#section-Boolean-Functions).
        </ctl:assertion>
		<ctl:code>
			<xsl:for-each select="$doc">
				<xsl:choose>
					<xsl:when test="saxon:evaluate($expr)"/>
					<xsl:otherwise>
						<ctl:message>The expression '<xsl:value-of select="$expr"/>' is false.</ctl:message>
						<ctl:fail/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</ctl:code>
	</ctl:test>
	
   <ctl:function name="ctl:version-as-integer">
      <ctl:param name="version-string">Version String</ctl:param>
      <ctl:description>Gets the integer value of a version number</ctl:description>
      <ctl:code>
         <xsl:variable name="major" select="substring-before($version-string, '.')"/>
         <xsl:variable name="minor" select="substring-before(substring-after($version-string, '.'), '.')"/>
         <xsl:variable name="patch" select="substring-after(substring-after($version-string, '.'), '.')"/>
         <xsl-value-of select="$major * 10000 + $minor * 100 + $patch"/>
      </ctl:code>
   </ctl:function>
   
   <ctl:function name="csw:disjoint-envelopes">
      <ctl:param name="env">The gml:Envelope specifying the area of interest</ctl:param>
      <ctl:param name="bbox">The ows:BoundingBox describing some csw:Record</ctl:param>
      <ctl:return>
      Returns '1' if the envelopes are disjoint or '0' if they are not (i.e. they 
      intersect). Returns '-1' if the CRS references do not match.
      </ctl:return>
      <ctl:description>Determines if two envelopes are disjoint. If not, they intersect.</ctl:description>
      <ctl:code>
         <xsl:variable name="minX1" select="xsd:decimal(substring-before($env//gml:lowerCorner, ' '))" />
         <xsl:variable name="maxX1" select="xsd:decimal(substring-before($env//gml:upperCorner, ' '))" />
         <xsl:variable name="minY1" select="xsd:decimal(substring-after($env//gml:lowerCorner, ' '))" />
         <xsl:variable name="maxY1" select="xsd:decimal(substring-after($env//gml:upperCorner, ' '))" />
         <xsl:variable name="minX2" select="xsd:decimal(substring-before($bbox//ows:LowerCorner, ' '))" />
         <xsl:variable name="maxX2" select="xsd:decimal(substring-before($bbox//ows:UpperCorner, ' '))" />
         <xsl:variable name="minY2" select="xsd:decimal(substring-after($bbox//ows:LowerCorner, ' '))" />
         <xsl:variable name="maxY2" select="xsd:decimal(substring-after($bbox//ows:UpperCorner, ' '))" />
         <xsl:choose>
            <xsl:when test="$env//@srsName != $bbox//@crs">-1</xsl:when>
            <xsl:when test="($minX2 gt $maxX1) or ($minY2 gt $maxY1) or ($maxX2 lt $minX1) or ($maxY2 lt $minY1)">1</xsl:when>
            <xsl:otherwise>0</xsl:otherwise>
         </xsl:choose>
      </ctl:code>
   </ctl:function>
</ctl:package>