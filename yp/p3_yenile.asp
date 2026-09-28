  
 <% set conn1= Server.CreateObject("adodb.connection") %>
<% conn1.open("driver={microsoft access driver (*.mdb)}; dbq="&server.MapPath("/vt1.mdb")) %>
 
  <%id=request("id")%>
<%p3=request("editor")%>
 
<%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"select*from masonry where id="&id&"",conn1,1,3%>
 
                  <%rs("p3")=p3%>
 <%rs.update%>
<%response.Redirect(request.ServerVariables("HTTP_REFERER"))%>

 

