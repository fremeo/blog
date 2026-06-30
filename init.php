<?php


#Seo Link Registrierung
/*
$D['LINK']['D'][ hash("crc32b", 'admin/link.list.html') ] = [
	'FromURL' => "admin/link.list.html",
	'ToURL' => "D[_PAGE]=admin__link.list&R[ModulId]=fremeo/framework",
	'Active' => 1,
];
*/
#DB-----------------

$Pattern = [];

$Pattern['BLOG'] = [
	'Active'	=> ['Type' => 'checkbox'],
	'DateTime'	=> ['Type' => 'text'],
	'MainImg'	=> ['Type' => 'id'], #FileId
];
$Pattern['BLOG']['D']['LANGUAGE'] = [
	'Title'		=> ['Type' => 'text'],
	'Text'		=> ['Type' => 'text'],
	'ShortText'	=> ['Type' => 'text'],
	'LinkId'	=> ['Type' => 'id'], #ID für LINK je Sprache
];
/*
$Pattern['BLOG']['D']['FILE'] = [
	'Active'	=> ['Type' => 'checkbox'],
	''
];*/
#$C['CData']->registerPattern($Pattern);

$C['fremeo/blog']['CData'] = new \phploader\CData( [ 'DB' => ['FILENAME' => PROJECT_ROOT.'data/fremeo~blog/data.db', 'FILENAME_C' => PROJECT_ROOT.'data_c/fremeo~blog/data.db' ] ] );
$C['fremeo/blog']['CData']->registerPattern($Pattern);

/*
$F['BLOG']['LANGUAGE'] = [];
$C['fremeo/core']['CData']->get_object($D1,$F);
$C['fremeo/blog']['CData']->set_object($D1);
*/
