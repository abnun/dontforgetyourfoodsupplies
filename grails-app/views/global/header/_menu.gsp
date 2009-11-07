<div id="menu">
	<ul>
		<li><a class="select" href="${resource(dir: '')}"><span><g:message code="home.text"/></span></a></li>
		<li>-</li><li><a href=""><span>About</span></a></li>
		<li>-</li><li><g:link controller="setting" action="list"><span><g:message code="setting.label" default="Setting"/></span></g:link></li></ul>
	<div id="main_search">
		<g:form url='[controller: "search", action: "index"]' id="searchForm" name="searchForm" method="post">
			<div>
				<input type="hidden" name="suggestQuery" value="true" />
				<input type="text" value="${message(code: 'search.searchfield.label.text')}" name="q" id="searchform_top_text" onclick="this.value = '';"/>
				<input type="submit" value="${message(code: 'search.label.text')}"/>
			</div>
		</g:form>
	</div>
</div>