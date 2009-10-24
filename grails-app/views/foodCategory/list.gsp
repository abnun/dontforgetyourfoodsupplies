
<%@ page import="name.markus_mueller.dontforgetyourfoodsupplies.FoodCategory" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'foodCategory.label', default: 'FoodCategory')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'foodCategory.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'foodCategory.name.label', default: 'Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${foodCategoryInstanceList}" status="i" var="foodCategoryInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${foodCategoryInstance.id}">${fieldValue(bean: foodCategoryInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: foodCategoryInstance, field: "name")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${foodCategoryInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
