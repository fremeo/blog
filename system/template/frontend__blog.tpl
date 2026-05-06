{block name="inner_body" prepend}
	{foreach from=$D.BLOG.D key="kPAG" item="PAG"}
		
		<article itemscope itemtype="https://schema.org/BlogPosting" itemid="https://www.dataliberate.com/2019/05/14/library-metadata-evolution-final-mile/">
			<h1 itemprop="headline" class="text-center">{$PAG.LANGUAGE.D['DE'].Title}</h1>
			<p class="text-center">{if $PAG.DateTime}<time itemprop="datePublished" datetime="{$PAG.DateTime}">{date("d.m.Y",$PAG.DateTime)}</time>{/if}</p>
			<picture> 
				<source srcset="./file/{$PAG.MainImg}_1200x640.avif" type="image/avif">
				<source srcset="./file/{$PAG.MainImg}_1200x640.webp" type="image/webp">
				<img itemprop="image" src="./file/{$PAG.MainImg}_1200x640.jpg" decoding="async" loading="lazy" class="d-block w-100" alt="{$PAG.LANGUAGE.D['DE'].Title}">
			</picture>
			{*<a href="{$D.BasePath}{$D.LINK.D[ $PAG.LANGUAGE.D['DE'].LINK ].FromURL}"><img itemprop="image" src="..." class="card-img-top" alt="..."></a>*}
			
			
			<div itemprop="articleBody">{$PAG.LANGUAGE.D['DE'].Text}</div>
		</article>
	{/foreach}
{/block}