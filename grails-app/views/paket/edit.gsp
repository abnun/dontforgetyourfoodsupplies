
<%@ page import="name.markus_mueller.dontforgetyourfoodsupplies.Paket" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'paket.label', default: 'Paket')}" />
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
            <g:hasErrors bean="${paketInstance}">
            <div class="errors">
                <g:renderErrors bean="${paketInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${paketInstance?.id}" />
                <g:hiddenField name="version" value="${paketInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="paket.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paketInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${paketInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="amount"><g:message code="paket.amount.label" default="Amount" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paketInstance, field: 'amount', 'errors')}">
                                    <g:textField name="amount" value="${fieldValue(bean: paketInstance, field: 'amount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="entity"><g:message code="paket.entity.label" default="Entity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paketInstance, field: 'entity', 'errors')}">
                                    <g:select name="entity.id" from="${name.markus_mueller.dontforgetyourfoodsupplies.Entity.list()}" optionKey="id" value="${paketInstance?.entity?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="foodCategory"><g:message code="paket.foodCategory.label" default="Food Category" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paketInstance, field: 'foodCategory', 'errors')}">
                                    <g:select name="foodCategory.id" from="${name.markus_mueller.dontforgetyourfoodsupplies.FoodCategory.list()}" optionKey="id" value="${paketInstance?.foodCategory?.id}" noSelection="['null': '']" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="eingefrorenAm"><g:message code="paket.eingefrorenAm.label" default="Eingefroren Am" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: paketInstance, field: 'eingefrorenAm', 'errors')}">
                                    <g:datePicker name="eingefrorenAm" precision="day" value="${paketInstance?.eingefrorenAm}"  />
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
