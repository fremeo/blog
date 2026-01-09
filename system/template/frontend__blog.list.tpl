{block name="inner_body" prepend}
	<selection itemscope="" itemtype="http://schema.org/Blog">
		<h1 class="mb-0" itemprop="name">Blog</h1>
		<div class="container">
			<div class="row gy-5">
			{foreach from=$D.BLOG.D key="kPAG" item="PAG"}
				
				<div class="col-6">
					<article itemprop="blogPost" itemscope="" style="display: inline-grid; height:100%;" itemtype="http://schema.org/BlogPosting">
					
					<div class="card">
					{*<a href="{$D.BasePath}{$D.LINK.D[ $PAG.LANGUAGE.D['DE'].LINK ].FromURL}"><img itemprop="image" src="..." class="card-img-top" alt="..."></a>*}
						<div class="card-body">
							<h2 itemprop="headline" class="card-title"><a href="{$D.BasePath}{$D.LINK.D[ $PAG.LANGUAGE.D['DE'].LINK ].FromURL}" class="card-title" style="text-decoration:none;">{$PAG.LANGUAGE.D['DE'].Title}</a></h2>
							<p itemprop="description" class="card-text">{if $PAG.LANGUAGE.D['DE'].ShortText}{$PAG.LANGUAGE.D['DE'].ShortText}{else}{$PAG.LANGUAGE.D['DE'].Text|strip_tags|truncate:300:" ..."}{/if}</p>
							<a href="{$D.BasePath}{$D.LINK.D[ $PAG.LANGUAGE.D['DE'].LINK ].FromURL}" class="btn btn-light btn-sm" aria-label="mehr lesen">mehr lesen</a>
							{if $PAG.DateTime}<time class="float-end" itemprop="datePublished" datetime="{$PAG.DateTime}">{date("d.m.Y",$PAG.DateTime)}</time>{/if}
						</div>
					</div>
					</article>
				</div>
				
			{/foreach}
			</div>
		</div>
	</selection>
{/block}