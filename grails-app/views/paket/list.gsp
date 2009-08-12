

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Paket List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Paket</g:link></span>
        </div>
        <div class="body">
            <h1>Paket List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>

							<g:sortableColumn property="id" title="Id"/>

							<g:sortableColumn property="name" title="Name"/>

							<g:sortableColumn property="amount" title="Amount"/>

							<th>Entity</th>

							<th>FoodCategory</th>

							<g:sortableColumn property="eingefrorenAm" title="Eingefroren Am"/>
                        

                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${paketInstanceList}" status="i" var="paketInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${paketInstance.id}">${fieldValue(bean:paketInstance, field:'id')}</g:link></td>

							<td>${fieldValue(bean:paketInstance, field:'name')}</td>

                            <td>${fieldValue(bean:paketInstance, field:'amount')}</td>
                        
                            <td>${fieldValue(bean:paketInstance, field:'entity')}</td>
                        
                            <td>${fieldValue(bean:paketInstance, field:'foodCategory')}</td>
                        
                            <td><g:formatDate date="${paketInstance.eingefrorenAm}" format="dd.MM.yyyy" /></td>

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
