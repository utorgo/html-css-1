<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output
		method="html"
		encoding="utf-8"
		indent="yes" />
	<xsl:template match="/">
		<h2>
			<xsl:value-of select="/rss/channel/title" />
		</h2>
		<xsl:apply-templates select="/rss/channel/item" />
	</xsl:template>
	<xsl:template match="item">
		<div>
			<h3>
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="link" />
					</xsl:attribute>
					<xsl:value-of select="title" disable-output-escaping="yes" />
				</a>
			</h3>
			<p>
				<xsl:value-of select="description" disable-output-escaping="yes" />
			</p>
		</div>
	</xsl:template>
</xsl:stylesheet>
