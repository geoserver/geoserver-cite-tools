WMTS 1.0 schemas are included as local resources to work around discrepancies in wmtsGetCapabilities_response.xsd
in element name="TileMatrixLimits" where the min and max tile row and column are of type positiveInteger when they
should be nonNegativeInteger because 0 values are allowed in call cases per the documentation and the WMTS specification.
The local version of wmtsGetCapabilities_response.xsd has been modified to correct this error.  

These schemas should be removed from the WMTS ETS once the schemas at http://schemas.opengis.net/wmts/ have been corrected.
