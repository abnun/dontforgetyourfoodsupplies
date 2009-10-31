<%@ page import="de.webmpuls.dontforgetyourfoodsupplies.ArchiveSupply" %>
<jq:jquery>
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
		println builder.toString()
	%>
	var array = [${builder.toString()}];
	$('#name').autocompleteArray(array);
</jq:jquery>
