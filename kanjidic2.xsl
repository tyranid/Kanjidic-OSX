<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"> 
<xsl:output encoding="UTF-8" indent="yes"/>
<xsl:variable name="hiragana">あいうえおかきくけこがぎぐげごさしすせそざじずぜぞたちつてとだぢづでどなにぬねのはひふへほばびぶべぼぱぴぷぺぽまみむめもらりるれろやゐゆゑよわをんゔぁぃぅぇぉゕゖっゃゅょゎ</xsl:variable>
<xsl:variable name="katakana">アイウエオカキクケコガギグゲゴサシスセソザジズゼゾタチツテトダヂヅデドナニヌネノハヒフヘホバビブベボパピプペポマミムメモラリルレロヤヰユヱヨワヲンヴァィゥェォヵヶッャュョヮ</xsl:variable>
<xsl:template match="/">
<d:dictionary xmlns="http://www.w3.org/1999/xhtml" xmlns:d="http://www.apple.com/DTDs/DictionaryService-1.0.rng">
	<d:entry id="front_back_matter" d:title="Kanji Dictionary 2">
		<h1>Kanji Dictionary 2</h1>
		<p>Converted version of kanjidic2 from <a href="http://www.csse.monash.edu.au/~jwb/kanjidic2/">here</a></p>
	</d:entry>
	<xsl:for-each select="kanjidic2/character">
		<xsl:variable name="kanji" select="literal"/>
		<d:entry>
			<xsl:attribute name="id">ucs_<xsl:value-of select="codepoint/cp_value[@cp_type = 'ucs']"/></xsl:attribute>
			<xsl:attribute name="d:title"><xsl:value-of select="$kanji" /></xsl:attribute>
			<d:index>
				<xsl:attribute name="d:value"><xsl:value-of select="$kanji" /></xsl:attribute> 
			</d:index>
			<xsl:for-each select="reading_meaning/rmgroup/meaning[not(@m_lang)]">
				<d:index>
					<xsl:attribute name="d:value"><xsl:value-of select="."/></xsl:attribute> 
					<xsl:attribute name="d:title"><xsl:value-of select="$kanji" /></xsl:attribute> 
				</d:index>
			</xsl:for-each>
			<xsl:for-each select="reading_meaning/rmgroup/reading[@r_type='ja_on']">
				<d:index>
					<xsl:attribute name="d:value"><xsl:value-of select="."/></xsl:attribute> 
					<xsl:attribute name="d:title"><xsl:value-of select="$kanji" /></xsl:attribute> 
					<xsl:attribute name="d:yomi"><xsl:value-of select="."/></xsl:attribute> 
				</d:index>
				<d:index>
					<xsl:attribute name="d:value"><xsl:value-of select="translate(.,$katakana,$hiragana)"/></xsl:attribute>
					<xsl:attribute name="d:title"><xsl:value-of select="$kanji" /></xsl:attribute> 
					<xsl:attribute name="d:yomi"><xsl:value-of select="."/></xsl:attribute> 
				</d:index>
			</xsl:for-each>
			<xsl:for-each select="reading_meaning/rmgroup/reading[@r_type='ja_kun']">
				<d:index>
					<xsl:attribute name="d:value"><xsl:value-of select="."/></xsl:attribute> 
					<xsl:attribute name="d:title"><xsl:value-of select="$kanji" /></xsl:attribute> 
					<xsl:attribute name="d:yomi"><xsl:value-of select="."/></xsl:attribute> 
				</d:index>
				<d:index>
					<xsl:attribute name="d:value"><xsl:value-of select="translate(.,$hiragana,$katakana)"/></xsl:attribute>
					<xsl:attribute name="d:title"><xsl:value-of select="$kanji" /></xsl:attribute> 
					<xsl:attribute name="d:yomi"><xsl:value-of select="."/></xsl:attribute> 
				</d:index>
			</xsl:for-each>
			<span class="literal"><xsl:value-of select="$kanji"/></span>
			<br/>
			<div>
			<xsl:for-each select="radical/rad_value[@rad_type='classical']">
				<b>Radical: </b><xsl:value-of disable-output-escaping="yes" select="concat('&amp;','#',string(12031+number(.)),';')"/><br/>
			</xsl:for-each>
			<xsl:for-each select="radical/rad_value[@rad_type='nelson_c']">
				<b>Nelson Radical: </b><xsl:value-of disable-output-escaping="yes" select="concat('&amp;','#',string(12031+number(.)),';')"/><br/>
			</xsl:for-each>
			<b>Strokes: </b><xsl:value-of select="misc/stroke_count"/><br/>
			<xsl:if test="count(reading_meaning/rmgroup/meaning[not(@m_lang)]) &gt; 0">
			<b>Meaning:</b>
			<ul>
				<xsl:for-each select="reading_meaning/rmgroup/meaning[not(@m_lang)]"><li><xsl:value-of select="."/></li></xsl:for-each>
			</ul>
			</xsl:if>
			<xsl:if test="count(reading_meaning/rmgroup/reading[@r_type='ja_on']) &gt; 0">
			<b>On-Yomi:</b>
			<ul>
				<xsl:for-each select="reading_meaning/rmgroup/reading[@r_type='ja_on']"><li><xsl:value-of select="."/></li></xsl:for-each>
			</ul>
			</xsl:if>
			<xsl:if test="count(reading_meaning/rmgroup/reading[@r_type='ja_kun']) &gt; 0">
			<b>Kun:</b>
			<ul>
				<xsl:for-each select="reading_meaning/rmgroup/reading[@r_type='ja_kun']"><li><xsl:value-of select="."/></li></xsl:for-each>
			</ul>
			</xsl:if>
			<xsl:if test="count(reading_meaning/nanori) &gt; 0">
			<b>Nanori:</b>
			<ul>
				<xsl:for-each select="reading_meaning/nanori"><li><xsl:value-of select="."/></li></xsl:for-each>
			</ul>
			</xsl:if>
			</div>
		</d:entry>
	</xsl:for-each>
</d:dictionary>
</xsl:template>
</xsl:stylesheet>
