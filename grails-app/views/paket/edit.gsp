<%@ page import="name.markus_mueller.domain.Entity; name.markus_mueller.domain.FoodCategory; name.markus_mueller.domain.Entity" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Paket</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Paket List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Paket</g:link></span>
        </div>
        <div class="body">
            <h1>Edit Paket</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${paketInstance}">
            <div class="errors">
                <g:renderErrors bean="${paketInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${paketInstance?.id}" />
                <input type="hidden" name="version" value="${paketInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="amount">Amount:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:paketInstance,field:'amount','errors')}">
                                    <input type="text" id="amount" name="amount" value="${fieldValue(bean:paketInstance,field:'amount')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="entity">Entity:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:paketInstance,field:'entity','errors')}">
                                    <g:select optionKey="id" from="${Entity.listOrderByName()}" name="entity.id" value="${paketInstance?.entity?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="foodCategory">FoodCategory:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:paketInstance,field:'foodCategory','errors')}">
                                    <g:select optionKey="id" from="${FoodCategory.listOrderByName()}" name="foodCategory.id" value="${paketInstance?.foodCategory?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="eingefrorenAm">Eingefroren Am:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:paketInstance,field:'eingefrorenAm','errors')}">
                                    <g:datePicker name="eingefrorenAm" value="${paketInstance?.eingefrorenAm}" precision="day" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:paketInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:paketInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>