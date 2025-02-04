<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="library.xsl"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    
    <xsl:template match="/">
        <html>
        <head>
            <title>Library Catalog</title>
        </head>
        <body>
            <h2>Library Catalog (Filtered by Genre: Classic)</h2>
            <table border="1">
                <tr>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Editor</th>
                    <th>Copies Available</th>
                    <th>Genre</th>
                </tr>
                <xsl:apply-templates select="library/book[shelf/@genre='Classic']">
                    <xsl:sort select="copies/@total" data-type="number" order="descending"/>
                </xsl:apply-templates>
            </table>
        </body>
        </html>
    </xsl:template>
    
    <xsl:template match="book">
        <tr>
            <td><xsl:value-of select="title"/></td>
            <td><xsl:value-of select="authors/author"/></td>
            <td><xsl:value-of select="editor"/></td>
            <td><xsl:value-of select="copies/@total - copies/@issued"/></td>
            <td><xsl:value-of select="shelf/@genre"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
