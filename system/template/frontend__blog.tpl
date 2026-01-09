{block name="inner_body" prepend}
	{foreach from=$D.BLOG.D key="kPAG" item="PAG"}
		
		<article itemscope itemtype="https://schema.org/BlogPosting" itemid="https://www.dataliberate.com/2019/05/14/library-metadata-evolution-final-mile/">
			{*<a href="{$D.BasePath}{$D.LINK.D[ $PAG.LANGUAGE.D['DE'].LINK ].FromURL}"><img itemprop="image" src="..." class="card-img-top" alt="..."></a>*}
			<h1 itemprop="headline" class="mb-0">{$PAG.LANGUAGE.D['DE'].Title}</h1>
			{if $PAG.DateTime}<time itemprop="datePublished" datetime="{$PAG.DateTime}">{date("d.m.Y",$PAG.DateTime)}</time>{/if}
			<div itemprop="articleBody">{$PAG.LANGUAGE.D['DE'].Text}</div>
		</article>
	{/foreach}
{/block}