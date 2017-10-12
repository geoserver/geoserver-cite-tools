<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://www.ascc.net/xml/schematron" 
  defaultPhase="DefaultPhase" 
  version="1.5">
  
  <sch:title>Rules for WRS 1.0.</sch:title>
  
  <sch:ns prefix="wrs" uri="http://www.opengis.net/cat/wrs/1.0"/>
  <sch:ns prefix="rim" uri="urn:oasis:names:tc:ebxml-regrep:xsd:rim:3.0"/>
  <sch:ns prefix="xsd" uri="http://www.w3.org/2001/XMLSchema"/>
  
  <sch:phase id="DefaultPhase">
    <sch:active pattern="ComplexSlotValuesPattern"/>
  </sch:phase>
  
  <sch:phase id="BriefViewPhase">
    <sch:active pattern="RegistryObjectsOnlyPattern"/>
    <sch:active pattern="BriefViewPattern"/>
  </sch:phase>
  
  <sch:phase id="FullViewPhase">
    <sch:active pattern="FullViewPattern"/>
  </sch:phase>
  
  <sch:pattern id="RegistryObjectsOnlyPattern" name="RegistryObjectsOnlyPattern">
    <sch:p xml:lang="en">Checks that only rim:RegistryObject representations are included.</sch:p>
    <sch:rule context="/csw:GetRecordByIdResponse">
      <sch:assert test="count(rim:RegistryObject) = count(*)">Expected only rim:RegistryObject instances in response.</sch:assert>
    </sch:rule>
    <sch:rule context="//csw:SearchResults">
      <sch:assert test="count(rim:RegistryObject) = count(*)">Expected only rim:RegistryObject instances in response.</sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern id="BriefViewPattern" name="BriefViewPattern">
    <sch:p xml:lang="en">Checks that registry objects conform to the 'brief' view.</sch:p>
    <sch:rule id="GetRecordByIdResponse.BriefView" context="/csw:GetRecordByIdResponse/*">
      <sch:assert test="@lid" diagnostics="elem.id">Registry object is missing @lid attribute</sch:assert>
      <sch:assert test="@objectType">Registry object is missing @objectType attribute</sch:assert>
      <sch:assert test="@status">Registry object is missing @status attribute</sch:assert>
      <sch:assert test="rim:VersionInfo">Registry object is missing VersionInfo element</sch:assert>
      <sch:report test="rim:Slot">Registry object has Slot element </sch:report>
      <sch:report test="rim:Name">Registry object has Name element</sch:report>
      <sch:report test="rim:Description">Registry object has Description element</sch:report>
      <sch:report test="rim:Classification">Registry object has Classification element</sch:report>
      <sch:report test="rim:ExternalIdentifier">Registry object has ExternalIdentifier element</sch:report>
    </sch:rule>
    <sch:rule id="GetRecordsResponse.BriefView" context="//csw:SearchResults/*">
      <sch:assert test="@lid" diagnostics="elem.id">Registry object is missing @lid attribute</sch:assert>
      <sch:assert test="@objectType">Registry object is missing @objectType attribute</sch:assert>
      <sch:assert test="@status">Registry object is missing @status attribute</sch:assert>
      <sch:assert test="rim:VersionInfo">Registry object is missing VersionInfo element</sch:assert>
      <sch:report test="rim:Slot">Registry object has Slot element </sch:report>
      <sch:report test="rim:Name">Registry object has Name element</sch:report>
      <sch:report test="rim:Description">Registry object has Description element</sch:report>
      <sch:report test="rim:Classification">Registry object has Classification element</sch:report>
      <sch:report test="rim:ExternalIdentifier">Registry object has ExternalIdentifier element</sch:report>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern id="FullViewPattern" name="FullViewPattern">
    <sch:p xml:lang="en">Checks that registry objects conform to the 'full' view.</sch:p>
    <sch:rule id="GetRecordByIdResponse.FullView" context="/csw:GetRecordByIdResponse/*">
      <sch:report test="local-name(.) = 'RegistryObject'">Registry object has [local-name] = "RegistryObject".</sch:report>
      <sch:assert test="@lid">Registry object is missing @lid attribute</sch:assert>
      <sch:assert test="@objectType">Registry object is missing @objectType attribute</sch:assert>
      <sch:assert test="@status">Registry object is missing @status attribute</sch:assert>
      <sch:assert test="rim:VersionInfo">Registry object is missing VersionInfo element</sch:assert>
    </sch:rule>
    <sch:rule id="GetRecordsResponse.FullView" context="//csw:SearchResults/*">
      <sch:report test="local-name(.) = 'RegistryObject'">Registry object has [local-name] = "RegistryObject".</sch:report>
      <sch:assert test="@lid">Registry object is missing @lid attribute</sch:assert>
      <sch:assert test="@objectType">Registry object is missing @objectType attribute</sch:assert>
      <sch:assert test="@status">Registry object is missing @status attribute</sch:assert>
      <sch:assert test="rim:VersionInfo">Registry object is missing VersionInfo element</sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern id="ComplexSlotValuesPattern" name="ComplexSlotValuesPattern">
    <sch:rule context="//wrs:ValueList">
      <sch:report test="rim:Value">wrs:ValueList contains prohibited rim:Value element--use wrs:AnyValue.</sch:report>
    </sch:rule>
  </sch:pattern>
  
  <sch:diagnostics>
  </sch:diagnostics>
</sch:schema>
