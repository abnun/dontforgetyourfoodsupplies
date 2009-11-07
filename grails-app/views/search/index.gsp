<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="org.codehaus.groovy.grails.plugins.searchable.SearchableUtils" %>
<%@ page import="org.codehaus.groovy.grails.plugins.searchable.lucene.LuceneUtils" %>
<%@ page import="org.codehaus.groovy.grails.plugins.searchable.util.StringQueryUtils" %>
<html>
  <head>
    <title><g:if test="${searchTerm && searchTerm?.trim() != ''}">'${searchTerm}' - </g:if>Suchergebnis(se)</title>
    <meta name="layout" content="main" />
  </head>
  <body onload="focusQueryInput();">
    <g:set var="haveQuery" value="${searchTerm?.trim()}" />
    <g:set var="haveResults" value="${searchResult?.results}" />
    <br/>
  	<div class="title" style="margin-left: 20px;">
      <span>
        <g:if test="${haveQuery && haveResults}">
          Zeige <strong>${searchResult.offset + 1}</strong> - <strong>${searchResult.results.size() + searchResult.offset}</strong> von <strong>${searchResult.total}</strong>
          Ergebnisse(n) f&uuml;r <strong>${searchTerm}</strong>
        </g:if>
        <g:else>
        &nbsp;
        </g:else>
      </span>

    <g:if test="${haveQuery && !haveResults && !parseException}">
      <p>Nothing matched your query - <strong>${searchTerm}</strong></p>
    </g:if>

    <g:if test="${searchResult?.suggestedQuery}">
      <p>Did you mean <g:link controller="search" action="index" params="[q: searchResult.suggestedQuery]">${StringQueryUtils.highlightTermDiffs(searchTerm.trim(), searchResult.suggestedQuery)}</g:link>?</p>
    </g:if>

    <g:if test="${parseException}">
      <p>Your query - <strong>${searchTerm}</strong> - is not valid.</p>
      <p>Suggestions:</p>
      <ul>
        <g:if test="${LuceneUtils.queryHasSpecialCharacters(searchTerm)}">
          <li>Remove special characters like <strong>" - [ ]</strong>, before searching, eg, <em><strong>${LuceneUtils.cleanQuery(searchTerm)}</strong></em><br />
              <em>Use the Searchable Plugin's <strong>LuceneUtils#cleanQuery</strong> helper method for this: <g:link controller="searchable" action="index" params="[q: LuceneUtils.cleanQuery(searchTerm)]">Search again with special characters removed</g:link></em>
          </li>
          <li>Escape special characters like <strong>" - [ ]</strong> with <strong>\</strong>, eg, <em><strong>${LuceneUtils.escapeQuery(searchTerm)}</strong></em><br />
              <em>Use the Searchable Plugin's <strong>LuceneUtils#escapeQuery</strong> helper method for this: <g:link controller="searchable" action="index" params="[q: LuceneUtils.escapeQuery(searchTerm)]">Search again with special characters escaped</g:link></em><br />
              <em>Or use the Searchable Plugin's <strong>escape</strong> option: <g:link controller="searchable" action="index" params="[q: searchTerm, escape: true]">Search again with the <strong>escape</strong> option enabled</g:link></em>
          </li>
        </g:if>
      </ul>
    </g:if>

	  <br/>
	  <br/>
    <g:if test="${haveResults}">
      <div class="results">
        <g:each var="result" in="${searchResult.results}" status="index">
          <div class="result">
            <g:set var="className" value="${ClassUtils.getShortName(result.getClass())}" />
			  <%
			      className = className.substring(0,1).toLowerCase() + className.substring(1, className.size())
			  %>
            <g:set var="link" value="${createLink(controller: className, action: 'show', id: result.id)}" />
            <div class="name">${index + 1}. <a href="${link}">${result.name}</a></div>
          </div>
        </g:each>
      </div>

		<br/>

      <div>
        <div class="paging">
          <g:if test="${haveResults}">
              Page:
              <g:set var="totalPages" value="${Math.ceil(searchResult.total / searchResult.max)}" />
              <g:if test="${totalPages == 1}"><span class="currentStep">1</span></g:if>
              <g:else><g:paginate controller="search" action="index" params="[q: searchTerm]" total="${searchResult.total}" prev="&lt; previous" next="next &gt;"/></g:else>
          </g:if>
        </div>
      </div>
    </g:if>
		  <br/>
		  <div>
			  <a href="${resource(dir: '')}"><g:message code="back.link"/></a>
		  </div>
  </div>
  </body>
</html>