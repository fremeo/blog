{function name=pagination step=10 start=0 count=0 param=[]}

    {* Schrittweite validieren *}
    {if $step <= 0}{$step = 10}{/if}

    {* Seiten berechnen *}
    {$totalPages =max(1, ceil($count / $step))}
    {$currentPage =ceil(($start + $step) / $step)}

    {* Param‑Namen aus param holen (Defaults) *}
    {$startParamName = $param.start|default:"START"}
    {$stepParamName  = $param.step|default:"STEP"}

    <nav>
        <ul class="pagination pagination-sm mb-0">

            {* Erste Seite « *}
            {if $currentPage > 1}
                {$firstStart = 0}
                {$firstParams = "{$startParamName}={$firstStart}&{$stepParamName}={$step}"}
                <li class="page-item">
                    <a class="page-link" href="javascript:void(0)"
                       onclick="paging('{$firstParams}'); return false;">«</a>
                </li>
            {else}
                <li class="page-item disabled"><span class="page-link">«</span></li>
            {/if}

            {* Seitenzahlen *}
            {for $p = 1 to $totalPages}
                {$linkStart = ($p-1) * $step}
                {$linkParams = "{$startParamName}={$linkStart}&{$stepParamName}={$step}"}

                {if $p == $currentPage}
                    <li class="page-item active"><span class="page-link">{$p}</span></li>
                {else}
                    <li class="page-item">
                        <a class="page-link" href="javascript:void(0)"
                           onclick="paging('{$linkParams}'); return false;">{$p}</a>
                    </li>
                {/if}
            {/for}

            {* Nächste Seite » *}
            {if $currentPage < $totalPages}
                {$nextStart = ($currentPage) * $step}
                {$nextParams = "{$startParamName}={$nextStart}&{$stepParamName}={$step}"}
                <li class="page-item">
                    <a class="page-link" href="javascript:void(0)"
                       onclick="paging('{$nextParams}'); return false;">»</a>
                </li>
            {else}
                <li class="page-item disabled"><span class="page-link">»</span></li>
            {/if}

        </ul>
    </nav>
{/function}








{block name="inner_body"}
	<script>
/**
 * paging(paramString)
 * - paramString: z.B. "R[F][BLOG][L][START]=0&R[F][BLOG][L][STEP]=10"
 * Entfernt vorhandene Parameter mit denselben Keys aus der aktuellen URL,
 * hängt die neuen Paare an und navigiert zur resultierenden URL.
 */
