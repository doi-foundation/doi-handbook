<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:tbx="urn:iso:std:iso:30042:ed-1"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:fox="http://xmlgraphics.apache.org/fop/extensions"
    xmlns:pdf="http://xmlgraphics.apache.org/fop/extensions/pdf">
    <xsl:output method="xml" indent="yes"/>

    <xsl:variable name="brand-color">#FAB608</xsl:variable>
    <xsl:variable name="base-font-size">10pt</xsl:variable>
    <xsl:variable name="base-line-height">14pt</xsl:variable>
    <xsl:variable name="font-family">Arial, Yu Gothic, Meiryo, MS Gothic, sans-serif</xsl:variable>
    <xsl:variable name="chapter-title-size">28pt</xsl:variable>
    <xsl:variable name="section-title-size">16pt</xsl:variable>
    <xsl:variable name="subsection-title-size">12pt</xsl:variable>
    <xsl:variable name="page-width">210mm</xsl:variable>
    <xsl:variable name="page-height">297mm</xsl:variable>
    <xsl:variable name="page-margin-left">20mm</xsl:variable>
    <xsl:variable name="page-margin-right">20mm</xsl:variable>
    <xsl:variable name="page-margin-top">40mm</xsl:variable>
    <xsl:variable name="page-margin-bottom">30mm</xsl:variable>
    <xsl:variable name="region-body-margin-bottom">20mm</xsl:variable>
    <xsl:variable name="footer-extent">20mm</xsl:variable>
    <xsl:variable name="footer-font-size">8pt</xsl:variable>
    <xsl:variable name="space-small">5mm</xsl:variable>
    <xsl:variable name="space-medium">10mm</xsl:variable>
    <xsl:variable name="space-large">20mm</xsl:variable>
    <xsl:variable name="space-xlarge">30mm</xsl:variable>
    <xsl:variable name="index-column-count">2</xsl:variable>
    <xsl:variable name="superscript-size">70%</xsl:variable>
    <xsl:variable name="chapter-margin">40pt</xsl:variable>
    <xsl:variable name="big-margin">100pt</xsl:variable>
    <xsl:variable name="leader-width">3pt</xsl:variable>
    <xsl:variable name="table-cell-padding">5pt</xsl:variable>
    <xsl:variable name="link-color">#0066CC</xsl:variable>
    
    <xsl:variable name="baseLoc">
        <xsl:choose>
            <xsl:when test="contains(translate(system-property('user.dir'), '\', '/'), ':')">
                <xsl:value-of select="concat('file:///', translate(system-property('user.dir'), '\', '/'))"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat('file://', translate(system-property('user.dir'), '\', '/'))"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:template match="/">
        <fo:root language="en">
            <fo:layout-master-set>
                 <fo:simple-page-master master-name="recto" page-height="{$page-height}"
                    page-width="{$page-width}" margin-left="{$page-margin-left}"
                    margin-right="{$page-margin-right}" margin-top="{$page-margin-top}"
                    margin-bottom="{$page-margin-bottom}">
                    <fo:region-body margin-bottom="{$region-body-margin-bottom}"/>
                    <fo:region-after region-name="footer-recto" extent="{$footer-extent}"/>
                </fo:simple-page-master>
                <fo:simple-page-master master-name="verso" page-height="{$page-height}"
                    page-width="{$page-width}" margin-left="{$page-margin-left}"
                    margin-right="{$page-margin-right}" margin-top="{$page-margin-top}"
                    margin-bottom="{$page-margin-bottom}">
                    <fo:region-body margin-bottom="{$region-body-margin-bottom}"/>
                    <fo:region-after region-name="footer-verso" extent="{$footer-extent}"/>
                </fo:simple-page-master>
                <fo:simple-page-master master-name="index-recto" page-height="{$page-height}"
                    page-width="{$page-width}" margin-left="{$page-margin-left}"
                    margin-right="{$page-margin-right}" margin-top="{$page-margin-top}"
                    margin-bottom="{$page-margin-bottom}">
                    <fo:region-body margin-bottom="{$region-body-margin-bottom}"
                        column-count="{$index-column-count}" column-gap="{$space-medium}"/>
                    <fo:region-after region-name="footer-recto" extent="{$footer-extent}"/>
                </fo:simple-page-master>
                <fo:simple-page-master master-name="index-verso" page-height="{$page-height}"
                    page-width="{$page-width}" margin-left="{$page-margin-left}"
                    margin-right="{$page-margin-right}" margin-top="{$page-margin-top}"
                    margin-bottom="{$page-margin-bottom}">
                    <fo:region-body margin-bottom="{$region-body-margin-bottom}"
                        column-count="{$index-column-count}" column-gap="{$space-medium}"/>
                    <fo:region-after region-name="footer-verso" extent="{$footer-extent}"/>
                </fo:simple-page-master>
                <fo:page-sequence-master master-name="main">
                    <fo:repeatable-page-master-alternatives>
                        <fo:conditional-page-master-reference master-reference="recto"
                            odd-or-even="odd"/>
                        <fo:conditional-page-master-reference master-reference="verso"
                            odd-or-even="even"/>
                    </fo:repeatable-page-master-alternatives>
                </fo:page-sequence-master>
                <fo:page-sequence-master master-name="index">
                    <fo:repeatable-page-master-alternatives>
                        <fo:conditional-page-master-reference master-reference="index-recto"
                            odd-or-even="odd"/>
                        <fo:conditional-page-master-reference master-reference="index-verso"
                            odd-or-even="even"/>
                    </fo:repeatable-page-master-alternatives>
                </fo:page-sequence-master>
            </fo:layout-master-set>
            <fo:declarations>
                <pdf:catalog>
                    <pdf:dictionary key="MarkInfo">
                        <pdf:boolean key="Marked">true</pdf:boolean>
                    </pdf:dictionary>
                </pdf:catalog>
                <x:xmpmeta xmlns:x="adobe:ns:meta/">
                    <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
                        <rdf:Description rdf:about="" xmlns:dc="http://purl.org/dc/elements/1.1/">
                            <dc:title>
                                <rdf:Alt>
                                    <rdf:li xml:lang="x-default">
                                        <xsl:value-of
                                            select="normalize-space(/standard/front/std-meta/title-wrap/full)"
                                        />
                                    </rdf:li>
                                </rdf:Alt>
                            </dc:title>
                            <dc:creator>
                                <rdf:Seq>
                                    <rdf:li>
                                        <xsl:value-of
                                            select="normalize-space(/standard/front/std-meta/std-org-group/std-org/std-org-name)"
                                        />
                                    </rdf:li>
                                </rdf:Seq>
                            </dc:creator>
                            <dc:description>
                                <rdf:Alt>
                                    <rdf:li xml:lang="x-default">
                                        <xsl:value-of
                                            select="normalize-space(/standard/front/std-meta/abstract)"/>
                                        <xsl:if test="not(/standard/front/std-meta/abstract)">
                                            <xsl:value-of
                                                select="normalize-space(/standard/front/std-meta/title-wrap/full)"
                                            />
                                        </xsl:if>
                                    </rdf:li>
                                </rdf:Alt>
                            </dc:description>
                        </rdf:Description>
                        <rdf:Description rdf:about="" xmlns:xmp="http://ns.adobe.com/xap/1.0/">
                            <xmp:CreatorTool>Apache FOP version 2.11</xmp:CreatorTool>
                            <xmp:CreateDate>
                                <xsl:value-of
                                    select="format-dateTime(current-dateTime(), '[Y0001]-[M01]-[D01]T[H01]:[m01]:[s01][Z]')"
                                />
                            </xmp:CreateDate>
                            <xmp:ModifyDate>
                                <xsl:value-of
                                    select="format-dateTime(current-dateTime(), '[Y0001]-[M01]-[D01]T[H01]:[m01]:[s01][Z]')"
                                />
                            </xmp:ModifyDate>
                        </rdf:Description>
                        <rdf:Description rdf:about="" xmlns:pdf="http://ns.adobe.com/pdf/1.3/">
                            <pdf:Producer>Apache FOP 2.11</pdf:Producer>
                            <xsl:if test="/standard/front/std-meta/permissions">
                                <pdf:Keywords>
                                    <xsl:value-of
                                        select="normalize-space(/standard/front/std-meta/kwd-group/kwd)"
                                    />
                                </pdf:Keywords>
                            </xsl:if>
                        </rdf:Description>
                        <xsl:if test="/standard/front/std-meta/permissions/copyright-statement">
                            <rdf:Description rdf:about=""
                                xmlns:xmpRights="http://ns.adobe.com/xap/1.0/rights/">
                                <xmpRights:Marked>True</xmpRights:Marked>
                                <xmpRights:WebStatement>
                                    <xsl:value-of
                                        select="/standard/front/std-meta/permissions/license/@xlink:href"
                                    />
                                </xmpRights:WebStatement>
                                <xmpRights:UsageTerms>
                                    <rdf:Alt>
                                        <rdf:li xml:lang="x-default">
                                            <xsl:value-of
                                                select="normalize-space(/standard/front/std-meta/permissions/copyright-statement)"
                                            />
                                        </rdf:li>
                                    </rdf:Alt>
                                </xmpRights:UsageTerms>
                            </rdf:Description>
                        </xsl:if>
                    </rdf:RDF>
                </x:xmpmeta>
            </fo:declarations>
            <fo:bookmark-tree>
                <xsl:for-each select="section">
                    <fo:bookmark>
                        <xsl:attribute name="internal-destination">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <fo:bookmark-title>
                            <xsl:value-of select="title"/>
                        </fo:bookmark-title>
                    </fo:bookmark>
                </xsl:for-each>
            </fo:bookmark-tree>
            
            <fo:page-sequence master-reference="main">
                <!-- Footer for odd pages (recto) - page number on right -->
                <fo:static-content flow-name="footer-recto">
                    <fo:block space-before="{$space-medium}" padding-top="{$space-small}"
                        font-size="{$footer-font-size}">
                        <fo:table table-layout="fixed" width="100%" role="table">
                            <fo:table-column column-width="proportional-column-width(1)"/>
                            <fo:table-column column-width="proportional-column-width(1)"/>
                            <fo:table-body>
                                <fo:table-row role="tr">
                                    <fo:table-cell text-align="left" role="td" language="en"
                                        country="GB">
                                        <fo:block font-family="{$font-family}">
                                            <xsl:value-of
                                                select="/standard/front/std-meta/title-wrap/full"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="right">
                                        <fo:block font-family="{$font-family}">
                                            <fo:page-number/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                </fo:static-content>

                <!-- Footer for even pages (verso) - page number on left -->
                <fo:static-content flow-name="footer-verso">
                    <fo:block space-before="{$space-medium}" padding-top="{$space-small}"
                        font-size="{$footer-font-size}">
                        <fo:table table-layout="fixed" width="100%" role="table">
                            <fo:table-column column-width="proportional-column-width(1)"/>
                            <fo:table-column column-width="proportional-column-width(1)"/>
                            <fo:table-body>
                                <fo:table-row role="tr">
                                    <fo:table-cell text-align="left" role="td">
                                        <fo:block>
                                            <fo:page-number/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell text-align="right" role="td">
                                        <fo:block>
                                            <xsl:value-of
                                                select="/standard/front/std-meta/title-wrap/full"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                </fo:static-content>

                <fo:flow flow-name="xsl-region-body" font-family="{$font-family}"
                    font-size="{$base-font-size}">
                    <xsl:apply-templates/>
                    <!--xsl:call-template name="index-builder"/-->
                </fo:flow>
            </fo:page-sequence>

            <xsl:call-template name="index-builder"/>

        </fo:root>
    </xsl:template>

    <xsl:template match="front">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="std-meta">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="title-wrap">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="main-title-wrap">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="main">
        <fo:block>
            <!--xsl:if test="doc-available('images/doilogo.jpg')"-->
            <fo:external-graphic src="{concat($baseLoc, '/xml/', 'images/doilogo.jpg')}" fox:alt-text="DOI logo" role="Img"/>
            <!--/xsl:if-->
        </fo:block>
        <fo:block break-after="page" font-size="48pt" role="H1">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template
        match="full | std-org-abbrev | content-language | copyright-year | copyright-holder | std-id-group | custom-meta-group"/>

    <xsl:template match="std-org-group">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="std-org">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="std-org-name">
        <fo:block hyphenate="true" language="en" role="P">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="release-date">
        <fo:block role="P">
            <xsl:text>Publication date: </xsl:text>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="permissions">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="copyright-statement">
        <fo:block font-size="{$subsection-title-size}" margin-top="6pt" margin-bottom="6pt" role="P"
            > COPYRIGHT LICENSE AGREEMENT </fo:block>
        <fo:block hyphenate="true" language="en" margin-top="6pt" margin-bottom="6pt"
            line-height-shift-adjustment="disregard-shifts" role="P">
            <xsl:apply-templates/>
        </fo:block>
        <fo:block margin-top="6pt" margin-bottom="6pt">
            <xsl:text>&#xa9; </xsl:text>
            <xsl:value-of select="../copyright-year"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="../copyright-holder"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="std-ident">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="body">
        <fo:block break-before="page" font-size="{$section-title-size}"
            space-after="{$base-font-size}">CONTENTS</fo:block>
        <fo:block break-after="page">
            <xsl:for-each select="//section[starts-with(@id, 'sec')]">
                <fo:block text-align-last="justify" space-before="{$leader-width}">
                    <xsl:attribute name="font-size">
                        <xsl:choose>
                            <xsl:when test="not(ancestor::section)">
                                <xsl:value-of select="$base-font-size"/>
                            </xsl:when>
                            <xsl:when test="count(ancestor::section) = 1">
                                <xsl:value-of select="$base-font-size"/>
                            </xsl:when>
                            <xsl:otherwise>9pt</xsl:otherwise>
                        </xsl:choose>
                    </xsl:attribute>
                    <xsl:attribute name="margin-left">
                        <xsl:value-of select="concat(count(ancestor::section) * 5, 'mm')"/>
                    </xsl:attribute>
                    <xsl:if test="not(ancestor::section)">
                        <xsl:attribute name="space-before">8pt</xsl:attribute>
                        <xsl:attribute name="font-weight">bold</xsl:attribute>
                        <xsl:attribute name="color">
                            <xsl:value-of select="$brand-color"/>
                        </xsl:attribute>
                        <fo:inline font-weight="bold">CHAPTER </fo:inline>
                    </xsl:if>
                    <xsl:number count="section[starts-with(@id, 'sec')]" format="1.1"
                        level="multiple"/>
                    <xsl:text>. </xsl:text>
                    <fo:basic-link role="Link">
                        <xsl:attribute name="internal-destination">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <xsl:value-of select="title"/>
                    </fo:basic-link>
                    <fo:leader leader-pattern="dots" leader-pattern-width="{$leader-width}"
                        leader-alignment="reference-area"/>
                    <fo:page-number-citation text-align="right">
                        <xsl:attribute name="ref-id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                    </fo:page-number-citation>
                </fo:block>
            </xsl:for-each>
        </fo:block>
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="body/section">
        
        <xsl:variable name="baseLoc">
            <xsl:choose>
                <xsl:when test="contains(translate(system-property('user.dir'), '\', '/'), ':')">
                    <xsl:value-of select="concat('file:///', translate(system-property('user.dir'), '\', '/'))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat('file://', translate(system-property('user.dir'), '\', '/'))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <fo:block break-before="page">
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <fo:float>
                <fo:block margin-left="{$chapter-margin}">
                    <!--xsl:if test="doc-available('images/doichapter.jpg')"-->
                    <fo:external-graphic src="{concat($baseLoc, '/xml/', 'images/doichapter.jpg')}" fox:alt-text="Chapter"
                        role="Img"/>
                    <!--/xsl:if-->
                </fo:block>
            </fo:float>
            <xsl:if test="starts-with(@id, 'sec')">
                <fo:block>
                    <xsl:text>Chapter </xsl:text>
                    <xsl:number value="count(preceding-sibling::section)" format="1"/>
                </fo:block>
            </xsl:if>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="body/section/title">
        <fo:block role="H1" margin-top="20pt" margin-bottom="150pt"
            font-size="{$chapter-title-size}" margin-right="40%" keep-with-next="always">

            <xsl:value-of select="upper-case(.)"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="body/section/section[1]">
        <!-- mini toc here -->
        <xsl:if test="starts-with(@id, 'sec')">
            <fo:block font-size="14pt" margin-top="{$chapter-margin}" color="{$brand-color}"> In
                This Chapter</fo:block>
        </xsl:if>
        <fo:block break-after="page">
            <xsl:for-each select="../section[starts-with(@id, 'sec')]">
                <fo:block text-align-last="justify" space-before="{$leader-width}">
                    <xsl:number count="section[starts-with(@id, 'sec')]" format="1.1"
                        level="multiple"/>
                    <xsl:text>. </xsl:text>
                    <fo:basic-link role="Link">
                        <xsl:attribute name="internal-destination">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                        <xsl:value-of select="title"/>
                    </fo:basic-link>
                    <fo:leader leader-pattern="dots" leader-pattern-width="{$leader-width}"
                        leader-alignment="reference-area"/>
                    <fo:page-number-citation text-align="right">
                        <xsl:attribute name="ref-id">
                            <xsl:value-of select="@id"/>
                        </xsl:attribute>
                    </fo:page-number-citation>
                </fo:block>
            </xsl:for-each>
        </fo:block>
        <!-- end mini toc here -->
        <fo:block>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="section">
        <fo:block>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="section/section/title">
        <fo:block margin-top="20pt" margin-bottom="6pt" font-size="{$section-title-size}"
            keep-with-next="always">
            <xsl:attribute name="role">H<xsl:value-of select="count(ancestor::section)"
                /></xsl:attribute>
            <xsl:attribute name="font-size">
                <xsl:choose>
                    <xsl:when test="count(ancestor::section) = 2">16pt</xsl:when>
                    <xsl:when test="count(ancestor::section) = 3">12pt</xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$base-font-size"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:number count="section[starts-with(@id, 'sec')]" format="1.1" level="multiple"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="upper-case(.)"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="list">
        <fo:list-block provisional-distance-between-starts="{$space-small}"
            provisional-label-separation="3mm" space-before="6pt" space-after="6pt" role="L">
            <xsl:apply-templates/>
        </fo:list-block>
    </xsl:template>

    <xsl:template match="list-item">
        <fo:list-item role="LI">
            <fo:list-item-label end-indent="label-end()" role="Lbl">
                <fo:block>&#8226;</fo:block>
            </fo:list-item-label>
            <fo:list-item-body start-indent="body-start()" role="LBody">
                <fo:block>
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>
        </fo:list-item>
    </xsl:template>

    <xsl:template match="list-item[../@list-type = 'numbered']">
        <fo:list-item role="LI">
            <fo:list-item-label end-indent="label-end()" role="Lbl">
                <fo:block font-size="9pt"><xsl:number value="count(preceding-sibling::*) + 1"
                        format="1"/>. </fo:block>
            </fo:list-item-label>
            <fo:list-item-body start-indent="body-start()" role="LBody">
                <fo:block hyphenate="true" language="en">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>
        </fo:list-item>
    </xsl:template>

    <xsl:template match="list/list-item[../@list-type = 'alpha']">
        <fo:list-item>
            <fo:list-item-label>
                <fo:block><xsl:number value="count(preceding-sibling::*) + 1" format="a"/>.
                </fo:block>
            </fo:list-item-label>
            <fo:list-item-body start-indent="body-start()">
                <fo:block hyphenate="true" language="en">
                    <xsl:apply-templates/>
                </fo:block>
            </fo:list-item-body>
        </fo:list-item>
    </xsl:template>

    <xsl:template match="table-wrap">
        <fo:block>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="table-wrap/label"/>

    <xsl:template match="caption">
        <fo:block keep-with-next="always" role="Caption">
            <fo:inline color="{$brand-color}">
                <xsl:value-of select="../label"/>
            </fo:inline>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="caption/title">
        <fo:inline>
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xsl:template match="table">
        <fo:table width="100%" border-collapse="collapse" table-layout="fixed" role="table">
            <xsl:apply-templates select="colgroup"/>
            <xsl:apply-templates select="thead | tbody"/>
        </fo:table>
    </xsl:template>

    <xsl:template match="colgroup">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template match="col">
        <fo:table-column>
            <xsl:choose>
                <!-- Handle proportional widths like "3*" -->
                <xsl:when test="@width and contains(@width, '*')">
                    <xsl:attribute name="column-width">
                        <xsl:text>proportional-column-width(</xsl:text>
                        <xsl:value-of select="substring-before(@width, '*')"/>
                        <xsl:text>)</xsl:text>
                    </xsl:attribute>
                </xsl:when>
                <!-- Handle fixed widths like "50mm" or "2in" -->
                <xsl:when test="@width">
                    <xsl:attribute name="column-width">
                        <xsl:value-of select="@width"/>
                    </xsl:attribute>
                </xsl:when>
                <!-- Default: equal distribution -->
                <xsl:otherwise>
                    <xsl:attribute name="column-width">
                        <xsl:text>proportional-column-width(1)</xsl:text>
                    </xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
        </fo:table-column>
    </xsl:template>

    <xsl:template match="thead">
        <fo:table-header role="thead">
            <xsl:apply-templates/>
        </fo:table-header>
    </xsl:template>

    <xsl:template match="tbody">
        <fo:table-body role="tbody">
            <xsl:apply-templates/>
        </fo:table-body>
    </xsl:template>

    <xsl:template match="tr">
        <fo:table-row role="tr">
            <xsl:apply-templates/>
        </fo:table-row>
    </xsl:template>

    <xsl:template match="th">
        <fo:table-cell border="0.5px solid black" padding-right="{$table-cell-padding}" padding-left="{$table-cell-padding}"
            background-color="{$brand-color}" role="th">
            <xsl:if test="@colspan">
                <xsl:attribute name="number-columns-spanned">
                    <xsl:value-of select="@colspan"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@rowspan">
                <xsl:attribute name="number-rows-spanned">
                    <xsl:value-of select="@rowspan"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </fo:table-cell>
    </xsl:template>

    <xsl:template match="th/p">
        <fo:block font-weight="bold" role="Strong" margin-top="6pt" margin-bottom="6pt"
            text-align="center">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="td">
        <fo:table-cell border="0.5px solid black" padding-right="{$table-cell-padding}" padding-left="{$table-cell-padding}" role="td">
            <xsl:if test="@colspan">
                <xsl:attribute name="number-columns-spanned">
                    <xsl:value-of select="@colspan"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="@rowspan">
                <xsl:attribute name="number-rows-spanned">
                    <xsl:value-of select="@rowspan"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/>
        </fo:table-cell>
    </xsl:template>

    <xsl:template match="td/p">
        <fo:block margin-top="{$leader-width}" margin-bottom="{$leader-width}" text-align="justify"
            hyphenate="true" language="en" country="GB"
            line-height-shift-adjustment="disregard-shifts">
            <xsl:if test="@content-type = 'note'">
                <fo:inline color="{$brand-color}" role="Note">NOTE </fo:inline>
            </xsl:if>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="subtitle">
        <fo:block margin-top="6pt" margin-bottom="6pt" font-weight="bold">
            <xsl:value-of select="upper-case(.)"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="p">
        <fo:block margin-top="6pt" role="P" margin-bottom="6pt" text-align="justify"
            hyphenate="true" language="en" country="GB"
            line-height-shift-adjustment="disregard-shifts">
            <xsl:if test="@content-type = 'note'">
                <fo:inline color="{$brand-color}" role="Note">NOTE </fo:inline>
            </xsl:if>
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="break">
        <fo:block role="Separator"/>
    </xsl:template>

    <xsl:template match="tbx:termEntry">
        <fo:block margin-top="6pt" margin-bottom="{$leader-width}" keep-with-next="always">
            <xsl:value-of select="tbx:langSet/tbx:term"/>
        </fo:block>
        <fo:block margin-top="0pt" margin-bottom="12pt">
            <xsl:value-of select="tbx:langSet/tbx:definition"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="tbx:langSet | tbx:term | tbx:definition"/>

    <xsl:template match="fig">
        <fo:block keep-with-next="always" text-align="center">
            <fo:external-graphic role="Figure">
                <xsl:attribute name="src">
                    <xsl:value-of select="concat($baseLoc, '/xml/', graphic/@xlink:href)"/> <!-- changed from just graphic/@xlink:href -->
                </xsl:attribute>
                <xsl:attribute name="fox:alt-text">
                    <xsl:choose>
                        <xsl:when test="caption/title">
                            <xsl:value-of select="label"/>: <xsl:value-of select="caption/title"/>
                        </xsl:when>
                        <xsl:when test="alt-text">
                            <xsl:value-of select="alt-text"/>
                        </xsl:when>
                        <xsl:otherwise>Figure <xsl:value-of select="label"/></xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <xsl:attribute name="scaling">uniform</xsl:attribute>
                <xsl:attribute name="content-width">scale-to-fit</xsl:attribute>
                <xsl:attribute name="max-width">100%</xsl:attribute>
            </fo:external-graphic>
        </fo:block>
        <fo:block keep-with-previous="always" text-align="left">
            <fo:inline color="{$brand-color}">
                <xsl:value-of select="label"/>
            </fo:inline>
            <xsl:text> </xsl:text>
            <xsl:value-of select="caption/title"/>
        </fo:block>
    </xsl:template>

    <xsl:template match="sup">
        <fo:inline baseline-shift="super" font-size="{$superscript-size}" role="Sup">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xsl:template match="xref">
        <fo:basic-link color="{$link-color}" role="Link">
            <xsl:attribute name="internal-destination">
                <xsl:value-of select="@rid"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </fo:basic-link>
    </xsl:template>

    <xsl:template match="ext-link">
        <fo:basic-link color="{$link-color}" role="Link">
            <xsl:attribute name="external-destination">
                <xsl:value-of select="@xlink:href"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </fo:basic-link>
    </xsl:template>

    <xsl:template match="bold">
        <fo:inline font-weight="bold">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

    <xsl:template match="index-term">
        <xsl:apply-templates/>
    </xsl:template>

    <xsl:template name="index-builder">
        <fo:page-sequence master-reference="index">
            <fo:static-content flow-name="footer-recto">
                <fo:block space-before="{$space-medium}" padding-top="{$space-small}"
                    font-size="{$footer-font-size}">
                    <fo:table table-layout="fixed" width="100%" role="table">
                        <fo:table-column column-width="proportional-column-width(1)"/>
                        <fo:table-column column-width="proportional-column-width(1)"/>
                        <fo:table-body>
                            <fo:table-row role="tr">
                                <fo:table-cell text-align="left" role="td">
                                    <fo:block>Index</fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="right" role="td">
                                    <fo:block>
                                        <fo:page-number/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:block>
            </fo:static-content>
            <fo:static-content flow-name="footer-verso">
                <fo:block space-before="{$space-medium}" padding-top="{$space-small}"
                    font-size="{$footer-font-size}">
                    <fo:table table-layout="fixed" width="100%" role="table">
                        <fo:table-column column-width="proportional-column-width(1)"/>
                        <fo:table-column column-width="proportional-column-width(1)"/>
                        <fo:table-body>
                            <fo:table-row role="tr">
                                <fo:table-cell text-align="left" role="td">
                                    <fo:block>
                                        <fo:page-number/>
                                    </fo:block>
                                </fo:table-cell>
                                <fo:table-cell text-align="right" role="td">
                                    <fo:block>Index</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:block>
            </fo:static-content>

            <fo:flow flow-name="xsl-region-body" font-family="{$font-family}"
                font-size="{$base-font-size}" line-height="{$base-line-height}">
                <fo:block break-before="page" break-after="page" column-gap="{$space-medium}"
                    font-family="{$font-family}">
                    <fo:float>
                        <fo:block margin-left="{$chapter-margin}">
                            <fo:external-graphic src="{concat($baseLoc, '/xml/', 'images/doichapter.jpg')}" fox:alt-text="index"
                                role="index"/>
                        </fo:block>
                    </fo:float>
                    <fo:block margin-top="{$chapter-margin}" margin-bottom="{$big-margin}"
                        font-size="{$chapter-title-size}">INDEX</fo:block>
                    <fo:block>
                        <xsl:for-each-group select="//index-term"
                            group-by="upper-case(substring(normalize-space(.), 1, 1))">
                            <xsl:sort select="current-grouping-key()"/>
                            <fo:block margin-top="30pt" margin-bottom="12pt" color="{$brand-color}">
                                <xsl:value-of select="current-grouping-key()"/>
                            </fo:block>
                            <xsl:for-each-group select="current-group()"
                                group-by="normalize-space(.)">
                                <xsl:sort lang="en" select="upper-case(current-grouping-key())"/>
                                <fo:block text-align-last="justify">
                                    <fo:basic-link role="Link">
                                        <xsl:attribute name="internal-destination">
                                            <xsl:value-of select="current-group()[1]/@ref"/>
                                        </xsl:attribute>
                                        <fo:inline>
                                            <xsl:value-of select="current-grouping-key()"/>
                                        </fo:inline>
                                        <fo:leader leader-pattern="dots"
                                            leader-pattern-width="{$leader-width}"
                                            leader-alignment="reference-area"/>
                                        <fo:inline text-align="right">
                                            <xsl:for-each select="current-group()">
                                                <fo:page-number-citation>
                                                  <xsl:attribute name="ref-id">
                                                  <xsl:value-of select="@ref"/>
                                                  </xsl:attribute>
                                                </fo:page-number-citation>
                                                <xsl:if test="position() != last()">, </xsl:if>
                                            </xsl:for-each>
                                        </fo:inline>
                                    </fo:basic-link>
                                </fo:block>
                            </xsl:for-each-group>
                        </xsl:for-each-group>
                    </fo:block>
                </fo:block>
            </fo:flow>
        </fo:page-sequence>
    </xsl:template>

</xsl:stylesheet>