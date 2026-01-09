<?php
	$F['BLOG']['W'][0]['Active'] = 1;
	$F['BLOG']['W'][0]['DateTime']['<'] = time();
	$F['BLOG']['W'][0]['LANGUAGE']['W'][0]['ID'] = 'DE'; #Todo: Sprache Übergabe
	

	$F['BLOG']['LANGUAGE']['W'][0]['ID'] = 'DE'; #Todo: Sprache Übergabe
	$F['BLOG']['O'][0]['DateTime'] = 'DESC';
	
	#$CData->get_object($D,$F);
	if($D['BLOG']['D']??null) {
		foreach($D['BLOG']['D'] AS $kB => $B) {
			foreach($B['LANGUAGE']['D'] AS $kBL => $BL) {
				$_Links[] = $BL['LINK'];
			}
		}
		$F['LINK']['W'][0]['ID'] = $_Links;
	}
	$D['_meta']['robots'] = 'index, follow';