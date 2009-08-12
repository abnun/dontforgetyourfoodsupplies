<html>
    <head>
        <title><g:layoutTitle default="${message(code: 'home.welcome.text') + 'v' + meta(name: 'app.version')}" /></title>
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" />

        <g:javascript library="application" />
        <g:javascript library="jquery" />
		<g:layoutHead />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir: 'images', file: 'spinner.gif')}" alt="Spinner" />
        </div>
        <g:layoutBody />
    </body>
</html>