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
 xmlns:xlink="http://www.w3.org/1999/xlink"
 xmlns:xi="http://www.w3.org/2001/XInclude">

   <!-- include test groups -->
   <xi:include href="GetCapabilities/GetCapabilities-GET.ctl"/>
   <xi:include href="DescribeRecord/DescribeRecord-POST.ctl"/>
   <xi:include href="GetRecordById/GetRecordById-GET.ctl"/>
   <xi:include href="GetRecords/GetRecords-POST.ctl"/>

   <ctl:test name="csw:capability-tests">
      <ctl:param name="csw.GetCapabilities.document"/>
      <ctl:assertion>Run all applicable capability tests.</ctl:assertion>
      <ctl:code>
          <!-- run mandatory test groups -->
          <ctl:call-test name="csw:run-GetCapabilities-GET">
            <ctl:with-param name="csw.GetCapabilities.document" select="$csw.GetCapabilities.document"/>
          </ctl:call-test>
          <ctl:call-test name="csw:run-DescribeRecord-POST">
            <ctl:with-param name="csw.GetCapabilities.document" select="$csw.GetCapabilities.document"/>
          </ctl:call-test>
          <ctl:call-test name="csw:run-GetRecordById-GET">
            <ctl:with-param name="csw.GetCapabilities.document" select="$csw.GetCapabilities.document"/>
          </ctl:call-test>
          <ctl:call-test name="csw:run-GetRecords-POST">
            <ctl:with-param name="csw.GetCapabilities.document" select="$csw.GetCapabilities.document"/>
          </ctl:call-test>

          <!-- run test groups for optional HTTP bindings that have been implemented -->
          <xsl:if test="$csw.GetCapabilities.document//ows:OperationsMetadata/ows:Operation[@name='GetCapabilities']/ows:DCP/ows:HTTP/ows:Post/@xlink:href">
            <ctl:message>GetCapabilities using POST method is implemented.</ctl:message>
          </xsl:if>
          <xsl:if test="$csw.GetCapabilities.document//ows:OperationsMetadata/ows:Operation[@name='DescribeRecord']/ows:DCP/ows:HTTP/ows:Get/@xlink:href">
            <ctl:message>DescribeRecord using GET method is implemented.</ctl:message>
          </xsl:if>
          <xsl:if test="$csw.GetCapabilities.document//ows:OperationsMetadata/ows:Operation[@name='GetRecords']/ows:DCP/ows:HTTP/ows:Get/@xlink:href">
            <ctl:message>GetRecords using GET method is implemented.</ctl:message>
          </xsl:if>
          <xsl:if test="$csw.GetCapabilities.document//ows:OperationsMetadata/ows:Operation[@name='GetRecordById']/ows:DCP/ows:HTTP/ows:Post/@xlink:href">
            <ctl:message>GetRecordById using POST method is implemented.</ctl:message>
          </xsl:if>
          <xsl:if test="$csw.GetCapabilities.document//ows:OperationsMetadata/ows:Operation[@name='GetDomain']/ows:DCP/ows:HTTP/ows:Post/@xlink:href">
            <ctl:message>GetDomain using POST method is implemented.</ctl:message>
          </xsl:if>
      </ctl:code>
   </ctl:test>
</ctl:package>
