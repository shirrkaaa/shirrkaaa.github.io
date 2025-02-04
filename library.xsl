<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:param name="sortBy" select="'author'"/>  
    <xsl:param name="filterByGenre" select="''"/> 
    <xsl:param name="filterByAuthor" select="''"/> 

    <xsl:template match="/">
        <html>
            <head>
                <title>Library</title>
            </head>
            <body>
                <h2>Original Table</h2>
                <table border="1">
                    <tr>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Genre</th>
                        <th>Editor</th>
                    </tr>
                    <xsl:apply-templates select="timetable/row"/>
                </table>
                
                <h2>Sorted Table</h2>
                <table border="1">
                    <tr>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Genre</th>
                        <th>Editor</th>
                    </tr>
                    <xsl:apply-templates select="timetable/row">
                        <xsl:sort select="author" order="ascending" data-type="text"/>
                    </xsl:apply-templates>
                </table>
                
                <h2>Filtered Table</h2>
                <p>Filter: Genre=<xsl:value-of select="$filterByGenre"/>; Author=<xsl:value-of select="$filterByAuthor"/></p>
                <table border="1">
                    <tr>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Genre</th>
                        <th>Editor</th>
                    </tr>
                    <xsl:apply-templates select="timetable/row[genre=$filterByGenre or author=$filterByAuthor]"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="row">
        <tr>
            <td><xsl:value-of select="title"/></td>
            <td><xsl:value-of select="author"/></td>
            <td><xsl:value-of select="genre"/></td>
            <td><xsl:value-of select="editor"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
