<?xml version="1.0" encoding="UTF-8"?>
<?xmlspysamplexml SDD.xsd?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.w3.org/1999/XSL/Transform schema-for-xslt20.xsd">
 <xsl:variable name="GeneratorCopyright">DiversitySchemaTools Version 0.3. Copyright (c) G. Hagedorn 2004.</xsl:variable>
  <!--  To be used on a w3c schema document.   Try to resolve the xs:include by inserting them into the output tree -->
  <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />  
  
  <!-- The following include contains a match-all-copy out rule  -->  
  <xsl:include href="xsd-Incl-MatchAllAndCopyRule.xsl" />

  <!-- Resolve xs:include, get the external schema parts: -->
      <!--    DOES NOT WORK YET!!!!!!!!!
Failed attempts:
      <xsl:variable name="location" select="./@schemaLocation" />
      <xsl:copy-of select="document($location)" />

      <xsl:copy-of select="document(./@schemaLocation)" />
      <xsl:apply-templates select="document(./@schemaLocation)"/>

 nothing worked, spy always crashes!
--> 

<!-- This works ok, copies include element itself with its attributes:
    <xsl:template match=" xs:include">
      <xsl:copy><xsl:apply-templates select="./@*"/></xsl:copy>     
  </xsl:template>
  but I want the content of the referenced file, not the reference to the file...
 -->

  <xsl:template match=" xs:include">
    <xsl:copy-of select="document(./@schemaLocation)" />
  </xsl:template>

</xsl:stylesheet>