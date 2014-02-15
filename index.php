<?php

include "settings.php";
require($smarty_path);
$smarty = new Smarty();
$smarty->setTemplateDir('./smarty/templates');
$smarty->setCompileDir('./smarty/templates_c');

//$smarty->error_reporting = E_ALL & ~E_NOTICE;
error_reporting(E_ALL);

if (isset($_GET['formjson'])) {
  $formobj = json_decode(file_get_contents($_GET['formjson']));
  if (!$formobj) {
    echo 'Something wrong with the JSON file, cannot procede.';
    die();
  }
  $ar = recursion($formobj,array());
  $ar['children']['formjson'] = array('id' => 'formjson', 'value' => $_GET['formjson'], 'type'=>'hidden');
  $smarty->assign('data', $ar);
    if ($ar['jqm'])
      $smarty->display('jqm.tpl');
    else
      $smarty->display('recursion.tpl');
} else {
  echo 'No JSON file, no fun. (Try example with adding ?formjson=example.json to the address)';
}

function recursion ($obj,$ar) {
  foreach ($obj as $key => $item) {
    if ((is_object($item)) or (is_array($item))) {
      $ar[$key] = recursion($item,array());
    } else {
      $ar[$key] = $item;
    }
  }
  return $ar;
}
