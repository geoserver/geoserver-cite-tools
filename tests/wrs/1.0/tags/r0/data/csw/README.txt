The CSW test data records are included in csw-records.xml. These are
transformed to a <csw:Insert> statement (csw-insert.xml) containing
ebRIM registry objects using the stylesheet record2ebrim3.xsl.

Run the Ant script (ant-csw2ebrim.xml) to (re)create the csw-insert.xml
file.