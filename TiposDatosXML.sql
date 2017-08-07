CREATE XML SCHEMA COLLECTION ProductAttributes AS
'<xsd:schema xmlns:schema="PowerTools" xmlns:xsd=http://www.w3.org/2001/XMLSchema 
xmlns:sqltypes=http://schemas.microsoft.com/sqlserver/2004/sqltypes 
targetNamespace="PowerTools" elementFormDefault="qualified">

<xsd:import namespace="http://schemas.microsoft.com/sqlserver/2004/sqltypes" 
schemaLocation="http://schemas.microsoft.com/sqlserver/2004/sqltypes/sqltypes.xsd" />

<xsd:element name="dbo.PowerTools">
<xsd:complexType>
<xsd:sequence>
<xsd:element name="Category">
<xsd:simpleType>
<xsd:restriction base="sqltypes:varchar" sqltypes:localeId="1033" sqltypes:sqlCompareOptions="IgnoreCase IgnoreKanaType IgnoreWidth" sqltypes:sqlSortId="52">
<xsd:maxLength value="30" />
</xsd:restriction>
</xsd:simpleType>
</xsd:element>
<xsd:element name="Amperage">
<xsd:simpleType>
<xsd:restriction base="sqltypes:decimal">
<xsd:totalDigits value="3" />
<xsd:fractionDigits value="1" />
</xsd:restriction>
</xsd:simpleType>
</xsd:element>
<xsd:element name="Voltage">
<xsd:simpleType>
<xsd:restriction base="sqltypes:char" sqltypes:localeId="1033" sqltypes:sqlCompareOptions="IgnoreCase IgnoreKanaType IgnoreWidth" sqltypes:sqlSortId="52">
<xsd:maxLength value="7" />
</xsd:restriction>
</xsd:simpleType>
</xsd:element>
</xsd:sequence>
</xsd:complexType>
</xsd:element>
</xsd:schema>'