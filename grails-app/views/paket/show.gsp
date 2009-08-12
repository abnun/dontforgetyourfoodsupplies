

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Paket</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Paket List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Paket</g:link></span>
        </div>
        <div class="body">
            <h1>Show Paket</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:paketInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Amount:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:paketInstance, field:'amount')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Entity:</td>
                            
                            <td valign="top" class="value"><g:link controller="entity" action="show" id="${paketInstance?.entity?.id}">${paketInstance?.entity?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">FoodCategory:</td>
                            
                            <td valign="top" class="value"><g:link controller="foodCategory" action="show" id="${paketInstance?.foodCategory?.id}">${paketInstance?.foodCategory?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Eingefroren Am:</td>
                            
                            <td valign="top" class="value"><g:formatDate date="${paketInstance.eingefrorenAm}" format="dd.MM.yyyy" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:paketInstance, field:'name')}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${paketInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
