  
 <% set conn2= Server.CreateObject("adodb.connection") %>
<% conn2.open("driver={microsoft access driver (*.mdb)}; dbq="&server.MapPath("/vt1.mdb")) %>
<%id=request("id")%>
<%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"select*from kategori where id="&id&"",conn2,1,3%>
<%rs("yayin")=1%>
<%rs.update%>
<%set edt= Server.CreateObject("adodb.recordset")%>
<%edt.open"select*from editor where id=1",conn2,1,3%>
<%
Set rsx = Server.CreateObject("ADODB.Recordset")
rsx.Open "SELECT *FROM kategori where id="&id&"",conn2, 1, 3
Dim id, detay_verisi2
id = Request.QueryString("id")
 
Dim klasorx
klasorx = "/read/"&rsx("canonical")
Dim fsox
Set fsox = CreateObject("Scripting.FileSystemObject")
If Not fsox.FolderExists(Server.MapPath(klasorx)) Then
fsox.CreateFolder(Server.MapPath(klasorx))
End If
ogimage =  left(trim(rsx("title")),1)&".gif" 
Response.CodePage = 65001
Response.Charset = "UTF-8"
Dim tx
Set tx = Server.CreateObject("ADODB.Stream")
tx.Charset = "utf-8"
tx.Open
tx.WriteText  chr(60) &   chr(37) & "session(" & chr(34) & "read_kat" & chr(34) & ")=" & id & chr(37) & chr(62) 
tx.WriteText  chr(60) &   chr(37) & "session(" & chr(34) & "tur" & chr(34) & ")=" & rsx("tur") & chr(37) & chr(62)   
tx.WriteText "<!--#inc"&"lude file="&chr(34)&"../../conn3.asp"&chr(34)&"-->"   
tx.WriteText "<!--#inc"&"lude file="&chr(34)&"../../head_read.asp"&chr(34)&"-->" 
tx.WriteText "<!--#inc"&"lude file="&chr(34)&"../../body_sablon.asp"&chr(34)&"-->"  
tx.SaveToFile Server.MapPath(klasorx & "/default.asp"), 2
tx.Close
Set dosyax = Nothing
Set fsox = Nothing%>
%>
<%response.Redirect(request.ServerVariables("HTTP_REFERER"))%>
 

