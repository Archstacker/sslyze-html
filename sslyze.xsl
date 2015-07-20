<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">  
  <xsl:output method="html" version="1.0" encoding="utf-8" indent="yes"/>  
  <xsl:template match="/document/results/target"> 
    <html> 
      <head> 
        <title>SSL Check</title>  
        <link media="all" rel="stylesheet" type="text/css" href="all-ssl-config.css"/> 
      </head>  
      <body class="sub-inner-page"> 
        <div id="wrapper"> 
          <div class="sub-inner"> 
            <div class="sub-inner-w1"> 
              <div class="sub-inner-w2"> 
                <div class="sub-inner-w3"> 
                  <div class="details-block"> 
                    <a id="srv" href="#" class="detail-drawer-tab active"> 
                      <h3>Server Details</h3> 
                    </a>  
                    <div style="display: block;" class="detail-drawer server-drawer"> 
                      <div class="cipher-drawer"> 
                        <div class="drawer-info-holder"> 
                          <div class="info-block"> 
                            <strong class="info-category">Cipher Suites: 
                              <span class="sub-info">(SSLv3+ suites in server-preferred order, then SSLv2 suites where used)</span> 
                            </strong>  
                            <strong class="info-category strength">Effective Strength:</strong> 
                          </div>  
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
  <xsl:template match="acceptedCipherSuites/cipherSuite"> 
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
