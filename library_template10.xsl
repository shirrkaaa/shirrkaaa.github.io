<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
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
            <td><xsl:value-of select="title"/></td>
            <td>
                <xsl:for-each select="authors/author">
                    <xsl:value-of select="."/>
                    <xsl:if test="position() != last()">, </xsl:if>
                </xsl:for-each>
            </td>
            <td><xsl:value-of select="editor"/></td>
            <td><xsl:value-of select="shelf/@genre"/></td>
            <td><xsl:call-template name="numberToWords">
                <xsl:with-param name="num" select="copies/@total"/>
            </xsl:call-template></td>
            <td><xsl:call-template name="numberToWords">
                <xsl:with-param name="num" select="copies/@issued"/>
            </xsl:call-template></td>
        </tr>
    </xsl:template>

    <xsl:template name="numberToWords">
        <xsl:param name="num"/>
        <xsl:choose>
            <xsl:when test="$num = '1'">one</xsl:when>
            <xsl:when test="$num = '2'">two</xsl:when>
            <xsl:when test="$num = '3'">three</xsl:when>
            <xsl:when test="$num = '4'">four</xsl:when>
            <xsl:when test="$num = '5'">five</xsl:when>
            <xsl:when test="$num = '6'">six</xsl:when>
            <xsl:when test="$num = '7'">seven</xsl:when>
            <xsl:when test="$num = '8'">eight</xsl:when>
            <xsl:when test="$num = '9'">nine</xsl:when>
            <xsl:when test="$num = '10'">ten</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$num"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
