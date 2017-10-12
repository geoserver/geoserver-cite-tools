<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://www.ascc.net/xml/schematron" 
  defaultPhase="NoSearchResultsPhase" 
  version="1.5">
  
  <sch:title>Rules for WRS 1.0 GetRecords response entities.</sch:title>
  
  <sch:ns prefix="rim" uri="urn:oasis:names:tc:ebxml-regrep:xsd:rim:3.0"/>
  <sch:ns prefix="csw" uri="http://www.opengis.net/cat/csw/2.0.2"/>

  <sch:phase id="DefaultPhase">
    <sch:active pattern="GetRecordsResponsePattern"/>
    <sch:active pattern="EmptySearchResultsPattern"/>
    <sch:active pattern="OneOrMoreHitsPattern"/>
  </sch:phase>
  
  <sch:phase id="NoSearchResultsPhase">
    <sch:active pattern="GetRecordsResponsePattern"/>
    <sch:active pattern="EmptySearchResultsPattern"/>
  </sch:phase>

  <sch:phase id="TenRecordsPhase">
    <sch:active pattern="GetRecordsResponsePattern"/>
    <sch:active pattern="TenRecordsPattern"/>
  </sch:phase>
  
  <sch:pattern id="GetRecordsResponsePattern" name="GetRecordsResponsePattern">
    <sch:p xml:lang="en">Checks that the document element is csw:GetRecordsResponse.</sch:p>
    <sch:rule context="/">
      <sch:assert test="csw:GetRecordsResponse" diagnostics="includedDocElem">
	The document element must have [local name] = "GetRecordsResponse" and [namespace name] = "http://www.opengis.net/cat/csw/2.0.2".
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern id="EmptySearchResultsPattern" name="EmptySearchResultsPattern">
    <sch:p xml:lang="en">Checks that no records are included in the response.</sch:p>
    <sch:rule id="HitsOnly" context="/csw:GetRecordsResponse">
      <sch:assert id="SearchResults.empty" 
        test="count(csw:SearchResults/*) = 0"
        diagnostics="recordCount">Expected empty csw:SearchResults element.</sch:assert>
      <sch:assert test="csw:SearchResults/@numberOfRecordsReturned = 0">
	Expected csw:SearchResults/@numberOfRecordsReturned = 0
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern id="OneOrMoreHitsPattern" name="OneOrMoreHitsPattern">
    <sch:p xml:lang="en">Checks that one or more hits are reported.</sch:p>
    <sch:rule id="OneOrMoreHits" context="/csw:GetRecordsResponse">
      <sch:assert id="OneOrMoreRecordsMatched" 
        test="csw:SearchResults/@numberOfRecordsMatched > 0">
	csw:SearchResults/@numberOfRecordsMatched must be greater than zero.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <sch:pattern id="TenRecordsPattern" name="TenRecordsPattern">
    <sch:p xml:lang="en">Checks that the number of hits exceeds 10 and that only 10 records are included in the response.</sch:p>
    <sch:rule id="TenRecords" context="/csw:GetRecordsResponse">
      <sch:assert id="SearchResults.10" 
        test="count(csw:SearchResults/*) = 10"
        diagnostics="recordCount">
	The csw:SearchResults element must contain 10 records.
      </sch:assert>
      <sch:assert id="RecordsReturnedeq10" 
        test="csw:SearchResults/@numberOfRecordsReturned = 10">
	csw:SearchResults/@numberOfRecordsReturned does not equal 10.
      </sch:assert>
      <sch:assert id="RecordsMatchedgt10" 
        test="csw:SearchResults/@numberOfRecordsMatched > 10"
        diagnostics="hitCount">
	csw:SearchResults/@numberOfRecordsMatched must exceed 10.
      </sch:assert>
    </sch:rule>
  </sch:pattern>
  
  <sch:diagnostics>
    <sch:diagnostic id="includedDocElem">
    The included document element has [local name] = <sch:value-of select="local-name(/*[1])"/> 
    and [namespace name] = <sch:value-of select="namespace-uri(/*[1])"/>.
    </sch:diagnostic>
    <sch:diagnostic id="recordCount">
    There are <sch:value-of select="count(csw:SearchResults/*)"/> records included in the response.
    </sch:diagnostic>
    <sch:diagnostic id="hitCount">
    There are <sch:value-of select="csw:SearchResults/@numberOfRecordsMatched"/> hits reported.
    </sch:diagnostic>
  </sch:diagnostics>
</sch:schema>
