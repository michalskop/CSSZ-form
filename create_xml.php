<?php
  header('Content-Type: text/plain');
 
  if (!isset($_GET['organization'])) {
    echo 'No organization, no fun';
    die();
  }
  include ('organizations/'.$_GET['organization'].'.php');

  
$xml0 = new SimpleXMLElement('<?xml version="1.0" encoding="UTF-8" ?><pvpoj xmlns="http://schemas.cssz.cz/POJ/PVPOJ2013"></pvpoj>');
$xml = $xml0->addChild('prehled');
$xml->addAttribute('typPrehledu','N');
$xml->addAttribute('verze','2013.0');


$ar = array();
//okres
$ar['okres'] = $okres;
//obdobi
$obdobi = array(
  'mesic' => trim($_GET['month']),
  'rok' => trim($_GET['year'])
);
$ar['obdobi'] = $obdobi;
//zamestnavatel
$ar['zamestnavatel'] = $zamestnavatel;
//pojistne
$pojistne = array(
  'uhrnVymerovacichZakladuPbezDS' => trim($_GET['uhrnVymerovacichZakladuPbezDS']),
  'uhrnPojistnehoPbezDS' => trim($_GET['uhrnPojistnehoPbezDS']),
  'uhrnVymerovacichZakladuPsDS' => trim($_GET['uhrnVymerovacichZakladuPsDS']),
  'uhrnPojistnehoPsDS' => trim($_GET['uhrnPojistnehoPsDS']),
  'uhrnVymerovacichZakladu' => trim($_GET['uhrnVymerovacichZakladu']),
  'uhrnPojistneho' => trim($_GET['uhrnPojistneho']),
  'pojistneCelkem' => trim($_GET['uhrnPojistnehoPbezDS']) + trim($_GET['uhrnPojistnehoPsDS']) + trim($_GET['uhrnPojistneho']),
);
$ar['pojistne'] = $pojistne;
//nahrada mzdy
if (($ar['zamestnavatel']['sazba'] - 1) != 0){
  echo 'Sazba zaměstnavatele není 1, to zatím neumím';
  die();
}
$nahrady = array(
  'uhrnZuctovanychNahrad' => 0,
  'polovinaZuctovanychNahrad' => 0
);
$ar['nahradyMzdy'] = $nahrady;
$ar['rozdilPojistneNahrady'] = $pojistne['pojistneCelkem'] - 0;
//platebni udaje
$ar['platebniUdaje'] = $platebni_udaje;
//pracovnik
$ar['pracovnik'] = $pracovnik;
$ar['pracovnik']['datumVyplneni'] = trim($_GET['date']);
//poznamka
$ar['poznamka'] = '';



array_to_xml($ar, $xml);
echo $xml0->asXML();

// function defination to convert array to xml
function array_to_xml($student_info, &$xml_student_info) {
    foreach($student_info as $key => $value) {
        if(is_array($value)) {
            if(!is_numeric($key)){
                $subnode = $xml_student_info->addChild("$key");
                array_to_xml($value, $subnode);
            }
            else{
                $subnode = $xml_student_info->addChild("item$key");
                array_to_xml($value, $subnode);
            }
        }
        else {
            $xml_student_info->addChild("$key","$value");
        }
    }
}  
?>