window.paging = function(paramString) {
    if (typeof paramString !== 'string' || paramString.trim() === '') return;

    // Entferne führendes &
    if (paramString.charAt(0) === '&') paramString = paramString.substring(1);

    // Zerlege neue Paare und extrahiere Keys
    var newPairs = paramString.split('&').filter(Boolean);
    var newKeys = newPairs.map(function(p) {
        var idx = p.indexOf('=');
        return idx === -1 ? p : p.substring(0, idx);
    });

    // Aktuelle URL ohne Hash
    var href = window.location.href;
    var hashIndex = href.indexOf('#');
    var hash = '';
    if (hashIndex !== -1) {
        hash = href.substring(hashIndex);
        href = href.substring(0, hashIndex);
    }

    // Basis und bestehende Query
    var qIndex = href.indexOf('?');
    var base = qIndex === -1 ? href : href.substring(0, qIndex);
    var existingQuery = qIndex === -1 ? '' : href.substring(qIndex + 1);

    // Zerlege vorhandene Parameter, filtere alle, deren Key in newKeys ist
    var existingParts = existingQuery ? existingQuery.split('&').filter(Boolean) : [];
    var filteredExisting = existingParts.filter(function(part) {
        var idx = part.indexOf('=');
        var key = idx === -1 ? part : part.substring(0, idx);
        // Behalte nur, wenn key nicht in newKeys
        return newKeys.indexOf(key) === -1;
    });

    // Baue finale Query: gefilterte vorhandene + neue Paare
    var finalParts = filteredExisting.concat(newPairs);
    var finalQuery = finalParts.join('&');

    var finalUrl = base + (finalQuery ? '?' + finalQuery : '') + hash;
    window.location.href = finalUrl;
};
</script>


	<form method="post" class="h-100">
		<div class="d-flex flex-column h-100">
    <div class="flex-grow-1 overflow-y-scroll">
				<input type="hidden" name="D[ACTION]" value='save'>
				<table class="table table-striped">
					<thead class="sticky-top">
						<tr>
						<th scope="col">ID</th>
						<th scope="col">Active</th>
						<th scope="col">Post</th>
						<th scope="col" style="width:20%">Veröffentlichung</th>
						
						<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
					{foreach from=$D.BLOG.D key="kPAG" item="PAG"}
						<tr>
							<td scope="row">{$kPAG}</td>
							<td scope="row">{input p=['name'=>"D[BLOG][D][{$kPAG}][Active]", 'value'=>$PAG.Active, 'type' => 'checkbox']}</td>
							<td><a class="text-decoration-none" href="{$D.BasePath}{$D.LINK.D[ $PAG.LANGUAGE.D['DE'].LinkId ].FromURL}" target="_blank" ><i class="fa-solid fa-up-right-from-square"></i></a>
							{if $PAG.MainImg}
							<picture> 
								<source srcset="./file/{$PAG.MainImg}_38x38.avif" type="image/avif">
								<source srcset="./file/{$PAG.MainImg}_38x38.webp" type="image/webp">
								<img itemprop="image" src="./file/{$PAG.MainImg}_38x38.jpg" decoding="async" loading="lazy" alt="{$PAG.LANGUAGE.D['DE'].Title}">
							</picture>
							{/if}
							{$PAG.LANGUAGE.D['DE'].Title}</td>
							<td scope="row">{input p=['type' => 'datetime', 'name'=>"D[BLOG][D][{$kPAG}][DateTime]", 'value'=>$PAG.DateTime]}</td>
							<td><button type="button" onclick="window.open('?R[Page]=admin__blog.edit&R[ModuleId]=papp/blog&D[_ID]={$kPAG}','_self');" class="btn btn-primary btn-sm"><i class="fa-regular fa-pen-to-square"></i></button></td>
						</tr>
					{/foreach}
					</tbody>
				</table>
			</div>
				<div class="table-footer sticky-bottom d-flex justify-content-between align-items-center px-3 py-2 bg-white border-top" style="width:stretch;">
					
					<!-- Linke Seite: Buttons -->
					<div class="footer-left d-flex gap-2">
						<button type="submit" class="btn btn-primary btn-sm"><i class="fa-regular fa-floppy-disk"></i> Save</button>
						<button type="button" onclick="window.open('?R[Page]=admin__blog.edit&R[ModuleId]=papp/blog&D[BLOG][D][{hash("crc32b", time())}][Active]=1','_self');" class="btn btn-primary btn-sm"><i class="fa-solid fa-circle-plus"></i> Neu</button>
					</div>
					
					{$step = $D.R.F.BLOG.L.STEP|default:10}
					{if $step <= 0}{$step = 10}{/if}
					{$count = $D.BLOG.COUNT|default:0}
					{$totalPages = max(1, ceil($count / $step))}
					{$currentPage = (($D.R.F.BLOG.L.START+$step)/$step)|default:1}
					{$page = ceil(($currentPage + $step) / $step)}
					{$currentPage}/{$totalPages} Seiten	| {$step*($currentPage)}/{$count} Einträge
					<!-- Rechte Seite: Paging -->
					
					<div class="footer-right">
						{pagination 
							step=15
							start=$D.R.F.BLOG.L.START
							count=$D.BLOG.COUNT
							param=[ "start" => "R[F][BLOG][L][START]", "step" => "R[F][BLOG][L][STEP]" ]
						}
{*ToDo: pagination abändern, wie input Fehld übergabe nur max, active, onclick*}
						{*input p=['type' => 'pagination', 'name' => 'MainPage', 'PageCount' => 20, 'PageStart' => 0]*}
					</div>

				</div>

		</div>		
	</form>

{/block}

