 
 <% set conn= Server.CreateObject("adodb.connection") %>
<% conn.open("driver={microsoft access driver (*.mdb)}; dbq="&server.MapPath("/vt1.mdb")) %>
 <%id=request.form("id")%>
  <%menu=request.form("menu")%>
   <%sira=request.form("sira")%>
<%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"select*from menu where id="&id&"",conn,1,3%>
 
<%rs("sira")=sira%>
 
<%rs("menu")=menu%>
<%rs.update%>
<%response.Redirect(request.ServerVariables("HTTP_REFERER"))%>
 