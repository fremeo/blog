<?php


#Seo Link Registrierung
/*
$D['LINK']['D'][ hash("crc32b", 'admin/link.list.html') ] = [
	'FromURL' => "admin/link.list.html",
	'ToURL' => "D[_PAGE]=admin__link.list&R[ModulId]=papp/framework",
	'Active' => 1,
];
*/
#DB-----------------

$Pattern = [];

$Pattern['BLOG'] = [
	'Active'	=> ['Type' => 'checkbox'],
	'DateTime'	=> ['Type' => 'text'],
];
$Pattern['BLOG']['D']['LANGUAGE'] = [
	'Title'		=> ['Type' => 'text'],
	'Text'		=> ['Type' => 'text'],
	'ShortText'	=> ['Type' => 'text'],
	'LinkId'	=> ['Type' => 'id'], #ID für LINK je Sprache
];

#$C['CData']->registerPattern($Pattern);

$C['papp~blog']['CData'] = new \papp\CData( [ 'DB' => ['FILENAME' => PROJECT_ROOT.'data/papp~blog/data.db', 'FILENAME_C' => PROJECT_ROOT.'data_c/papp~blog/data.db' ] ] );
$C['papp~blog']['CData']->registerPattern($Pattern);

/*
$F['BLOG']['LANGUAGE'] = [];
$C['papp~phpapp']['CData']->get_object($D1,$F);
$C['papp~blog']['CData']->set_object($D1);
*/
