******************************************
SPS 1.0 Executable Test Suite (ETS) Notes:
******************************************

The items below are important notes to consider regarding this SPS test suite.  More details on specific tests can be found in the SPS Abstract Test Suite (ATS).

***********************
What IS Tested/Handled:
***********************

- All required aspects of the mandatory operations of the SPS:  GetCapabilities, DescribeTasking, Submit, and DescribeResultAccess

- Valid exception reporting according to the specification

- The Capabilities document lists all of the mandatory operations of the SPS specification

- Any non-mandatory operations listed have valid SPS operation names

- Valid URNs are provided where possible for values such as sensorIDs, observed properties, definitions, etc.

- Important URLs (i.e. SensorDefinition, ServiceURL, etc.) actually link to something

- The sensorID in the SensorML or TML document describing a taskable sensor matches the sensorID in the SensorOffering for that sensor 

- All InputDescriptor definition types are handled:
	1)  The most common commonData sub-types (including Position with location) are handled by allowing a user to enter in values for these elements directly in a user input form
	2)  More complex definition types are handled by allowing a user to enter the InputParameter XML elements directly in a user input form.

***************************
What IS NOT Tested/Handled:
***************************

- Optional operations of the SPS:  GetFeasibility, GetStatus, Update, and Cancel

- SPS interaction with a Web Notification Service (WNS).  Testing the interaction with a WNS would lead to developing compliance tests for the WNS.  Since the WNS is not an approved OGC v1.0 specification, compliance tests have not been written, and writing these compliance tests would be beyond the scope of the SPS tests.

- Coordinate/axis ordering and the validity of coordinate values for GML objects with different coordinate reference systems
  