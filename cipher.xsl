<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html"/>

  <xsl:variable name="relationship">
    <full key="sslv2" value="SSL 2.0"/>
    <full key="sslv3" value="SSL 3.0"/>
    <full key="tlsv1" value="TLS 1.0"/>
    <full key="tlsv1_1" value="TLS 1.1"/>
    <full key="tlsv1_2" value="TLS 1.2"/>
  </xsl:variable>

  <xsl:key name="FullName" match="full" use="@key"/>

  <xsl:template name="fullname">
      <xsl:param name="key"/>
      <xsl:for-each select="document('')">
          <xsl:value-of select="key('FullName', $key)/@value"/>
      </xsl:for-each>
  </xsl:template>

  <xsl:template match="sslv2 | sslv3 | tlsv1 | tlsv1_1 | tlsv1_2">
    <xsl:if test="name() = 'sslv2'">
      <div class="info-block">
        <strong class="info-category"> Protocol: </strong>
        <strong class="info-category ssl-supported"> Supported: </strong>
      </div>
    </xsl:if>
    <div class="info-block">
      <span class="protocol-type"> 
        <xsl:call-template name="fullname">
          <xsl:with-param name="key" select="name()"/>
        </xsl:call-template>
      </span>
      <xsl:choose>
        <xsl:when test="(starts-with(name(),'ssl') and @isProtocolSupported='False') or (starts-with(name(),'tls') and @isProtocolSupported='True')">
          <span class="data good">
            <xsl:value-of select="@isProtocolSupported"/>
          </span>
        </xsl:when>
        <xsl:otherwise>
          <span class="data bad">
            <xsl:value-of select="@isProtocolSupported"/>
          </span>
          <xsl:choose>
            <xsl:when test="name() = 'sslv2'">
              <xsl:call-template name="tooltip">
                <xsl:with-param name="tipstr" select="'SSL v2 should be disabled as it has known security issues'"/>
              </xsl:call-template>
            </xsl:when>
            <xsl:when test="name() = 'sslv3'">
              <xsl:call-template name="tooltip">
                <xsl:with-param name="tipstr" select="'SSL v3 should be disabled if compatibility with older mobile clients is not required'"/>
              </xsl:call-template>
            </xsl:when>
            <xsl:when test="name() = 'tlsv1'">
              <xsl:call-template name="tooltip">
                <xsl:with-param name="tipstr" select="'TLS v1.0 should be enabled for optimum compatibility'"/>
              </xsl:call-template>
            </xsl:when>
            <xsl:when test="name() = 'tlsv1_1' or name() = 'tlsv1_2'">
              <xsl:call-template name="tooltip">
                <xsl:with-param name="tipstr" select="'Server should enable more recent versions of TLS protocol'"/>
              </xsl:call-template>
            </xsl:when>
          </xsl:choose>
        </xsl:otherwise>
      </xsl:choose>
    </div>
  </xsl:template>

  <xsl:template name="tooltip">
    <xsl:param name="tipstr"/>
      <a class="tooltip-link overflow">
        <span class="tooltip">
          <span class="tooltip-holder">
              <xsl:value-of select="$tipstr" />
            <span class="arrow">arrow</span>
          </span>
        </span>
      </a>
  </xsl:template>

</xsl:stylesheet>
