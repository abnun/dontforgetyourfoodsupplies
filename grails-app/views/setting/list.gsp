
<%@ page import="de.webmpuls.dontforgetyourfoodsupplies.Setting" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'setting.label', default: 'Setting')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'setting.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="expiringMonths" title="${message(code: 'setting.expiringMonths.label', default: 'Expiring Months')}" />
                        
                            <g:sortableColumn property="expiringYears" title="${message(code: 'setting.expiringYears.label', default: 'Expiring Years')}" />
                        
                            <th><g:message code="setting.user.label" default="User" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${settingInstanceList}" status="i" var="settingInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${settingInstance.id}">${fieldValue(bean: settingInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: settingInstance, field: "expiringMonths")}</td>
                        
                            <td>${fieldValue(bean: settingInstance, field: "expiringYears")}</td>
                        
                            <td>${fieldValue(bean: settingInstance, field: "user")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${settingInstanceTotal}" />
            </div>--}%
        </div>

		<h2>
			Allgemein
		</h2>
		<ul style="list-style: none;">
			<li style="background:url('${resource(dir: 'images', file: 'ico_cat.gif')}') no-repeat left 13px; padding:9px 0 7px 15px;"><g:link controller="foodCategory"><g:message code="foodCategory.manage"/></g:link></li>
			<li style="background:url('${resource(dir: 'images', file: 'ico_cat.gif')}') no-repeat left 13px; padding:9px 0 7px 15px;"><g:link controller="entity"><g:message code="entity.manage"/></g:link></li>
			<li style="background:url('${resource(dir: 'images', file: 'ico_cat.gif')}') no-repeat left 13px; padding:9px 0 7px 15px;"><g:link controller="paket" action="settings"><g:message code="paket.settings"/></g:link></li>
		</ul>
    </body>
</html>
