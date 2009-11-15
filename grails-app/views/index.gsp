<%@ page import="de.webmpuls.dontforgetyourfoodsupplies.user.ShiroUser" %>
<html>
<head>
	<meta name="layout" content="main"/>
</head>
<body>
<div class="dialog" style="margin-left:20px;width:60%;">

	<%
	    ShiroUser user = ShiroUser.findByUsername('markus')
	%>
	<g:if test="${user}">
		<h1>
			<g:message code="home.welcome.back.text" args="[user.firstname, user.name]" />
		</h1>
	</g:if>

	<g:include controller="expiry" action="index"/>
</div>

</body>
</html>