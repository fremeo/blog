{block name="inner_body"}
		<form method="post">
		<input type="hidden" name="D[ACTION]" value='save'>
			<table class="table">
			{foreach from=$D.BLOG.D key="kPAG" item="PAG"}
				<table class="table">
					<tr>
						<td>Active:</td>
						<td>{input p=['name'=>"D[BLOG][D][{$kPAG}][Active]", 'value'=>$PAG.Active, 'type' =>'checkbox']}</td>
					</tr>
				</table>
				Deutsch<br>
				<table class="table">
					<tr>
						<td>SEO-URL:</td>
						<td>{input p=['name'=>"D[BLOG][D][{$kPAG}][LANGUAGE][D][DE][FromURL]", 'value'=>$D.LINK.D[ $PAG.LANGUAGE.D['DE'].LINK ].FromURL ]}
							{input p=['name'=>"D[BLOG][D][{$kPAG}][LANGUAGE][D][DE][LINK]", 'value'=>$PAG.LANGUAGE.D['DE'].LINK, 'type' => 'hidden' ]}
						</td>
					</tr>
					<tr>
						<td>Erstellungsdatum / Aktivdatum:</td>
						<td>{input p=['type' => 'datetime', 'name'=>"D[BLOG][D][{$kPAG}][DateTime]", 'value'=>$PAG.DateTime]}</td>
					</tr>
					<tr>
						<td>Title:</td>
						<td>{input p=['name'=>"D[BLOG][D][{$kPAG}][LANGUAGE][D][DE][Title]", 'value'=>$PAG.LANGUAGE.D['DE'].Title]}</td>
					</tr>
					<tr>
						<td>Kurzbeschreibung:</td>
						<td>{input p=['name'=>"D[BLOG][D][{$kPAG}][LANGUAGE][D][DE][ShortText]", 'type'=> 'wysiwyg', 'style'=>'height:150px', 'value'=>str_replace('textarea>','-textarea>',$PAG.LANGUAGE.D['DE'].ShortText)]}</td>
					</tr>
					<tr>
						<td>Text:</td>
						<td>{input p=['name'=>"D[BLOG][D][{$kPAG}][LANGUAGE][D][DE][Text]", 'type'=> 'wysiwyg', 'style'=>'height:300px', 'value'=>str_replace('textarea>','-textarea>',$PAG.LANGUAGE.D['DE'].Text)]}</td>
					</tr>
				</table>
			{/foreach}
			
			<button type="submit" class="btn btn-primary btn-sm">Save</button>
		</form>
	

	{*print_r($PLA.LINK)*}
{/block}