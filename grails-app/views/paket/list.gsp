
<%@ page import="de.webmpuls.dontforgetyourfoodsupplies.Paket" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paket.label', default: 'Paket')}" />
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
			<g:message code="supply.amount.text" args="[paketInstanceTotal, entityName + 'e']" />
			<br/>
			<br/>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'paket.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'paket.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="amount" title="${message(code: 'paket.amount.label', default: 'Amount')}" />
                        
                            <th><g:message code="paket.entity.label" default="Entity" /></th>
                   	    
                            <th><g:message code="paket.foodCategory.label" default="Food Category" /></th>
                   	    
                            <g:sortableColumn property="eingefrorenAm" title="${message(code: 'paket.eingefrorenAm.label', default: 'Eingefroren Am')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${paketInstanceList}" status="i" var="paketInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${paketInstance.id}">${fieldValue(bean: paketInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: paketInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: paketInstance, field: "amount")}</td>
                        
                            <td>${fieldValue(bean: paketInstance, field: "entity")}</td>
                        
                            <td>${fieldValue(bean: paketInstance, field: "foodCategory")}</td>
                        
                            <td><wm_timeline:isExpired expiringDate="${paketInstance.eingefrorenAm}" isPaket="true"><g:formatDate date="${paketInstance.eingefrorenAm}" /></wm_timeline:isExpired></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${paketInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
