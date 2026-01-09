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



$D['PATTERN']['BLOG'] = [
	'Active'	=> ['Type' => 'checkbox'],
	'DateTime'	=> ['Type' => 'text'],
];
$D['PATTERN']['BLOG']['D']['LANGUAGE'] = [
	'Title'		=> ['Type' => 'text'],
	'Text'		=> ['Type' => 'text'],
	'ShortText'	=> ['Type' => 'text'],
	'LINK'		=> ['Type' => 'id'], #ID für LINK je Sprache
];

