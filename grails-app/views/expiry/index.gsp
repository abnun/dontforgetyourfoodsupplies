<%@ page import="org.springframework.util.ClassUtils" %>
<g:if test="${expiredSupplies}">
	<div class="message">
		<g:message code="supply.expired.text"/>
		<ul style="list-style: none;">
			<g:each var="expiredSupply" in="${expiredSupplies}">
				<g:set var="className" value="${ClassUtils.getShortName(expiredSupply.getClass())}"/>
				<%
					className = className.substring(0, 1).toLowerCase() + className.substring(1, className.size())
				%>
				<g:set var="link" value="${createLink(controller: className, action: 'show', id: expiredSupply.id)}"/>
				<li style="background:url('${resource(dir: 'images', file: 'ico_cat.gif')}') no-repeat left 13px; padding:9px 0 7px 15px;"><a href="${link}">${expiredSupply}</a></li>
			</g:each>
		</ul>
	</div>
</g:if>