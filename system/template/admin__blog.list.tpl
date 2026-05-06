{block name="inner_body"}
	<form method="post">
		<input type="hidden" name="D[ACTION]" value='save'>
	<table class="table">
		<thead>
			<tr>
			<th scope="col">#</th>
			<th scope="col">Active</th>
			<th scope="col" style="width:20%">Veröffentlichung</th>
			<th scope="col">Title</th>
			<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
		{foreach from=$D.BLOG.D key="kPAG" item="PAG"}
			<tr>
				<td scope="row">{$kPAG}</td>
				<td scope="row">{input p=['name'=>"D[BLOG][D][{$kPAG}][Active]", 'value'=>$PAG.Active, 'type' => 'checkbox']}</td>
				<td scope="row">{input p=['type' => 'datetime', 'name'=>"D[BLOG][D][{$kPAG}][DateTime]", 'value'=>$PAG.DateTime]}</td>
				<td>{if $PAG.MainImg}
				<picture> 
					<source srcset="./file/{$PAG.MainImg}_38x38.avif" type="image/avif">
					<source srcset="./file/{$PAG.MainImg}_38x38.webp" type="image/webp">
					<img itemprop="image" src="./file/{$PAG.MainImg}_38x38.jpg" decoding="async" loading="lazy" alt="{$PAG.LANGUAGE.D['DE'].Title}">
				</picture>{/if}
				{$PAG.LANGUAGE.D['DE'].Title}</td>
				<td><button type="button" onclick="window.open('?R[Page]=admin__blog.edit&R[ModuleId]=papp/blog&D[_ID]={$kPAG}','_self');" class="btn btn-primary btn-sm">Edit</button></td>
			</tr>
		{/foreach}
		</tbody>
	</table>
	<button type="submit" class="btn btn-primary btn-sm">Save</button>
	</form>
	<button type="button" onclick="window.open('?R[Page]=admin__blog.edit&R[ModuleId]=papp/blog&D[BLOG][D][{hash("crc32b", time())}][Active]=1','_self');" class="btn btn-primary btn-sm">Neu</button>
{/block}