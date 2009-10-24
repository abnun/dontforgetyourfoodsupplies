
<%@ page import="name.markus_mueller.dontforgetyourfoodsupplies.Suessie" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'suessie.label', default: 'Suessie')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
		<g:render template="/autoComplete/suggestions" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir: '')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${suessieInstance}">
            <div class="errors">
                <g:renderErrors bean="${suessieInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="suessie.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: suessieInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${suessieInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="amount"><g:message code="suessie.amount.label" default="Amount" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: suessieInstance, field: 'amount', 'errors')}">
                                    <g:textField name="amount" value="${fieldValue(bean: suessieInstance, field: 'amount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="haltbarBis"><g:message code="suessie.haltbarBis.label" default="Haltbar Bis" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: suessieInstance, field: 'haltbarBis', 'errors')}">
                                    <g:datePicker name="haltbarBis" precision="day" value="${suessieInstance?.haltbarBis}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
