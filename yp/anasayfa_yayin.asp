 
 <% set conn= Server.CreateObject("adodb.connection") %>
<% conn.open("driver={microsoft access driver (*.mdb)}; dbq="&server.MapPath("/vt1.mdb")) %>
 
  <%id=request("id")%>
  <%yayin=request("yayin")%>
 
 
 
 
<%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"select*from masonry where id="&id&"",conn,1,3%>
 
 <%if yayin=1 then%>
 
 <%rs("anasayfa")=0%><%rs.update%>
 <%else%>
 <%rs("anasayfa")=1%><%rs.update%>
 <%end if%>


 <%response.Redirect(request.ServerVariables("HTTP_REFERER"))%>
 

 
