<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://www.ascc.net/xml/schematron" 
  defaultPhase="DefaultPhase"
  version="1.5">

  <sch:title>Rules for WRS-1.0.0 GetCapabilities response entities.</sch:title>
  
  <sch:ns prefix="wrs" uri="http://www.opengis.net/cat/wrs/1.0"/>
  <sch:ns prefix="ows" uri="http://www.opengis.net/ows"/>
  <sch:ns prefix="ogc" uri="http://www.opengis.net/ogc"/>
  <sch:ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>
  
  <sch:phase id="DefaultPhase">
    <sch:active pattern="CapabilitiesPattern"/>
    <sch:active pattern="ServiceInfoPattern"/>
  </sch:phase>
  
  <sch:phase id="CapabilitiesDocPhase">
    <sch:active pattern="CapabilitiesPattern"/>
  </sch:phase>

  <sch:phase id="RequiredElementsPhase">
    <sch:active pattern="CapabilitiesPattern"/>
    <sch:active pattern="RequiredBindingsPattern"/>
    <sch:active pattern="RequiredOperatorsPattern"/>
    <sch:active pattern="RequiredConstraintsPattern"/>
    <sch:active pattern="RequiredParametersPattern"/>
  </sch:phase>
  
  <sch:phase id="AbbreviatedContentPhase">
    <sch:active pattern="CapabilitiesPattern"/>
    <sch:active pattern="MinimalContentPattern"/>
  </sch:phase>
  
  <sch:pattern id="CapabilitiesPattern" name="CapabilitiesPattern">
    <sch:p xml:lang="en">Checks that the document is a WRS v1.0.0 capabilities document.</sch:p>
    <sch:rule id="docElement" context="/">
      <sch:assert id="docElement.infoset" 
        test="wrs:Capabilities"
        diagnostics="includedDocElem">
	The document element must have [local name] = "Capabilities" and [namespace name] = "http://www.opengis.net/cat/wrs/1.0".
      </sch:assert>
      <sch:assert id="docElement.version" 
        test="wrs:Capabilities/@version='1.0.0'">
	The @version attribute must have the value "1.0.0".
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern id="ServiceInfoPattern" name="ServiceInfoPattern">
    <sch:p xml:lang="en">Checks for the presence of all optional child elements.</sch:p>
    <sch:rule id="docElement.children" context="/wrs:Capabilities">
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
    <sch:rule id="RequiredBindings" context="/wrs:Capabilities">
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
  
  <sch:pattern id="RequiredConstraintsPattern" name="RequiredConstraintsPattern">
    <sch:p xml:lang="en">
    Checks that all required CSW operational constraints are present.
    </sch:p>
    <sch:rule id="RequiredConstraints" context="/wrs:Capabilities/ows:OperationsMetadata">
      <sch:assert id="GetRecordsPostEncoding" 
        test="(ows:Constraint[@name='PostEncoding']/ows:Value = 'XML') or 
        (ows:Operation[@name='GetRecords']/ows:Constraint[@name='PostEncoding']/ows:Value = 'XML')">
	Missing mandatory PostEncoding constraint for GetRecords POST, "XML".
      </sch:assert>
      <sch:assert id="DescribeRecordPostEncoding" 
        test="(ows:Constraint[@name='PostEncoding']/ows:Value = 'XML') or 
        (ows:Operation[@name='DescribeRecord']/ows:Constraint[@name='PostEncoding']/ows:Value = 'XML')">
	Missing mandatory PostEncoding constraint for DescribeRecord POST, "XML".
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
  
  <sch:pattern id="MinimalContentPattern" name="MinimalContentPattern">
    <sch:p xml:lang="en">Checks that all optional child elements are not included.</sch:p>
    <sch:rule id="optional.content" context="/wrs:Capabilities">
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
