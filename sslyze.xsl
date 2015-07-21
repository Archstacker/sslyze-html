<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:my="my:my">
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


                    <a id="cert" href="#" class="detail-drawer-tab active">
                      <h3>Certificate Details</h3>
                    </a>
                    <div style="display: block;" class="detail-drawer certificate-drawer">
                      <div class="drawer-info-holder">
                        <div class="info-block">
                          <strong class="info-category"> Common Name: </strong>
                          <span class="data"> <xsl:value-of select="certinfo/certificateChain/certificate/subject/commonName"/> </span>
                        </div>
                        <div class="info-block">
                          <strong class="info-category"> Issuer Name: </strong>
                          <span class="data"> <xsl:value-of select="certinfo/certificateChain/certificate/issuer/commonName"/> </span>
                        </div>
                        <div class="info-block">
                          <strong class="info-category"> Serial Number: </strong>
                          <span class="data"> <xsl:value-of select="certinfo/certificateChain/certificate/serialNumber"/> </span>
                        </div>
                        <div class="info-block">
                          <strong class="info-category"> Not Before: </strong>
                          <span class="data"> <xsl:value-of select="certinfo/certificateChain/certificate/validity/notBefore"/> </span>
                        </div>
                        <div class="info-block">
                          <strong class="info-category"> Not After: </strong>
                          <span class="data"> <xsl:value-of select="certinfo/certificateChain/certificate/validity/notAfter"/> </span>
                        </div>
                        <div class="info-block">
                          <strong class="info-category"> Signature Algorithm: </strong>
                          <span class="data"> <xsl:value-of select="certinfo/certificateChain/certificate/signatureAlgorithm"/> </span>
                        </div>
                        <div class="info-block">
                          <strong class="info-category"> Public Key Algorithm: </strong>
                          <span class="data"> <xsl:value-of select="certinfo/certificateChain/certificate/subjectPublicKeyInfo/publicKeyAlgorithm"/> </span>
                        </div>
                        <div class="info-block">
                          <strong class="info-category"> Key Size: </strong>
                          <span class="data"> <xsl:value-of select="certinfo/certificateChain/certificate/subjectPublicKeyInfo/publicKeySize"/> </span>
                        </div>
                        <div class="info-block border-split">
                          <strong class="info-category"> Exponent: </strong>
                          <span class="data"> <xsl:value-of select="certinfo/certificateChain/certificate/subjectPublicKeyInfo/publicKey/exponent"/> </span>
                        </div>

                        <div class="certificate-no-chain-block w-chain-block">
                          <div class="drawer-info-holder">
                            <div class="info-block">
                              <strong class="info-category">Recommended certificate chain:</strong>
                            </div>
                            <div class="certificate-chain-block">
                              <img src="ssl_files/chain-server-certificate.png" alt="Server Certificate image" width="61" height="56"></img>
                              <div class="chain-holder">
                                <xsl:apply-templates select="certinfo/certificateChain/certificate[1]"/>
                              </div>
                            </div>
                            <div class="certificate-chain-block">
                              <img src="ssl_files/chain-intermediate-certificate.png" alt="CA Certificate image" width="61" height="56"></img>
                              <div class="chain-holder">
                                <xsl:apply-templates select="certinfo/certificateChain/certificate[2]"/>
                              </div>
                            </div>
                            <div class="certificate-chain-block">
                              <img src="ssl_files/chain-root-certificate.png" alt="Root Certificate image" width="61" height="56"></img>
                              <div class="chain-holder root">
                                <xsl:apply-templates select="certinfo/certificateChain/certificate[3]"/>
                              </div>
                            </div>
                          </div>
                        </div>

                      </div>
                    </div>


                    <a id="chiper" href="#" class="detail-drawer-tab active">
                      <h3>Cipher Suites</h3>
                    </a>
                    <div style="display: block;" class="detail-drawer ssl-drawer">
                      <div class="drawer-info-holder">
                        <div class="info-block">
                          <strong class="info-category"> Protocol: </strong>
                          <strong class="info-category ssl-supported"> Supported: </strong>
                        </div>
                        <div class="info-block">
                            <span class="protocol-type"> SSL 2.0 </span>
                            <span class="data good">
                              <xsl:apply-templates select="sslv2/@isProtocolSupported"/>
                            </span>
                        </div>
                        <div class="info-block">
                            <span class="protocol-type"> SSL 3.0 </span>
                            <span class="data good">
                              <xsl:apply-templates select="sslv3/@isProtocolSupported"/>
                            </span>
                        </div>
                        <div class="info-block">
                            <span class="protocol-type"> TLS 1.0 </span>
                            <span class="data good">
                              <xsl:apply-templates select="tlsv1/@isProtocolSupported"/>
                            </span>
                        </div>
                        <div class="info-block">
                            <span class="protocol-type"> TLS 1.1 </span>
                            <span class="data good">
                              <xsl:apply-templates select="tlsv1_1/@isProtocolSupported"/>
                            </span>
                        </div>
                        <div class="info-block">
                            <span class="protocol-type"> TLS 1.2 </span>
                            <span class="data good">
                              <xsl:apply-templates select="tlsv1_2/@isProtocolSupported"/>
                            </span>
                        </div>
                      </div>
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


                    <a id="misc" href="#" class="detail-drawer-tab active">
                      <h3> Miscellaneous Details </h3>
                    </a>
                    <div style="display: block;" class="detail-drawer">
                      <div class="drawer-info-holder">

                        <div class="grid">
                          <div class="info-block">
                            <strong class="info-category section">
                              <xsl:value-of select="compression/@title"/>
                            </strong>
                            <div class="info-block">
                              <strong class="grid-data"> isSupported </strong>
                              <span class="pass-fail good">
                                <xsl:value-of select="compression/compressionMethod/@isSupported"/>
                              </span>
                            </div>
                          </div>
                        </div>

                        <div class="grid">
                          <div class="info-block">
                            <strong class="info-category section">
                              <xsl:value-of select="heartbleed/@title"/>
                            </strong>
                            <div class="info-block">
                              <strong class="grid-data"> isVulnerable </strong>
                              <span class="pass-fail good">
                                <xsl:value-of select="heartbleed/openSslHeartbleed/@isVulnerable"/>
                              </span>
                            </div>
                          </div>
                        </div>

                        <div class="grid">
                          <div class="info-block">
                            <strong class="info-category section">
                              <xsl:value-of select="reneg/@title"/>
                            </strong>
                            <div class="info-block">
                              <strong class="grid-data"> canBeClientInitiated </strong>
                              <span class="pass-fail good">
                                <xsl:value-of select="reneg/sessionRenegotiation/@canBeClientInitiated"/>
                              </span>
                            </div>
                          </div>
                        </div>

                        <div class="grid">
                          <div class="info-block">
                            <strong class="info-category section">
                              <xsl:value-of select="resum/@title"/>
                            </strong>
                            <div class="info-block">
                              <strong class="grid-data"> sessionResumptionWithTLSTickets </strong>
                              <span class="pass-fail good">
                                <xsl:value-of select="resum/sessionResumptionWithTLSTickets/@isSupported"/>
                              </span>
                            </div>
                          </div>
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

  <xsl:template match="sslv2 | sslv3 | tlsv1 | tlsv1_1 | tlsv1_2">
    <div class="info-block">
        <strong class="info-category"> <xsl:value-of select="@title"/> </strong>
      <strong class="info-category strength">Effective Strength:</strong>
      <xsl:apply-templates select="acceptedCipherSuites" />
    </div>
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

  <xsl:template match="@isProtocolSupported">
    <span class="data good">
      <xsl:value-of select="."/>
    </span>
  </xsl:template>

  <xsl:template match="certificate">
    <div class="certificate-info-block">
      <div class="certificate-info-holder">
        <div class="certificate-content">
          <div class="content-block subject">
            <div class="content-type"> Subject: </div>
            <ul class="certificate-data-content">
              <xsl:for-each select="subject/*">
                <li>
                    <span class="certificate-data-category">
                      <xsl:apply-templates select="."/>
                    </span>
                    <span class="content">
                      <xsl:value-of select="."/>
                    </span>
                </li>
              </xsl:for-each>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </xsl:template>

  <my:codes>
    <code key="organizationalUnitName" value="OU"/>
    <code key="organizationName" value="O"/>
    <code key="commonName" value="CN"/>
    <code key="stateOrProvinceName" value="ST"/>
    <code key="countryName" value="C"/>
    <code key="localityName" value="L"/>
  </my:codes>
  <xsl:key name="kCodeByName" match="code" use="@key"/>

  <xsl:template match="node()[name() = document('')/*/my:codes/*/@key]">
      <xsl:variable name="vCur" select="name()"/>
      <xsl:for-each select="document('')">
          <xsl:value-of select=
           "key('kCodeByName', $vCur)/@value"/>
      </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
