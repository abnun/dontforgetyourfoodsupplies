
<%@ page import="de.webmpuls.dontforgetyourfoodsupplies.Suessie" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'suessie.label', default: 'Suessie')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
			<br/>
			<g:message code="supply.amount.text" args="[suessieInstanceTotal, entityName + 's']" />
			<br/>
			<br/>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'suessie.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'suessie.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="amount" title="${message(code: 'suessie.amount.label', default: 'Amount')}" />
                        
                            <g:sortableColumn property="haltbarBis" title="${message(code: 'suessie.haltbarBis.label', default: 'Haltbar Bis')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${suessieInstanceList}" status="i" var="suessieInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${suessieInstance.id}">${fieldValue(bean: suessieInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: suessieInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: suessieInstance, field: "amount")}</td>
                        
                            <td><wm_timeline:isExpired expiringDate="${suessieInstance.haltbarBis}"><g:formatDate date="${suessieInstance.haltbarBis}" /></wm_timeline:isExpired></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${suessieInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
