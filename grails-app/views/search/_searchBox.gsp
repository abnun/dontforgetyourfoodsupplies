<div class="searchBox">
  <g:form url='[controller: "search", action: "index"]' id="searchForm" name="searchForm" method="post">
    <span class="searchField">
      <input type="text" name="q" value="${params.q}" />
      <input type="hidden" name="suggestQuery" value="true" />
    </span>
    <span>
      <input type="submit" value="${message(code: 'search.label')}" />
    </span>
  </g:form>
</div>