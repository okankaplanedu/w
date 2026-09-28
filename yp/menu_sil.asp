  
 <% set conn= Server.CreateObject("adodb.connection") %>
<% conn.open("driver={microsoft access driver (*.mdb)}; dbq="&server.MapPath("/vt1.mdb")) %>
 <%id=request("id")%>
 
<%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"delete from menu where id="&id&"",conn,1,3%>
 
<%response.Redirect(request.ServerVariables("HTTP_REFERER"))%>
 