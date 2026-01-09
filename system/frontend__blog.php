<?php
	$F['BLOG']['W'][0]['ID'] = [$D['_ID']];
	$F['BLOG']['W'][0]['Active'] = 1;
	$F['BLOG']['W'][0]['DateTime']['<'] = time();
	$F['BLOG']['W'][0]['LANGUAGE']['W'][0]['ID'] = 'DE'; #Todo: Sprache Übergabe
	

	$F['BLOG']['LANGUAGE']['W'][0]['ID'] = 'DE'; #Todo: Sprache Übergabe

	#$C['CData']->get_object($D,$F);


	$D['_meta']['robots'] = 'index, follow';
	$D['_meta']['title'] = $D['BLOG']['D'][$D['_ID']]['LANGUAGE']['D']['DE']['Title']??'';
	$D['_meta']['description'] = $D['BLOG']['D'][$D['_ID']]['LANGUAGE']['D']['DE']['Text']??'';