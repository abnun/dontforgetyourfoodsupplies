
<%@ page import="de.webmpuls.dontforgetyourfoodsupplies.ArchiveSupply" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'archiveSupply.label', default: 'ArchiveSupply')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'archiveSupply.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="supplyClass" title="${message(code: 'archiveSupply.supplyClass.label', default: 'Supply Class')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'archiveSupply.name.label', default: 'Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${archiveSupplyInstanceList}" status="i" var="archiveSupplyInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${archiveSupplyInstance.id}">${fieldValue(bean: archiveSupplyInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: archiveSupplyInstance, field: "supplyClass")}</td>
                        
                            <td>${fieldValue(bean: archiveSupplyInstance, field: "name")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${archiveSupplyInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
