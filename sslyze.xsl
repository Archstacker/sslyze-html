<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" version="1.0" encoding="utf-8" indent="yes"/>
  <xsl:template match="/document/results/target">
    <html>
      <head>
        <title> SSL Check </title>
        <link media="all" rel="stylesheet" type="text/css" href="all-ssl-config.css"/>
      </head>
      <body class="sub-inner-page">
        <div id="wrapper">
          <div class="sub-inner">
            <div class="sub-inner-w1">
              <div class="sub-inner-w2">
                <div class="sub-inner-w3">
                  <div class="details-block">

                    <a id="server" href="#" class="detail-drawer-tab active">
                      <h3> Server Details </h3>
                    </a>
                    <div style="display: block;" class="detail-drawer server-drawer">
                      <div class="drawer-info-holder">
                        <div class="info-block">
                          <strong class="info-category"> Hostname: </strong>
                          <span class="data"> <xsl:value-of select="@host"/> </span>
                        </div>
                        <div class="info-block">
                          <strong class="info-category"> IP Address: </strong>
                          <span class="data"> <xsl:value-of select="@ip"/> </span>
                        </div>
                        <div class="info-block">
                          <strong class="info-category"> Port: </strong>
                          <span class="data"> <xsl:value-of select="@port"/> </span>
                        </div>
                      </div>
                    </div>

                    <a id="chiper" href="#" class="detail-drawer-tab active">
                      <h3>Cipher Suites</h3>
                    </a>
                    <div style="display: block;" class="detail-drawer server-drawer">
                      <div class="cipher-drawer">
                        <div class="drawer-info-holder">
                          <xsl:apply-templates select="sslv2"/>
                          <xsl:apply-templates select="sslv3"/>
                          <xsl:apply-templates select="tlsv1"/>
                          <xsl:apply-templates select="tlsv1_1"/>
                          <xsl:apply-templates select="tlsv1_2"/>
                        </div>
                      </div>
                    </div>

                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="sslv2">
        <strong class="info-category">SSL 2.0:</strong>
        <strong class="info-category strength">Effective Strength:</strong>
        <xsl:apply-templates select="acceptedCipherSuites" />
  </xsl:template>

  <xsl:template match="sslv3">
        <strong class="info-category">SSL 3.0:</strong>
        <strong class="info-category strength">Effective Strength:</strong>
        <xsl:apply-templates select="acceptedCipherSuites" />
  </xsl:template>

  <xsl:template match="tlsv1">
        <strong class="info-category">TLS 1.0:</strong>
        <strong class="info-category strength">Effective Strength:</strong>
        <xsl:apply-templates select="acceptedCipherSuites" />
  </xsl:template>

  <xsl:template match="tlsv1_1">
        <strong class="info-category">TLS 1.1:</strong>
        <strong class="info-category strength">Effective Strength:</strong>
        <xsl:apply-templates select="acceptedCipherSuites" />
  </xsl:template>

  <xsl:template match="tlsv1_2">
        <strong class="info-category">TLS 1.2:</strong>
        <strong class="info-category strength">Effective Strength:</strong>
        <xsl:apply-templates select="acceptedCipherSuites" />
  </xsl:template>

  <xsl:template match="cipherSuite">
    <div class="info-block">
      <xsl:apply-templates select="@name"/>
      <xsl:apply-templates select="@keySize"/>
    </div>
  </xsl:template>

  <xsl:template match="@name">
    <span class="protocol-type">
      <xsl:value-of select="."/>
    </span>
  </xsl:template>

  <xsl:template match="@keySize">
    <span class="data neutral">
      <xsl:value-of select="."/>
    </span>
  </xsl:template>

</xsl:stylesheet>
