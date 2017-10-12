<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tns="http://cite.opengeospatial.org/csw"
  xmlns:ows="http://www.opengis.net/ows"
  xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:rim="urn:oasis:names:tc:ebxml-regrep:xsd:rim:3.0"
  xmlns:wrs="http://www.opengis.net/cat/wrs/1.0"
  xmlns:csw="http://www.opengis.net/cat/csw/2.0.2"
  xmlns:gml="http://www.opengis.net/gml"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:dct="http://purl.org/dc/terms/"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  exclude-result-prefixes="dct dc ogc ows tns">			

  <xsl:output method="xml" indent="yes" encoding="UTF-8" />
  <xsl:variable name="type-mappings" select="document('type-mappings.xml')"/>
  
  <xsl:template match="/">
    <csw:Insert handle="test-data-csw">
      <xsl:for-each select="//csw:Record">
        <xsl:variable name="id" select="dc:identifier[1]/text()"/>
        <xsl:choose>
          <xsl:when test="contains(dc:type/text(),'Service')">
            <xsl:call-template name="Service">
              <xsl:with-param name="id" select="$id" />
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="ExtrinsicObject">
              <xsl:with-param name="id" select="$id" />
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
        <xsl:apply-templates select="dc:relation">
          <xsl:with-param name="sourceId" select="$id" />
        </xsl:apply-templates>
      </xsl:for-each>
    </csw:Insert>
  </xsl:template>
  
  <xsl:template name="ExtrinsicObject">
    <xsl:param name="id" />
    <xsl:variable name="uuid" select="substring-after($id,'urn:uuid:')"/>
    <wrs:ExtrinsicObject>
      <xsl:call-template name="RegistryObject">
        <xsl:with-param name="id" select="$id" />
      </xsl:call-template>
      <xsl:element name="wrs:repositoryItemRef">
        <xsl:attribute name="xlink:type">simple</xsl:attribute>
        <xsl:attribute name="xlink:href"><xsl:value-of select="concat('cid:',$uuid,'@example.net')" /></xsl:attribute>
      </xsl:element>
    </wrs:ExtrinsicObject>
  </xsl:template>
  
  <xsl:template name="Service">
    <xsl:param name="id" />
    <rim:Service>
      <xsl:call-template name="RegistryObject">
        <xsl:with-param name="id" select="$id" />
      </xsl:call-template>
    </rim:Service>
  </xsl:template>
  
  <xsl:template name="RegistryObject">
    <xsl:param name="id" />
    <xsl:choose>
      <xsl:when test="starts-with($id,'urn:uuid:')">
        <xsl:attribute name="id"><xsl:value-of select="$id" /></xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="id"><xsl:value-of select="generate-id()" /></xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="dc:format">
      <xsl:attribute name="mimeType">
        <xsl:value-of select="dc:format" />
      </xsl:attribute>
    </xsl:if>    
    <xsl:apply-templates select="dc:type">
      <xsl:with-param name="mappings" select="$type-mappings" />
    </xsl:apply-templates>
    <xsl:apply-templates select="dct:modified" />
    <xsl:apply-templates select="ows:BoundingBox" />
    <xsl:apply-templates select="dc:title" />
    <xsl:apply-templates select="dct:abstract" />
    <xsl:if test="count(dc:identifier) > 1">
      <xsl:for-each select="dc:identifier[position() > 1]">
        <xsl:call-template name="ExternalIdentifier">
          <xsl:with-param name="id" select="$id" />
        </xsl:call-template>
      </xsl:for-each>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="dct:modified">
    <rim:Slot>
      <xsl:attribute name="name">http://purl.org/dc/terms/modified</xsl:attribute>
      <xsl:attribute name="slotType">urn:oasis:names:tc:ebxml-regrep:DataType:DateTime</xsl:attribute>
      <rim:ValueList>
        <xsl:element name="rim:Value"><xsl:value-of select="." /></xsl:element>
      </rim:ValueList>
    </rim:Slot>
  </xsl:template>
  
  <xsl:template match="ows:BoundingBox">
    <rim:Slot>
      <xsl:attribute name="name">http://purl.org/dc/terms/spatial</xsl:attribute>
      <xsl:attribute name="slotType">urn:ogc:def:dataType:ISO-19107:GM_Envelope</xsl:attribute>
      <wrs:ValueList>
        <wrs:AnyValue>
          <gml:Envelope>
            <xsl:attribute name="srsName" >
              <xsl:value-of select="@crs" />
            </xsl:attribute>
            <xsl:element name="gml:lowerCorner">
              <xsl:value-of select="ows:LowerCorner" />
            </xsl:element>
            <xsl:element name="gml:upperCorner">
              <xsl:value-of select="ows:UpperCorner" />
            </xsl:element>
          </gml:Envelope>
        </wrs:AnyValue>
      </wrs:ValueList>
    </rim:Slot>
  </xsl:template>
  
  <xsl:template match="dc:title">
    <rim:Name>
      <rim:LocalizedString>
        <xsl:attribute name="value" >
          <xsl:value-of select="." />
        </xsl:attribute>
      </rim:LocalizedString>
    </rim:Name>
  </xsl:template>
  
  <xsl:template match="dct:abstract">
    <rim:Description>
      <rim:LocalizedString>
        <xsl:attribute name="value" >
          <xsl:value-of select="." />
        </xsl:attribute>
      </rim:LocalizedString>
    </rim:Description>
  </xsl:template>
  
  <xsl:template name="ExternalIdentifier">
    <xsl:param name="id" />
    <rim:ExternalIdentifier id="{generate-id()}">
      <xsl:attribute name="identificationScheme">http://www.ietf.org/rfc/rfc3986</xsl:attribute>
      <xsl:attribute name="registryObject" >
        <xsl:value-of select="$id" />
      </xsl:attribute>
      <xsl:attribute name="value" >
        <xsl:value-of select="." />
      </xsl:attribute>
    </rim:ExternalIdentifier>
  </xsl:template>
  
  <xsl:template match="dc:relation">
    <xsl:param name="sourceId" />
    <rim:Association id="{generate-id()}">
      <xsl:attribute name="associationType">urn:oasis:names:tc:ebxml-regrep:AssociationType:RelatedTo</xsl:attribute>
      <xsl:attribute name="sourceObject" >
        <xsl:value-of select="$sourceId" />
      </xsl:attribute>
      <xsl:attribute name="targetObject" >
        <xsl:value-of select="." />
      </xsl:attribute>
    </rim:Association>
  </xsl:template>
  
  <xsl:template match="dc:type">
    <xsl:param name="mappings" />
    <xsl:variable name="typeName" select="."/>
    <xsl:attribute name="objectType">
      <xsl:value-of select="$mappings/type-mappings/objectType[@dc:type = $typeName]" />
    </xsl:attribute>
  </xsl:template>
</xsl:stylesheet>
