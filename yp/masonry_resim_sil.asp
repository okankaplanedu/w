  
 <% set conn1= Server.CreateObject("adodb.connection") %>
<% con1.open("driver={microsoft access driver (*.mdb)}; dbq="&server.MapPath("/vt1.mdb")) %>
 
  <%id=request("id")%>
<%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"select*from masonry where id="&id&"",conn1,1,3%>
<%rs("resim")=""%>
<%rs.update%>
 
<%response.Redirect(request.ServerVariables("HTTP_REFERER"))%> 
