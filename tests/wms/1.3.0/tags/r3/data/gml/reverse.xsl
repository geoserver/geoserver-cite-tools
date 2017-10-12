<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:gml="http://www.opengis.net/gml"
 version="1.0"
>
	<!-- This stylesheet may be used to reverse coordinate order and assign a different SRS -->

	<xsl:param name="srs">CRS:84</xsl:param>
	<xsl:output indent="yes" omit-xml-declaration="yes"/>
	<xsl:strip-space elements="*"/>

	<xsl:template name="process">
		<xsl:param name="coords"/>
		<xsl:variable name="pair1" select="substring-before(concat($coords, ' '), ' ')"/>
		<xsl:value-of select="substring-after($pair1, ',')"/>
		<xsl:value-of select="','"/>
		<xsl:value-of select="substring-before($pair1, ',')"/>
		<xsl:if test="contains($coords, ' ')">
			<xsl:value-of select="' '"/>
			<xsl:call-template name="process">
				<xsl:with-param name="coords" select="substring-after($coords, ' ')"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>

	<xsl:template match="@srsName">
		<xsl:attribute name="srsName">
			<xsl:value-of select="$srs"/>
		</xsl:attribute>
	</xsl:template>

	<xsl:template match="gml:coordinates">
		<xsl:copy>
			<xsl:call-template name="process">
				<xsl:with-param name="coords" select="normalize-space(.)"/>
			</xsl:call-template>
		</xsl:copy>
	</xsl:template>

 	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
</xsl:transform>
