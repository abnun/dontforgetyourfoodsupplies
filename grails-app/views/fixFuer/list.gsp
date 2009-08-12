
<%@ page import="name.markus_mueller.domain.FixFuer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>"Fix fuer ..." List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New "Fix fuer ..."</g:link></span>
        </div>
        <div class="body">
            <h1>"Fix fuer ..." List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />

						    <g:sortableColumn property="amount" title="Amount" />

                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="haltbarBis" title="Haltbar Bis" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${fixFuerInstanceList}" status="i" var="fixFuerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${fixFuerInstance.id}">${fieldValue(bean:fixFuerInstance, field:'id')}</g:link></td>

							<td>${fieldValue(bean:fixFuerInstance, field:'amount')}</td>

                            <td>${fieldValue(bean:fixFuerInstance, field:'name')}</td>

							<g:if test="${(new Date()).after(fixFuerInstance.haltbarBis)}">
								<td style="color: red;"><g:formatDate date="${fixFuerInstance.haltbarBis}" format="MM.yyyy" /></td>
							</g:if>
							<g:else>
								<td><g:formatDate date="${fixFuerInstance.haltbarBis}" format="MM.yyyy" /></td>
							</g:else>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<div class="paginateButtons">
                <g:paginate total="${fixFuerInstanceTotal}" />
            </div>--}%
        </div>
    </body>
</html>
