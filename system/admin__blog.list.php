<?php

if(($D['ACTION']??null) == 'save') {
	$C['papp~blog']['CData']->set_object($D); 
}

#$F['PAGE']['W'][0]['ID'] = [$D['_ID']];
$F['BLOG']['LANGUAGE'] = [];


$C['papp~blog']['CData']->get_object($D,$F);
unset($F);