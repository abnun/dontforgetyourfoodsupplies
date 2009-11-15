<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name='robots' content='noindex,nofollow' />
        <title><g:layoutTitle default="${message(code: 'html.title.text') + ' v' + meta(name: 'app.version')}" /></title>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css" media="screen"/>
		<!--<link rel="alternate" type="application/rss+xml" title="RSS Feed" href=""/>-->

		<!--[if IE ]>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style-ie.css')}" type="text/css" media="screen" />
		<![endif]-->
		<!--[if IE 6]>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style-ie6.css')}" type="text/css" media="screen" />
		<style type="text/css">
		#header img, .post-title h4, .postmetadata, .sidebars h2{
			behavior:expression((this.runtimeStyle.behavior="none")&&(this.pngSet?this.pngSet=true:(this.nodeName == "IMG" && this.src.toLowerCase().indexOf('.png')>-1?(this.runtimeStyle.backgroundImage = "none",
			this.runtimeStyle.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + this.src + "', sizingMethod='image')",
			this.src = "http://test.iwordpressthemes.com/wp-content/themes/152/images/transparent.gif"):(this.origBg = this.origBg? this.origBg :this.currentStyle.backgroundImage.toString().replace('url("','').replace('")',''),
			this.runtimeStyle.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + this.origBg + "', sizingMethod='crop')",
			this.runtimeStyle.backgroundImage = "none")),this.pngSet=true)
			);
		}
		</style>
		<![endif]-->

        <g:javascript library="application" />
        <g:javascript library="jquery" />
		<g:layoutHead />
    </head>
    <body>

	<div id="spinner" class="spinner" style="display:none;">
		<img src="${resource(dir: 'images', file: 'spinner.gif')}" alt="Spinner"/>
	</div>

	<div id="wrapper">
		<div id="page">

			<g:render template="/global/header/header" />

			<g:render template="/global/header/menu" />


			<div id="body" style="border: 20px solid black;">

				<div id="body_top">
					<div id="body_left">
						<g:layoutBody/>
					</div>
					<div id="body_right">

						<div id="sidebars" class="sidebars">

							<h2 title="Eingefrorene Pakete verwalten">
								<g:link controller="paket">Gefrierschrank</g:link>
							</h2>

							<h2 title="'Fix f&uuml;r ...' T&uuml;ten verwalten">
								<g:link controller="fixFuer">"Fix f&uuml;r ..."</g:link>
							</h2>

							<h2 title="'S&uuml;&szlig;ies' verwalten">
								<g:link controller="suessie">"S&uuml;&szlig;ies"</g:link>
							</h2>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</body>
</html>