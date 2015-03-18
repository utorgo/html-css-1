<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output
		method="html"
		doctype-public="-//W3C//DTD HTML 4.01//EN"
		doctype-system="http://www.w3.org/TR/html4/strict.dtd"
		indent="yes"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>Наши книги</title>
				<style type="text/css">
					* {margin:0px; padding: 0px }
					h1 {padding: 10px; text-align:center; background-color:#ccf }
					table { margin: 10px; border-collapse: collapse }
					td { border: 1px solid gray; padding: 5px }
					thead td { text-align:center; background-color:#ccf; font-weight:bold }
					#colTitle { width: 300px }
					#colAutor { width: 300px }
					#colPrice { width: 100px }
					.expenceBook td { background-color: #fdd }
				</style>
			</head>
			<body>
				<h1>Наши книги</h1>
				<table>
					<thead>
						<td id="colTitle">Наименование</td>
						<td id="colAutor">Автор</td>
						<td id="colPrice">Цена</td>
					</thead>
					<tbody>
						<xsl:apply-templates select="/pricelist/book" />
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="book[price &lt; 200]">
		<tr>
			<xsl:apply-templates select="./*" />
		</tr>
	</xsl:template>

	<xsl:template match="book[price &gt; 200]">
		<tr class="expenceBook">
			<xsl:apply-templates select="*" />
		</tr>
	</xsl:template>

	<xsl:template match="book/*">
		<td>
			<xsl:value-of select="." />
		</td>
	</xsl:template>
</xsl:stylesheet>
