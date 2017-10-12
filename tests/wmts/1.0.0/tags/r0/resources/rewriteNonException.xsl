<xsl:transform
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:wmts="http://www.opengis.net/wmts/1.0"
 xmlns:ows="http://www.opengis.net/ows/1.1" 
 xmlns:xlink="http://www.w3.org/1999/xlink"
 version="2.0">
	<xsl:output indent="yes"/>
	<!-- Template called by XSLTransformationParser to return ows:ExceptionReport or just root element and its attributes from HTTPParser content -->
<!--	<xsl:template match="/">
		<xsl:apply-templates/>	
	</xsl:template> -->

	<xsl:template match="ows:ExceptionReport">
		<xsl:copy-of select="."/>
	</xsl:template>
	
	<xsl:template match="ExceptionReport">
		<xsl:copy-of select="."/>	
	</xsl:template>

 	<xsl:template match="@*">
		<xsl:copy-of select="."/>
	</xsl:template>

 	<xsl:template match="*">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
		</xsl:copy>
	</xsl:template>
</xsl:transform>
