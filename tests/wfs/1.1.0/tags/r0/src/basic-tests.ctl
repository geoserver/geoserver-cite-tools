<?xml version="1.0" encoding="UTF-8"?>
<ctl:package
 xmlns="http://www.w3.org/2001/XMLSchema"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:ctl="http://www.occamlab.com/ctl"
 xmlns:parsers="http://www.occamlab.com/te/parsers"
 xmlns:p="http://teamengine.sourceforge.net/parsers"
 xmlns:saxon="http://saxon.sf.net/"
 xmlns:wfs="http://www.opengis.net/wfs"
 xmlns:ows="http://www.opengis.net/ows"
 xmlns:xlink="http://www.w3.org/1999/xlink" 
 xmlns:xi="http://www.w3.org/2001/XInclude"
 xmlns:xsd="http://www.w3.org/2001/XMLSchema">

	<xi:include href="basic/GetCapabilities/GetCapabilities-GET.xml"/>
	<xi:include href="basic/GetCapabilities/GetCapabilities-POST.xml"/>
	<xi:include href="basic/DescribeFeature/DescribeFeatureType-GET.xml"/>
	<xi:include href="basic/DescribeFeature/DescribeFeatureType-POST.xml"/>
	<xi:include href="basic/GetFeature/GetFeature-GET.xml"/>
	<xi:include href="basic/GetFeature/GetFeature-POST.xml"/>

	<ctl:test name="ctl:basic-main">
      <ctl:param name="wfs.GetCapabilities.document"/>
      <ctl:param name="gmlsf.profile.level"/>

		<ctl:assertion>Tests the WFS 1.1.0 basic capabilities and operations.</ctl:assertion>
		<ctl:code>
		
			<!-- Discover endpoints to be used in tests -->
			<xsl:variable name="wfs.GetCapabilities.get.url">
				<xsl:value-of select="$wfs.GetCapabilities.document//ows:OperationsMetadata/ows:Operation[@name='GetCapabilities']/ows:DCP/ows:HTTP/ows:Get/@xlink:href"/>
			</xsl:variable>
			<xsl:variable name="wfs.GetCapabilities.post.url">
				<xsl:value-of select="$wfs.GetCapabilities.document//ows:OperationsMetadata/ows:Operation[@name='GetCapabilities']/ows:DCP/ows:HTTP/ows:Post/@xlink:href"/>
			</xsl:variable>	
			<xsl:variable name="wfs.DescribeFeatureType.get.url">
				<xsl:value-of select="$wfs.GetCapabilities.document//ows:OperationsMetadata/ows:Operation[@name='DescribeFeatureType']/ows:DCP/ows:HTTP/ows:Get/@xlink:href"/>
			</xsl:variable>	
			<xsl:variable name="wfs.DescribeFeatureType.post.url">
				<xsl:value-of select="$wfs.GetCapabilities.document//ows:OperationsMetadata/ows:Operation[@name='DescribeFeatureType']/ows:DCP/ows:HTTP/ows:Post/@xlink:href"/>
			</xsl:variable>	
			<xsl:variable name="wfs.GetFeature.get.url">
				<xsl:value-of select="$wfs.GetCapabilities.document//ows:OperationsMetadata/ows:Operation[@name='GetFeature']/ows:DCP/ows:HTTP/ows:Get/@xlink:href"/>
			</xsl:variable>	
			<xsl:variable name="wfs.GetFeature.post.url">
				<xsl:value-of select="$wfs.GetCapabilities.document//ows:OperationsMetadata/ows:Operation[@name='GetFeature']/ows:DCP/ows:HTTP/ows:Post/@xlink:href"/>
			</xsl:variable> 				  
			
			<xsl:choose>
				<xsl:when test="$wfs.GetCapabilities.get.url = '' or 
				($wfs.DescribeFeatureType.post.url = '' and $wfs.DescribeFeatureType.get.url = '') or 
				($wfs.GetFeature.post.url = '' and $wfs.GetFeature.get.url = '')">
					<ctl:message>ERROR: Mandatory endpoints not found!</ctl:message>
					<ctl:fail/>				
				</xsl:when>
				<xsl:otherwise>
				
					<!-- Run mandatory test groups -->
					<ctl:call-test name="wfs:run-GetCapabilities-GET">
						<ctl:with-param name="wfs.GetCapabilities.document" select="$wfs.GetCapabilities.document"/>
					</ctl:call-test>
					<!--At least one DescribeFeatureType expected-->
					<xsl:if test="not($wfs.DescribeFeatureType.post.url = '')">					
						<ctl:call-test name="wfs:run-DescribeFeatureType-POST">
							<ctl:with-param name="wfs.GetCapabilities.document" select="$wfs.GetCapabilities.document"/>
							<ctl:with-param name="gmlsf.profile.level" select="$gmlsf.profile.level"/>							
						</ctl:call-test>
					</xsl:if>
					<xsl:if test="not($wfs.DescribeFeatureType.get.url = '')">
						<ctl:call-test name="wfs:run-DescribeFeatureType-GET">
							<ctl:with-param name="wfs.GetCapabilities.document" select="$wfs.GetCapabilities.document"/>
							<ctl:with-param name="gmlsf.profile.level" select="$gmlsf.profile.level"/>								
						</ctl:call-test>
					</xsl:if>				
					<!--At least one GetFeature expected-->	
					<xsl:if test="not($wfs.GetFeature.post.url = '')">					
						<ctl:call-test name="wfs:run-GetFeature-POST">
							<ctl:with-param name="wfs.GetCapabilities.document" select="$wfs.GetCapabilities.document"/>
							<ctl:with-param name="gmlsf.profile.level" select="$gmlsf.profile.level"/>
						</ctl:call-test>
					</xsl:if>
					<xsl:if test="not($wfs.GetFeature.get.url = '')">
						<ctl:call-test name="wfs:run-GetFeature-GET">
							<ctl:with-param name="wfs.GetCapabilities.document" select="$wfs.GetCapabilities.document"/>
						</ctl:call-test>
					</xsl:if>
					
					<!-- Run test groups for optional capabilities that are implemented (operation level) -->
					<xsl:if test="not($wfs.GetCapabilities.post.url = '')">
						<ctl:call-test name="wfs:run-GetCapabilities-POST">
							<ctl:with-param name="wfs.GetCapabilities.document" select="$wfs.GetCapabilities.document"/>
						</ctl:call-test>
					</xsl:if>
							
				</xsl:otherwise>
			</xsl:choose>

		</ctl:code>
	</ctl:test>	
	
</ctl:package>
