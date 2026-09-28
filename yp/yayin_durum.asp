  
 <% set conn1= Server.CreateObject("adodb.connection") %>
<% conn1.open("driver={microsoft access driver (*.mdb)}; dbq="&server.MapPath("/vt1.mdb")) %>
 <%id=request("id")%>
   <%yayin=request("yayin")%>
<%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"select*from kategori where id="&id&"",conn1,1,3%>
<%if yayin=1 then%>
 <%rs("yayin")=0%>
 <%else%>
  <%rs("yayin")=1%>
 <%end if%>
 
 <%rs.update%>
<%response.Redirect(request.ServerVariables("HTTP_REFERER"))%> 
