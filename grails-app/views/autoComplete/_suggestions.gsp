<%@ page import="de.webmpuls.dontforgetyourfoodsupplies.ArchiveSupply" %>
<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.autocomplete.css')}"/>
<script type="text/javascript" src="${resource(dir: 'js/jquery', file: 'jquery.autocomplete.js')}"></script>
<%
	Collection archiveSupplies = ArchiveSupply.list()
	StringBuilder builder = new StringBuilder()
	for (ArchiveSupply archiveSupply: archiveSupplies)
	{
		if (builder.length() == 0)
		{
				builder.append("\"${archiveSupply.toString()}\"")
		}
		else
		{
				builder.append(",\"${archiveSupply.toString()}\"")
		}
	}
	System.out.println builder.toString()
%>
<jq:jquery>
	var array = [${builder.toString()}];
	$('#name').autocomplete(array);
</jq:jquery>
