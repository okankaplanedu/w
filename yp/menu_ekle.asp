  
 <% set conn= Server.CreateObject("adodb.connection") %>
<% conn.open("driver={microsoft access driver (*.mdb)}; dbq="&server.MapPath("/vt1.mdb")) %>
 <%gelen=request.form("gelen")%>
  <%menu=request.form("menu")%>
<%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"select*from menu",conn,1,3%>
<%rs.addnew%>
<%if gelen="" then%>
<%rs("gelen")=0%>
<%else%>
<%rs("gelen")=gelen%>
<%end if%>
<%rs("menu")=menu%>
<%rs.update%>
<%response.Redirect(request.ServerVariables("HTTP_REFERER"))%>
 