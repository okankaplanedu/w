 
 

<%
 

Dim id, canonical, headKodlari, mainKodlari, footerKodlari
id = Request("id")
canonical = Trim(Request("canonical"))
headKodlari = Request("headKodlari")
mainKodlari = Request("mainKodlari")
mainKodlari=replace(mainKodlari,"&lt;","<")
mainKodlari=replace(mainKodlari,"&gt;",">")
 headKodlari=replace(headKodlari,"zzzz","<%kategori=rrrr")
  headKodlari=replace(headKodlari,"rrrr",id)
  headKodlari=replace(headKodlari,"gggg","pppp>")
   headKodlari=replace(headKodlari,"pppp","%")
footerKodlari = Request("footerKodlari")
Response.CodePage = 65001
Response.Charset = "UTF-8"
Dim tx, fs
Set fs = Server.CreateObject("Scripting.FileSystemObject")
Set tx = fs.CreateTextFile(Server.MapPath("../" & canonical & "/default.asp"), True, False)
tx.Write headKodlari  
tx.Write mainKodlari 
tx.Write footerKodlari  
tx.Close
Set tx = Nothing
Set fs = Nothing


%>
 <!--#include file="../c1.asp"-->
 
 
 
<%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"select*from kategori where canonical='"&canonical&"'",conn1,1,3%>
 
 
<%rs("yayin")=1%>
<%rs.update%>
<%Response.Redirect("../"& canonical)%> 
