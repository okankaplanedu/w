  
 <% set conn1= Server.CreateObject("adodb.connection") %>
<% conn1.open("driver={microsoft access driver (*.mdb)}; dbq="&server.MapPath("/vt1.mdb")) %>
 
<%id=request("id")%>
 

 
 
<%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"select*from masonry where id="&id&"",conn1,1,3%>
<form name="form6" method="post" action="kod_yenile.asp">
 
        <textarea name="kod" rows="15" id="kod"  style="width:100%"><%=rs("kod")%></textarea>
       
          <input name="id" type="hidden" id="id" value="<%=id%>">
  <label>
          <input type="submit" name="button6" id="button6" value="Submit">
  </label>
</form> 
