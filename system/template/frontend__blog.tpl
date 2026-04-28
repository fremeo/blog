{block name="inner_body" prepend}
	{foreach from=$D.BLOG.D key="kPAG" item="PAG"}
		
		<article itemscope itemtype="https://schema.org/BlogPosting" itemid="https://www.dataliberate.com/2019/05/14/library-metadata-evolution-final-mile/">
			<h1 itemprop="headline" class="text-center">{$PAG.LANGUAGE.D['DE'].Title}</h1>
			<p class="text-center">{if $PAG.DateTime}<time itemprop="datePublished" datetime="{$PAG.DateTime}">{date("d.m.Y",$PAG.DateTime)}</time>{/if}</p>
			<img decoding="async" itemprop="image" src="./file/{$PAG.MainImg}_1200x640.png" class="card-img-top" alt="{$PAG.LANGUAGE.D['DE'].Title}">
			{*<a href="{$D.BasePath}{$D.LINK.D[ $PAG.LANGUAGE.D['DE'].LINK ].FromURL}"><img itemprop="image" src="..." class="card-img-top" alt="..."></a>*}
			
			
			<div itemprop="articleBody">{$PAG.LANGUAGE.D['DE'].Text}</div>
		</article>
	{/foreach}
{/block}