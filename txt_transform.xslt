<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
<xsl:output method="text" version="1.0" encoding="UTF-8"/>

<!--<xsl:key name="Items" match="watchingLibraryReport/item" use="No" />-->
	
	<xsl:template match="/">
		<xsl:apply-templates select="watchingLibraryReport/author"/>
		<xsl:text>&#xA;</xsl:text>
                <xsl:text>&#xA;</xsl:text> 
        <xsl:apply-templates select="watchingLibraryReport"/>
        <xsl:apply-templates select="watchingLibraryReport//summary"/>
	</xsl:template>
	
	<xsl:template match="watchingLibraryReport">
       <xsl:value-of select="concat('Title:',substring('                                    ',string-length('Title:')),'Type:',substring('       ',string-length('Type:')),'Rate:',substring('      ',string-length('Rate:')),'Genre:')"/><xsl:text>&#xA;</xsl:text>  <xsl:text>&#xA;</xsl:text>     
		<xsl:for-each select="item">
			
       <xsl:value-of select="concat(.,substring('                                    ',string-length(.)),@type,substring('       ',string-length(@type)),@rate,substring('      ',string-length(@rate)),@genre)"/><xsl:text>&#xA;</xsl:text>        
    
        </xsl:for-each >
	</xsl:template>
	
	
	<xsl:template match="watchingLibraryReport/author">
	<xsl:value-of select="."/>		
	</xsl:template>
	
	<xsl:template match="watchingLibraryReport//summary">
		<xsl:text>&#xA; Summary &#xA;</xsl:text>
                <xsl:text>&#xA;</xsl:text>
               <!--  <xsl:value-of select="concat('Items count:',substring('       ',string-length('Items count:')),'USA movies count:',substring('                        ',string-length('USA movies count:')),'Sci-Fi series count:',substring('              ',string-length('Sci-Fi series count:')),'Items for under 15 count:',substring('                  ',string-length('Items for under 15 count:')),'Average movies rate:',substring('                ',string-length('Average movies rate:')),'Average series rate:',substring('                ',string-length('Average series rate:')))"/><xsl:text>&#xA;</xsl:text>
                <xsl:value-of select="concat(//itemsCount,substring('       ',string-length(//itemsCount)),//USAmoviesCount,substring('       ',string-length(//USAmoviesCount)),//Sci-FiseriesCount,substring('      ',string-length(//Sci-FiseriesCount)),//itemsForUnder15Count,substring('      ',string-length(//itemsForUnder15Count)),//averageMoviesRate,substring('      ',string-length(//averageMoviesRate)),//averageSeriesRate,substring('      ',string-length(//averageSeriesRate)))"/><xsl:text>&#xA;</xsl:text>-->
		<xsl:text>Items count:</xsl:text><xsl:value-of select="//itemsCount"/><xsl:text>&#xA;</xsl:text>
		<xsl:text>USA movies count: </xsl:text><xsl:value-of select="//USAmoviesCount"/><xsl:text>&#xA;</xsl:text>
		<xsl:text>Sci-Fi series count: </xsl:text><xsl:value-of select="//Sci-FiseriesCount"/><xsl:text>&#xA;</xsl:text>
		<xsl:text>Items for age under 15 count: </xsl:text><xsl:value-of select="//itemsForUnder15Count"/><xsl:text>&#xA;</xsl:text>
		<xsl:text>Average movies rate: </xsl:text><xsl:value-of select="//averageMoviesRate"/><xsl:text>&#xA;</xsl:text>
		<xsl:text>Average series rate: </xsl:text><xsl:value-of select="//averageSeriesRate"/><xsl:text>&#xA;</xsl:text>
		<xsl:text>Creation date: </xsl:text><xsl:value-of select="//date"/>
	</xsl:template>
</xsl:stylesheet>
