<?xml version="1.0" encoding="iso-8859-2"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                >
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />
    
    <xsl:template match="/">
        <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
            <fo:layout-master-set>
                <fo:simple-page-master master-name="Movies and series" page-height="11in" page-width="10in" font-family="sans-serif">
                    <fo:region-body region-name="only_region" margin="1in" />
                </fo:simple-page-master>
                <fo:simple-page-master master-name="Summary" page-height="11in" page-width="10in" font-family="sans-serif">
                    <fo:region-body region-name="only_region" margin="1in" />
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="Movies and series">
                <fo:flow flow-name="only_region">
                    <fo:block text-align="center" font-weight="bold" font-family="Arial" font-size="20">
                        <xsl:value-of select="substring('Chosen movies and series', 1)"/>
                    </fo:block>
                    <fo:table border="solid 2pt black">
                        <fo:table-header>
                            <fo:table-row>
                                <fo:table-cell width="1.5in">
                                    <fo:block font-weight="bold">Title</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block font-weight="bold">Type</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block font-weight="bold">Rate</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block font-weight="bold">Genre</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block font-weight="bold">Country</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block font-weight="bold">Creator</fo:block>
                                </fo:table-cell>
                                <fo:table-cell>
                                    <fo:block font-weight="bold">Release date</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <xsl:for-each select="watchingLibraryReport/item">
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="."/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="@type"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="@rate"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="@genre"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="@country"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="@creator"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell>
                                        <fo:block>
                                            <xsl:value-of select="@releaseDate"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </xsl:for-each>
                    </fo:table>
                </fo:flow>
            </fo:page-sequence>
            <fo:page-sequence master-reference="Summary">
                <fo:flow flow-name="only_region">
                    <fo:block text-align="left" font-weight="bold" font-size="20">Summary</fo:block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Items count: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="15em">
                                    <xsl:value-of select="watchingLibraryReport/summary/itemsCount"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>USA movies: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="15em">
                                    <xsl:value-of select="watchingLibraryReport/summary/USAmoviesCount"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Sci-Fi series: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="15em">
                                    <xsl:value-of select="watchingLibraryReport/summary/Sci-FiseriesCount"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Items for under 15: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="15em">
                                    <xsl:value-of select="watchingLibraryReport/summary/itemsForUnder15Count"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Average movies rate: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="15em">
                                    <xsl:value-of select="watchingLibraryReport/summary/averageMoviesRate"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Average series rate: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="15em">
                                    <xsl:value-of select="watchingLibraryReport/summary/averageSeriesRate"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                    <fo:list-block>
                        <fo:list-item>
                            <fo:list-item-label>
                                <fo:block>Report: </fo:block>
                            </fo:list-item-label>
                            <fo:list-item-body>
                                <fo:block margin-left="15em">
                                    <xsl:value-of select="watchingLibraryReport/summary/date"/>
                                </fo:block>
                            </fo:list-item-body>
                        </fo:list-item>
                    </fo:list-block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    
</xsl:stylesheet>