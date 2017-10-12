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
 xmlns:xi="http://www.w3.org/2001/XInclude"
 xmlns:xsd="http://www.w3.org/2001/XMLSchema">

	<!--=========-->
	<!-- PARSERS -->
	<!--=========-->
	
	<!-- Used to call the schematron validator outside the request element, i.e.: -->
	<!--<ctl:call-test name="ctl:SchematronValidatingParser">
		<ctl:with-param name="doc" select="$cap-doc"/>
		<ctl:with-param name="schematronFile">sch/wfs/1.1.0/WFSCapabilities.sch</ctl:with-param>
		<ctl:with-param name="phase">Default</ctl:with-param>
	</ctl:call-test>-->
	<ctl:test name="ctl:SchematronValidatingParser">
			<ctl:param name="doc"/>
			<ctl:param name="schema"/>
			<ctl:param name="phase"/>
			<ctl:assertion>
            Validate against Schematron schema {$schema} (phase: {$phase}).
            </ctl:assertion>
			<ctl:code>
				<xsl:variable name="isValid">
					<ctl:call-function name="ctl:CallSchematronValidatingParser">
						<ctl:with-param name="doc"><xsl:copy-of select="$doc"/></ctl:with-param>
						<ctl:with-param name="schema" select="string($schema)"/>
						<ctl:with-param name="phase" select="string($phase)"/>
					</ctl:call-function>
				</xsl:variable>
				<xsl:if test="$isValid='false'">
					<ctl:fail/>
				</xsl:if>	
			</ctl:code>
	</ctl:test>	
	<ctl:function name="ctl:CallSchematronValidatingParser">
		<ctl:param name="doc"/>
		<ctl:param name="schema"/>
		<ctl:param name="phase"/>
		<ctl:description>Invokes the Schematon validator.</ctl:description>
		<ctl:java class="com.occamlab.te.parsers.SchematronValidatingParser" 
                  method="checkSchematronRules" 
                  initialized="true"/>
	</ctl:function>		
	
	<!-- Used to call the xml validator outside the request element (after using parsers:HTTPParser in this case), i.e.: -->
	<!--<ctl:call-test name="ctl:XMLValidatingParser">
			<ctl:with-param name="doc"><xsl:copy-of select="$response//content/*"/></ctl:with-param>
			<ctl:with-param name="instruction">
				<parsers:schemas>
					<parsers:schema type="resource">xsd/ogc/wfs/1.1.0/wfs.xsd</parsers:schema>
				</parsers:schemas>
			</ctl:with-param>
	</ctl:call-test>-->
	<ctl:test name="ctl:XMLValidatingParser">
			<ctl:param name="doc"/>
			<ctl:param name="instruction"/>
			<ctl:assertion>Validating with XMLValidatingParser.</ctl:assertion>
			<ctl:code>
				<xsl:variable name="return-value">
					<ctl:call-function name="ctl:CallXMLValidatingParser">
						<ctl:with-param name="doc"><xsl:copy-of select="$doc"/></ctl:with-param>
						<ctl:with-param name="instruction"><xsl:copy-of select="$instruction"/></ctl:with-param>
					</ctl:call-function>
				</xsl:variable>
				<xsl:if test="$return-value='false'">
					<ctl:fail/>
				</xsl:if>	
			</ctl:code>
	</ctl:test>	
	<ctl:function name="ctl:CallXMLValidatingParser">
		<ctl:param name="doc"/>
		<ctl:param name="instruction"/>
		<ctl:description>Afunction to call the XML validator.</ctl:description>
		<ctl:java class="com.occamlab.te.parsers.XMLValidatingParser" method="checkXMLRules" initialized="true"/>
	</ctl:function>	

	<!-- Sample usage:
    <ctl:call-test name="ctl:XMLValidatingParser.WFS">
			<ctl:with-param name="doc"><xsl:copy-of select="$response//content/*"/></ctl:with-param>
	</ctl:call-test>
    -->
	<ctl:test name="ctl:XMLValidatingParser.WFS">
			<ctl:param name="doc"/>
			<ctl:assertion>Validate response entity against WFS schemas.</ctl:assertion>
			<ctl:code>
				<ctl:call-test name="ctl:XMLValidatingParser">
					<ctl:with-param name="doc"><xsl:copy-of select="$doc"/></ctl:with-param>
					<ctl:with-param name="instruction">				
						<parsers:schemas>
							<parsers:schema type="resource">xsd/ogc/cite/wfs.xsd</parsers:schema>					
						</parsers:schemas>
					</ctl:with-param>
				</ctl:call-test>
			</ctl:code>			
	</ctl:test>	
	
	<!-- XML validating parsers, defined for various response types to be reused by multiple tests -->
	<ctl:parser name="p:XMLValidatingParser.WFS">
		<ctl:java class="com.occamlab.te.parsers.XMLValidatingParser" method="parse" initialized="true">
			<ctl:with-param name="schemas_links">
				<parsers:schemas>
					<parsers:schema type="resource">xsd/ogc/cite/wfs.xsd</parsers:schema>								
				</parsers:schemas>
			</ctl:with-param>
		</ctl:java>
	</ctl:parser>	

	<ctl:parser name="p:XMLValidatingParser.OWS">
		<ctl:java class="com.occamlab.te.parsers.XMLValidatingParser" method="parse" initialized="true">
			<ctl:with-param name="schemas_links">
				<parsers:schemas>
					<parsers:schema type="resource">xsd/ogc/ows/1.0.0/ows-1.0.0.xsd</parsers:schema>
				</parsers:schemas>
			</ctl:with-param>
		</ctl:java>
	</ctl:parser>	
	
	<ctl:parser name="p:XMLValidatingParser.XMLSchema">
		<ctl:java class="com.occamlab.te.parsers.XMLValidatingParser" method="parse" initialized="true">
			<ctl:with-param name="schemas_links">
				<parsers:schemas>
					<parsers:schema type="resource">xsd/w3c/xmlschema/1.0/XMLSchema.xsd</parsers:schema>
				</parsers:schemas>
			</ctl:with-param>
		</ctl:java>
	</ctl:parser>		
	
	<!-- Schematron validator used in request element, pass in information for schematron schema to use, i.e.: -->
	<!--<p:SchematronValidatingParser>
			<parsers:schemas>
				<parsers:schema type="resource" phase="Default">sch/wfs/1.1.0/WFSCapabilities.sch</parsers:schema>
			</parsers:schemas>
		</p:SchematronValidatingParser>-->
	<ctl:parser name="p:SchematronValidatingParser">
		<ctl:param name="schema_link"/>
		<ctl:java class="com.occamlab.te.parsers.SchematronValidatingParser" method="parse" initialized="true"/>
	</ctl:parser>		
	
	<!-- Schematron validator used in request element, uses the given schema, i.e.: -->
	<!--<p:SchematronValidatingParser.WFSCapabilities/>-->
	<ctl:parser name="p:SchematronValidatingParser.WFSCapabilities">
		<ctl:java class="com.occamlab.te.parsers.SchematronValidatingParser" method="parse" initialized="true">
			<ctl:with-param name="schema_link">
					<parsers:schemas>
						<parsers:schema type="resource" phase="Default">sch/wfs/1.1.0/WFSCapabilities.sch</parsers:schema>
					</parsers:schemas>
			</ctl:with-param>
		</ctl:java>
	</ctl:parser>	
	
</ctl:package>