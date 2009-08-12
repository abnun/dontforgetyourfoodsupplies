<html>
<head>
	<title><g:message code="home.welcome.text" /> v<g:meta name="app.version"/></title>
	<meta name="layout" content="main"/>
</head>
<body>
<h1 style="margin-left:20px;">
	<g:message code="home.welcome.text" /> v<g:meta name="app.version"/>
</h1>
<div class="dialog" style="margin-left:20px;width:60%;">

	<br/>
	<br/>
	
	<h2>
		<g:message code="home.searchfield.label" />
	</h2>
	<ul>
		<br/>
		<g:render template="/search/searchBox" plugin="cms" />
	</ul>

	<br/>

	<h2>
		Gefrierschrank
	</h2>
	<ul>
		<li class="controller"><g:link controller="paket">Eingefrorene Pakete verwalten</g:link></li>
	</ul>

	<br/>
	<br/>

	<h2>
		"Fix f&uuml;r ..."
	</h2>
	<ul>
		<li class="controller"><g:link controller="fixFuer">"Fix f&uuml;r ..." T&uuml;ten verwalten</g:link></li>
	</ul>

	<br/>
	<br/>

	<h2>
		"S&uuml;&szlig;ies"
	</h2>
	<ul>
		<li class="controller"><g:link controller="suessie">"S&uuml;&szlig;ies" verwalten</g:link></li>
	</ul>

	<br/>
	<br/>
	<br/>
	
	<h2>
		Allgemein
	</h2>
	<ul>
		<li class="controller"><g:link controller="foodCategory">Manage FoodCategories (Meat, Cake, Fish, etc.)</g:link></li>
		<li class="controller"><g:link controller="entity">Manage Entities (gram, kilo, piece, etc.)</g:link></li>
	</ul>
</div>
</body>
</html>