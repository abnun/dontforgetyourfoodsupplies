
<%@ page import="name.markus_mueller.domain.ArchiveSupply; name.markus_mueller.domain.FixFuer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.autocomplete.css')}" />
		<script type="text/javascript" src="${resource(dir: 'js/jquery', file: 'jquery.autocomplete.js')}"></script>
		<title>Create "Fix fuer ..."</title>
		<g:render template="/autoComplete/suggestions" />
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">"Fix fuer ..." List</g:link></span>
        </div>
        <div class="body">
            <h1>Create "Fix fuer ..." </h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${fixFuerInstance}">
            <div class="errors">
                <g:renderErrors bean="${fixFuerInstance}" as="list" />
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
                                <td valign="top" class="value ${hasErrors(bean:fixFuerInstance,field:'amount','errors')}">
                                    <input type="text" id="amount" name="amount" value="${fieldValue(bean:fixFuerInstance,field:'amount')}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fixFuerInstance,field:'name','errors')}">
                                    <input type="text" id="name" name="name" value="${fieldValue(bean:fixFuerInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="haltbarBis">Haltbar Bis:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:fixFuerInstance,field:'haltbarBis','errors')}">
                                    <g:datePicker name="haltbarBis" value="${fixFuerInstance?.haltbarBis}" precision="day" ></g:datePicker>
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
