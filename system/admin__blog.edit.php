<?php

if(($D['ACTION']??null) == 'save') {


	#Benötigt, um die vorige LinkId heraus zu lesen falls Links geändert werden
	$f['BLOG']['W'][0]['ID'] = [$D['_ID']];
	$f['BLOG']['LANGUAGE'] = [];
	$C['fremeo/blog']['CData']->get_object($alt_d,$f); #gib die alte LinkId fals bereits verwendet

	#erstelle neues SEO Link weiterleitung und lösche alte und weise die Link-ID der Seite neu zu.
	foreach((array)$D['BLOG']['D'] AS $kPAG => $PAG) {
		foreach((array)$PAG['LANGUAGE']['D'] AS $kLAN => $LAN) {

			#$D['LINK']['D'][ $LAN['LINK'] ]['Active'] = -2; #Alte URL löschen

			if(($LAN['Active']??null) != -2 && $PAG != -2) {
/*				$hURL = hash("crc32b", $LAN['FromURL']);
				$D['LINK']['D'][$hURL] = [
					'Active'	=> 1,
					'FromURL'	=> $LAN['FromURL'],
					'ToURL'		=> "D[_PAGE]=frontend__blog&R[ModuleId]=fremeo/blog&D[_ID]={$kPAG}&D[_LANGUAGE]={$kLAN}",
				];
*/
if($LAN['FromURL']??false) {
	
	if($alt_d['BLOG']['D'][$kPAG]['LANGUAGE']['D'][$kLAN]['LinkId']??false) { #Lösche voriges Link
		$_delLink[] = $alt_d['BLOG']['D'][$kPAG]['LANGUAGE']['D'][$kLAN]['LinkId'];
	}
	
	$_newLink["{$kPAG}-{$kLAN}"] = [
						'Page' => 'frontend__blog',
						'ModuleId' => 'fremeo/blog',
						'Param' => "R[Id]={$kPAG}&R[LanguageId]={$kLAN}",
						'SeoURL' => $LAN['FromURL'],
					];
}
				#$D['BLOG']['D'][$kPAG]['LANGUAGE']['D'][$kLAN]['LINK'] = $hURL;
				$D['BLOG']['D'][$kPAG]['LANGUAGE']['D'][$kLAN]['Text'] = str_replace('-textarea>','textarea>',$D['BLOG']['D'][$kPAG]['LANGUAGE']['D'][$kLAN]['Text']);
				
			}
			else { #WennGelöscht werden soll, soll dann dazu gehörige Link entfernt werden
				$D['LINK']['D'][ $LAN['LINK'] ]['Active'] = -2;
				$D['BLOG']['D'][$kPAG]['LANGUAGE']['D'][$kLAN]['Active'] = -2;
				if($PAG == -2) {
					$D['BLOG']['D'][$kPAG]['Active'] = -2;
				}
			}
		}
	}

	if($_delLink??false) {
		$C['Link']->deleteById($_delLink);
	}
	if($_newLink??false) {
			$ret = $C['Link']->create($_newLink);


			foreach((array)$D['BLOG']['D'] AS $kPAG => $PAG) {
				foreach((array)$PAG['LANGUAGE']['D'] AS $kLAN => $LAN) {
					if(isset($ret["{$kPAG}-{$kLAN}"])) {
						$D['BLOG']['D'][$kPAG]['LANGUAGE']['D'][$kLAN]['LinkId'] = $ret["{$kPAG}-{$kLAN}"]['LinkId'];
					}
				}
			}
	}



	$C['fremeo/blog']['CData']->set_object($D); 
}
if(($D['_ID']??null)) {
	$F['BLOG']['W'][0]['ID'] = [$D['_ID']];
	$F['BLOG']['LANGUAGE'] = [];

	$C['fremeo/blog']['CData']->get_object($D,$F); 
	unset($F['BLOG']);

	foreach((array)$D['BLOG']['D'][ $D['_ID'] ]['LANGUAGE']['D'] AS $kLAN => $LAN) {
		$F['LINK']['W'][0]['ID'][] = $LAN['LinkId'];
	}
}
#$F['LINK'] = [];
$C['fremeo/blog']['CData']->get_object($D,$F); #Link holen