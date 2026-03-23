<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <sch:pattern>
        <sch:rule context="p[@*]">
            <sch:assert test="@content-type">Attribute other than 'content-type' found on 'p' tag.</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern>
        <sch:rule context="p[@content-type]">
            <sch:assert test="not(@content-type != 'note')">'content-type' attribute something other than 'note'</sch:assert>
        </sch:rule>
    </sch:pattern>
    <sch:pattern>
        <!-- Change the attribute to point the element being the context of the assert expression. -->
        <sch:rule context="p">
            <!-- Change the assert expression. -->
            <sch:assert test="true()">Error message.</sch:assert>
        </sch:rule>
    </sch:pattern>
</sch:schema>