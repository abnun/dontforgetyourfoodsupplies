
<%@ page import="name.markus_mueller.dontforgetyourfoodsupplies.FixFuer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'fixFuer.label', default: 'FixFuer')}" />
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
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'fixFuer.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'fixFuer.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="amount" title="${message(code: 'fixFuer.amount.label', default: 'Amount')}" />
                        
                            <g:sortableColumn property="haltbarBis" title="${message(code: 'fixFuer.haltbarBis.label', default: 'Haltbar Bis')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${fixFuerInstanceList}" status="i" var="fixFuerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${fixFuerInstance.id}">${fieldValue(bean: fixFuerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: fixFuerInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: fixFuerInstance, field: "amount")}</td>
                        
                            <td><g:formatDate date="${fixFuerInstance.haltbarBis}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${fixFuerInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
