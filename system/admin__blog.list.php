<?php

if(($D['ACTION']??null) == 'save') {
	$C['papp~blog']['CData']->set_object($D); 
}

#$F['PAGE']['W'][0]['ID'] = [$D['_ID']];
$F['BLOG']['LANGUAGE'] = [];

$F['BLOG']['L'] = $R['F']['BLOG']['L']??null;


$C['papp~blog']['CData']->get_object($D,$F);
unset($F);

# lesen der Links für die Vorschau
if($D['BLOG']['D']??null) {
	foreach($D['BLOG']['D'] AS $kB => $B) {
		foreach($B['LANGUAGE']['D'] AS $kBL => $BL) {
			$_Links[] = $BL['LINK'];
		}
	}
	$F['LINK']['W'][0]['ID'] = $_Links;
}

