<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" href="library.xsl">
    <xsl:template match="/">
        <html>
            <head>
                <title>Library Catalog</title>
                <style>
                    table { width: 100%; border-collapse: collapse; }
                    th, td { border: 1px solid black; padding: 8px; text-align: left; }
                    .classic { background-color: #ffff99; }
                </style>
            </head>
            <body>
                <h2>Library Catalog</h2>
                <table>
                    <tr>
                        <th>Title</th>
                        <th>Author(s)</th>
                        <th>Editor</th>
                        <th>Genre</th>
                        <th>Total Copies</th>
                        <th>Issued</th>
                    </tr>
                    <xsl:apply-templates select="library/book"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="book">
        <tr>
            <xsl:variable name="genre" select="shelf/@genre"/>
            <xsl:variable name="class">
                <xsl:if test="$genre = 'Classic'">classic</xsl:if>
            </xsl:variable>
            <tr class="{$class}">
                <td><xsl:value-of select="title"/></td>
                <td>
                    <xsl:for-each select="authors/author">
                        <xsl:value-of select="."/>
                        <xsl:if test="position() != last()">, </xsl:if>
                    </xsl:for-each>
                </td>
                <td><xsl:value-of select="editor"/></td>
                <td><xsl:value-of select="shelf/@genre"/></td>
                <td><xsl:value-of select="copies/@total"/></td>
                <td><xsl:value-of select="copies/@issued"/></td>
            </tr>
        </tr>
    </xsl:template>
</xsl:stylesheet>

