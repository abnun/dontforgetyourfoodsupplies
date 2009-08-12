
<%@ page import="name.markus_mueller.domain.Suessie" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.autocomplete.css')}" />
		<script type="text/javascript" src="${resource(dir: 'js/jquery', file: 'jquery.autocomplete.js')}"></script>
        <title>Create Suessie</title>
		<g:render template="/autoComplete/suggestions" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">S&uuml;&szlig;ies List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Suessie</h1>
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
                                    <label for="amount">Amount:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:suessieInstance,field:'amount','errors')}">
                                    <input type="text" id="amount" name="amount" value="${fieldValue(bean:suessieInstance,field:'amount')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:suessieInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:suessieInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="haltbarBis">Haltbar Bis:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:suessieInstance,field:'haltbarBis','errors')}">
                                    <g:datePicker name="haltbarBis" value="${suessieInstance?.haltbarBis}" precision="day" />
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
