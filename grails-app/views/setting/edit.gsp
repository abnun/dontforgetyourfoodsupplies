
<%@ page import="de.webmpuls.dontforgetyourfoodsupplies.Setting" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'setting.label', default: 'Setting')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${settingInstance}">
            <div class="errors">
                <g:renderErrors bean="${settingInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${settingInstance?.id}" />
                <g:hiddenField name="version" value="${settingInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="expiringMonths"><g:message code="setting.expiringMonths.label" default="Expiring Months" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: settingInstance, field: 'expiringMonths', 'errors')}">
                                    <g:textField name="expiringMonths" value="${fieldValue(bean: settingInstance, field: 'expiringMonths')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="expiringYears"><g:message code="setting.expiringYears.label" default="Expiring Years" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: settingInstance, field: 'expiringYears', 'errors')}">
                                    <g:textField name="expiringYears" value="${fieldValue(bean: settingInstance, field: 'expiringYears')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="user"><g:message code="setting.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: settingInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${de.webmpuls.dontforgetyourfoodsupplies.user.ShiroUser.list()}" optionKey="id" value="${settingInstance?.user?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
