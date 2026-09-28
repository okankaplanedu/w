  
 <% set conn= Server.CreateObject("adodb.connection") %>
<% conn.open("driver={microsoft access driver (*.mdb)}; dbq="&server.MapPath("../vt1.mdb")) %>
<%id=request("id")%>
<%if id="" then%><%id=0%><%end if%>
<!DOCTYPE html>
<html lang="tr">
<head itemscope itemtype="http://schema.org/WebSite">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css2?family=Grandstander:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
<style>
body {
 font-family: "Grandstander", cursive;
  font-weight:auto;
  font-style: normal;
}
</style>
</head>
<body>  <%if id>0 then%>  
 <%set m1= Server.CreateObject("adodb.recordset")%>
<%m1.open"select*from menu where id="&id&"",conn,1,3%> 
<table width="100%" border="0" cellpadding="1" cellspacing="1">
  <tr>
    <td><%=m1("menu")%> </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td rowspan="2" valign="top"><form name="form1" method="post" action="menu_ekle.asp">
      <label>
      <input name="menu" type="text" id="menu" size="15">
      </label>
        <input name="gelen" type="hidden" id="gelen" value="<%=m1("id")%>">
        <label>
        <input type="submit" name="button" id="button" value="ekle">
        </label>
    </form>

     <%set m2= Server.CreateObject("adodb.recordset")%>
<%m2.open"select*from menu where gelen="&id&" order by sira asc",conn,1,3%> 
<%do while not m2.eof%>

<form name="form2" method="post" action="menu_yenile.asp">
 <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5"></path>
</svg>
  <label>
  <input name="menu" type="text" id="menu" value="<%=m2("menu")%>" size="15">
  </label>
  <label>
  <input name="sira" type="text" id="sira" value="<%=m2("sira")%>" size="1">
  </label>
  <input name="id" type="hidden" id="id" value="<%=m2("id")%>">
  <label>
  <input type="submit" name="button2" id="button" value="yenile">
  </label> <a href="menu_sil.asp?id=<%=m2("id")%>">sil</a>
</form> 
<%m2.movenext%>
<%loop%>  <%end if%>  </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html> 
