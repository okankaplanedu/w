  
 <% set conn2= Server.CreateObject("adodb.connection") %>
<% conn2.open("driver={microsoft access driver (*.mdb)}; dbq="&server.MapPath("/vt1.mdb")) %>
<%id=request("id")%>
<%resim=request("resim")%>
 <%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"select*from masonry where id="&id&"",conn2,1,3%>
 
<%rs("resim")=resim%>
<%rs.update%>
 
<%response.Redirect(request.ServerVariables("HTTP_REFERER"))%>
 
