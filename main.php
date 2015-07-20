 <?php
$xml = new DOMDocument();
$xml->load('sslyze.xml');

$xsl = new DOMDocument();
$xsl->load('sslyze.xsl');

$proc = new XSLTProcessor();
$proc->importStyleSheet($xsl);

echo $proc->transformToXML($xml);
?> 
