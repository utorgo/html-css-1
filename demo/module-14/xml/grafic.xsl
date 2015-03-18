<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output
		method="xml"
		encoding="utf-8"
		doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
		omit-xml-declaration="yes"
		indent="yes"/>
	<xsl:variable name="max" select="number(/graf/item[not(../item/@value &gt; @value)]/@value)"/>
	<xsl:variable name="width" select="30" />
	<xsl:variable name="font-size" select="10" />
	<xsl:template match="/">
		<html>
			<head>
				<title>График</title>
			</head>
			<body>
				<h1>График</h1>
				<xsl:call-template name="drawItems" />
			</body>
		</html>
	</xsl:template>

	<xsl:template name="drawItems">
		<svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" version='1.1'>
			<xsl:for-each select="/graf/item">
				<xsl:variable name="x" select="(position()-1)*$width" />
				<xsl:variable name="y" select="$max - @value" />
				<rect width="{$width}">
					<xsl:attribute name="height"><xsl:value-of select="@value"/></xsl:attribute>
					<xsl:attribute name="style">fill:<xsl:value-of select="@color"/></xsl:attribute>
					<xsl:attribute name="x"><xsl:value-of select="$x"/></xsl:attribute>
					<xsl:attribute name="y"><xsl:value-of select="$y"/></xsl:attribute>
				</rect>
				<xsl:variable name="delta" select="round(string-length(@value) div 2)+4"/>
				<text fill="black" font-size="{$font-size}">
					<xsl:attribute name="x"><xsl:value-of select="($x + ($width div 2)) - $delta"/></xsl:attribute>
					<xsl:attribute name="y"><xsl:value-of select="$y + $font-size"/></xsl:attribute>
					<xsl:value-of select="@value"/>
				</text>
			</xsl:for-each>
			<g stroke="black" >
				<line x1="0" y1="0" x2="0" y2="{$max}" stroke-width="2"  />
				<line x1="0" y1="{$max}" x2="{count(/graf/item) * $width}" y2="{$max}" stroke-width="1"  />
			</g>
		</svg>
	</xsl:template>
</xsl:stylesheet>
