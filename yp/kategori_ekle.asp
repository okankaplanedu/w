  
 <% set conn2= Server.CreateObject("adodb.connection") %>
<% conn2.open("driver={microsoft access driver (*.mdb)}; dbq="&server.MapPath("/vt1.mdb")) %>
<%

ek=request("ek")
session("ek")=ek
ilk_kat = trim(Request("ilk_kat"))
ilk_desc = trim(Request("ilk_desc"))
if request("ek")="" then
kategori = trim(Request("kategori"))
else
kategori = trim(ek&":"&Request("kategori"))
end if



gelen = Request("gelen")
canonical = request("canonical")
canonical = Replace(canonical,"ç","c")
canonical = Replace(canonical,"ğ","g")
canonical = Replace(canonical,"ı","i")
 

canonical = Replace(canonical,"İ","i")
canonical = Replace(canonical,"ö","o")
canonical = Replace(canonical, "ü", "u")
canonical = Replace(canonical, "ş", "s")
canonical = Replace(canonical, ":", "-")
canonical = Replace(canonical, "/", "-")
canonical = Replace(canonical, ",", "-")
canonical = Replace(canonical, ".", "-")
canonical = Replace(canonical, "?", "-")
canonical = Replace(canonical, "(", "-")
canonical = Replace(canonical, ")", "-")
canonical = Replace(canonical, " ", "-")
canonical = Replace(canonical, "--", "-")
canonical = Replace(canonical, "'", "-")
canonical = Replace(canonical, chr(34), "-")
%>
 
<%kategori=replace(kategori,chr(34),"&#8220;")%>
<%kategori=replace(kategori,"'","&#8217;")%>
<%set kat_kont= Server.CreateObject("adodb.recordset")%>
<%kat_kont.open"select*from kategori where kategori='"&kategori&"'",conn2,1,3%>
<%if kat_kont.eof then%>
<%if gelen="" then%><%gelen=0%><%end if%>
 
<%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"select*from kategori",conn2,1,3%>
<%rs.addnew%>
<%rs("kategori")=kategori%>
<%rs("canonical")=canonical%>
<%if ilk_kat="" then%>
<%rs("title")= "index"%>
<%else%>
<%rs("title")= ilk_kat%>
<%end if%>
<%rs("descr")=kategori%>
<%if ilk_kat="" then%>
<%rs("baslik")="index"%>
<%else%>
<%rs("baslik")=ilk_desc%>
<%end if%>
<%rs("gelen")=gelen%>
<%rs.update%>
 
<%set edt= Server.CreateObject("adodb.recordset")%>
<%edt.open"select*from editor where id=1",conn2,1,3%>

 
<%
Dim klasorx
klasorx = "/"&canonical
Dim fsox
Set fsox = CreateObject("Scripting.FileSystemObject")
If Not fsox.FolderExists(Server.MapPath(klasorx)) Then
fsox.CreateFolder(Server.MapPath(klasorx))
End If
 
Response.CodePage = 65001
Response.Charset = "UTF-8"
Dim tx
Set tx = Server.CreateObject("ADODB.Stream")
tx.Charset = "utf-8"
tx.Open
 tx.WriteText "<!DOCTYPE html>"
tx.WriteText "<html lang=""en"">"
tx.WriteText "<head>"
tx.WriteText "<meta charset=""UTF-8"">"
tx.WriteText "<meta name=""viewport"" content=""width=device-width, initial-scale=1.0"">"
tx.WriteText "<title> canvasor.net" & canonical & " sayfası yayına hazırlanıyor</title>"
tx.WriteText "<link href=""https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css"" rel=""stylesheet"">"

tx.WriteText "</head>"
tx.WriteText "<body> <h1>canvasor.net tarafından sayfa yayına hazırlanıyor</h1><p>" &  canonical & "</p>"
 
tx.WriteText "<script src=""https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js""></script>"
tx.WriteText "<script src=""https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js""></script>"
tx.WriteText "</body>"
tx.WriteText "</html>"

tx.SaveToFile Server.MapPath(klasorx & "/default.asp"), 2
tx.Close
Set dosyax = Nothing
Set fsox = Nothing%>

%>

 
  
<%response.Redirect(request.ServerVariables("HTTP_REFERER"))%>
<%else%>
<%response.Redirect(request.ServerVariables("HTTP_REFERER"))%>
<%end if%>
 