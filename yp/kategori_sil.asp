  
 <% set conn2= Server.CreateObject("adodb.connection") %>
<% conn2.open("driver={microsoft access driver (*.mdb)}; dbq="&server.MapPath("/vt1.mdb")) %>
<%id=request("id")%>
<%set kat_ad= Server.CreateObject("adodb.recordset")%>
<%kat_ad.open"select*from kategori where id="&id&"",conn2,1,3%>
 

<%
Dim id2
id2 = Request.QueryString("id")
Dim dosya_yolu2
dosya_yolu2 = Server.MapPath("/"&kat_ad("canonical"))
Dim dosya_obj2
Set dosya_obj2 = Server.CreateObject("Scripting.FileSystemObject")
If dosya_obj2.FolderExists(dosya_yolu2) Then
dosya_obj2.DeleteFolder dosya_yolu2
End If
Set dosya_obj2 = Nothing
%>

 

<%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"delete*from kategori where id="&id&"",conn2,1,3%>

 

<%response.Redirect(request.ServerVariables("HTTP_REFERER"))%>
 


 