<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://www.ascc.net/xml/schematron" 
  defaultPhase="DefaultPhase" 
  version="1.5">
  
  <sch:title>Rules for CSW-2.0.1 GetCapabilities response entities.</sch:title>
  
  <sch:ns prefix="csw" uri="http://www.opengis.net/cat/csw"/>
  <sch:ns prefix="ows" uri="http://www.opengis.net/ows"/>
  <sch:ns prefix="ogc" uri="http://www.opengis.net/ogc"/>
  <sch:ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>
  
  <sch:phase id="DefaultPhase">
    <sch:active pattern="CapabilitiesPattern"/>
    <sch:active pattern="OptionalElementsPattern"/>
  </sch:phase>
  
  <sch:phase id="CapabilitiesDocPhase">
    <sch:active pattern="CapabilitiesPattern"/>
  </sch:phase>

  <sch:phase id="RequiredElementsPhase">
    <sch:active pattern="CapabilitiesPattern"/>
    <sch:active pattern="RequiredBindingsPattern"/>
    <sch:active pattern="RequiredOperatorsPattern"/>
  </sch:phase>
  
  <sch:phase id="AbbreviatedContentPhase">
    <sch:active pattern="CapabilitiesPattern"/>
    <sch:active pattern="AbbreviatedContentPattern"/>
  </sch:phase>
  
  <sch:pattern id="CapabilitiesPattern" name="CapabilitiesPattern">
    <sch:p xml:lang="en">Checks that the document is a CSW v2.0.1 capabilities document.</sch:p>
    <sch:rule id="docElement" context="/">
      <sch:assert id="docElement.infoset" 
        test="csw:Capabilities"
        diagnostics="includedDocElem">
	The document element must have [local name] = "Capabilities" and [namespace name] = "http://www.opengis.net/cat/csw".
      </sch:assert>
      <sch:assert id="docElement.version" 
        test="csw:Capabilities/@version='2.0.1'">
	The @version attribute must have the value "2.0.1".
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern id="OptionalElementsPattern" name="OptionalElementsPattern">
    <sch:p xml:lang="en">Checks for the presence of all optional child elements.</sch:p>
    <sch:rule id="docElement.children" context="/csw:Capabilities">
      <sch:assert id="ServiceIdentification" 
        test="ows:ServiceIdentification">
	Document is incomplete: the ows:ServiceIdentification element is missing.
      </sch:assert>
      <sch:assert id="ServiceProvider" 
        test="ows:ServiceProvider">
	Document is incomplete: the ows:ServiceProvider element is missing.
      </sch:assert>
      <sch:assert id="OperationsMetadata" 
        test="ows:OperationsMetadata">
	Document is incomplete: the ows:OperationsMetadata element is missing.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern id="RequiredBindingsPattern" name="RequiredBindingsPattern">
    <sch:p xml:lang="en">
    Checks that all HTTP method bindings required for CSW implementations are present.
    </sch:p>
    <sch:rule id="RequiredBindings" context="/csw:Capabilities">
      <sch:assert id="GetCapabilities-GET" 
        test="ows:OperationsMetadata/ows:Operation[@name='GetCapabilities']/ows:DCP/ows:HTTP/ows:Get/@xlink:href">
	Missing mandatory binding for GetCapabilities using the GET method.
      </sch:assert>
      <sch:assert id="DescribeRecord-POST" 
        test="ows:OperationsMetadata/ows:Operation[@name='DescribeRecord']/ows:DCP/ows:HTTP/ows:Post/@xlink:href">
	Missing mandatory binding for DescribeRecord using the POST method.
      </sch:assert>
      <sch:assert id="GetRecords-POST" 
        test="ows:OperationsMetadata/ows:Operation[@name='GetRecords']/ows:DCP/ows:HTTP/ows:Post/@xlink:href">
	Missing mandatory binding for GetRecords request using the POST method.
      </sch:assert>
      <sch:assert id="GetRecordById-GET" 
        test="ows:OperationsMetadata/ows:Operation[@name='GetRecordById']/ows:DCP/ows:HTTP/ows:Get/@xlink:href">
	Missing mandatory binding for GetRecordById using the GET method.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern id="RequiredOperatorsPattern" name="RequiredOperatorsPattern">
    <sch:p xml:lang="en">
    Checks that the mandatory set of filter predicates are supported.
    </sch:p>
    <sch:rule id="RequiredOperators" context="//ogc:Filter_Capabilities">
      <sch:assert id="SpatialOperators.BBOX" 
        test="ogc:Spatial_Capabilities/ogc:SpatialOperators/ogc:SpatialOperator[@name='BBOX']">Missing mandatory spatial operator: BBOX.</sch:assert>
      <sch:assert id="ComparisonOperators.EqualTo" 
        test="ogc:Scalar_Capabilities/ogc:ComparisonOperators/ogc:ComparisonOperator = 'EqualTo'">Missing mandatory comparison operator: EqualTo.</sch:assert>
      <sch:assert id="ComparisonOperators.NotEqualTo" 
        test="ogc:Scalar_Capabilities/ogc:ComparisonOperators/ogc:ComparisonOperator = 'NotEqualTo'">Missing mandatory comparison operator: NotEqualTo.</sch:assert>
      <sch:assert id="ComparisonOperators.LessThan" 
        test="ogc:Scalar_Capabilities/ogc:ComparisonOperators/ogc:ComparisonOperator = 'LessThan'">Missing mandatory comparison operator: LessThan.</sch:assert>
      <sch:assert id="ComparisonOperators.GreaterThan" 
        test="ogc:Scalar_Capabilities/ogc:ComparisonOperators/ogc:ComparisonOperator = 'GreaterThan'">Missing mandatory comparison operator: GreaterThan.</sch:assert>        
      <sch:assert id="ComparisonOperators.LessThanEqualTo" 
        test="ogc:Scalar_Capabilities/ogc:ComparisonOperators/ogc:ComparisonOperator = 'LessThanEqualTo'">Missing mandatory comparison operator: LessThanEqualTo.</sch:assert>
      <sch:assert id="ComparisonOperators.GreaterThanEqualTo" 
        test="ogc:Scalar_Capabilities/ogc:ComparisonOperators/ogc:ComparisonOperator = 'GreaterThanEqualTo'">Missing mandatory comparison operator: GreaterThanEqualTo.</sch:assert>    
      <sch:assert id="ComparisonOperators.Like" 
        test="ogc:Scalar_Capabilities/ogc:ComparisonOperators/ogc:ComparisonOperator = 'Like'">Missing mandatory comparison operator: Like.</sch:assert>
      <sch:assert id="LogicalOperators" 
        test="ogc:Scalar_Capabilities/ogc:LogicalOperators">Missing mandatory logical operators (And, Or, Not).</sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern id="AbbreviatedContentPattern" name="AbbreviatedContentPattern">
    <sch:p xml:lang="en">
    Checks that all optional top-level elements are not included.
    </sch:p>
    <sch:rule id="optional.content" context="/csw:Capabilities">
      <sch:report id="NoServiceIdentification" 
        test="ows:ServiceIdentification">
	The ows:ServiceIdentification element is included.
      </sch:report>
      <sch:report id="NoServiceProvider" 
        test="ows:ServiceProvider">
	The ows:ServiceProvider element is included.
      </sch:report>
      <sch:report id="NoOperationsMetadata" 
        test="ows:OperationsMetadata">
	The ows:OperationsMetadata element is included.
      </sch:report>
    </sch:rule>
  </sch:pattern>
  
  <sch:diagnostics>
    <sch:diagnostic id="includedDocElem">
    The included document element has [local name] = <sch:value-of select="local-name(/*[1])"/> 
    and [namespace name] = <sch:value-of select="namespace-uri(/*[1])"/>.
    </sch:diagnostic>
  </sch:diagnostics>
</sch:schema>
