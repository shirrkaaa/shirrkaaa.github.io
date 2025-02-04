<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="sortBy" select="'author'"/>  
    <xsl:param name="filterByGenre" select="'genre'"/> 
    <xsl:param name="filterByAuthor" select="'author'"/> 

    <xsl:template match="/">
        <html>
            <head>
                <title>Бібліотека</title>
            </head>
            <body>
                <h2>Оригінальна таблиця</h2>
                <table border="1">
                    <tr>
                        <th>Назва</th>
                        <th>Автор</th>
                        <th>Жанр</th>
                        <th>Редактор</th>
                    </tr>
                    <xsl:apply-templates select="timetable/row"/>
                </table>
                
                <h2>Відсортована таблиця</h2>
                <p>
                    <xsl:choose>
                        <xsl:when test="$sortBy = 'title'">Сортування за назвою</xsl:when>
                        <xsl:when test="$sortBy = 'author'">Сортування за автором</xsl:when>
                        <xsl:when test="$sortBy = 'genre'">Сортування за жанром</xsl:when>
                        <xsl:when test="$sortBy = 'editor'">Сортування за редактором</xsl:when>
                        <xsl:otherwise>Сортування за невідомим критерієм</xsl:otherwise>
                    </xsl:choose>
                </p>
                <table border="1">
                    <tr>
                        <th>Назва</th>
                        <th>Автор</th>
                        <th>Жанр</th>
                        <th>Редактор</th>
                    </tr>
                    <xsl:apply-templates select="timetable/row">
                        <xsl:sort select="*[name()=$sortBy]" order="ascending" data-type="text"/>
                    </xsl:apply-templates>
                </table>
                
                <h2>Відфільтрована таблиця</h2>
                <p>Фільтрація за:</p>
                <ul>
                    <li><xsl:if test="$filterByGenre != ''">Жанр: <xsl:value-of select="$filterByGenre"/></xsl:if></li>
                    <li><xsl:if test="$filterByAuthor != ''">Автор: <xsl:value-of select="$filterByAuthor"/></xsl:if></li>
                </ul>
                <table border="1">
                    <tr>
                        <th>Назва</th>
                        <th>Автор</th>
                        <th>Жанр</th>
                        <th>Редактор</th>
                    </tr>
                    <xsl:apply-templates select="timetable/row">
                        <xsl:if test="(genre=$filterByGenre and $filterByGenre != '') or (author=$filterByAuthor and $filterByAuthor != '')">
                            <xsl:copy-of select="."/>
                        </xsl:if>
                    </xsl:apply-templates>
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
