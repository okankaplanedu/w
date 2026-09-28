  
 <% set conn1= Server.CreateObject("adodb.connection") %>
<% conn1.open("driver={microsoft access driver (*.mdb)}; dbq="&server.MapPath("/vt1.mdb")) %>
  <%canonical=request("canonical")%>
  <%id=request("id")%>
   <%etsylink=request("etsylink")%>
   <%fiyat=request("fiyat")%>
 <%codepen=request("codepen")%>
  <%sketchfab=request("sketchfab")%>
      <%zoom=request("zoom")%>
        <%lng=request("lng")%>
        <%lat=request("lat")%>
 
          <%youtube=request("youtube")%>
            <%ses=request("ses")%>
            <%resim=request("resim")%>
            <%etiket=request("etiket")%>
            <%p3=request("p3")%>
             <%p2=request("p2")%>
              <%h3=request("h3")%>
             <%h2=request("h2")%>
<%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"select*from masonry where id="&id&"",conn1,1,3%>
 
 <%rs("etsylink")=etsylink%>
  <%rs("fiyat")=fiyat%>
  <%rs("codepen")=codepen%>
 <%rs("sketchfab")=sketchfab%>
 
 
    <%rs("zoom")=zoom%>
    <%rs("lng")=lng%>
      <%rs("lat")=lat%>
 
          <%rs("youtube")=youtube%>
           <%rs("ses")=ses%>
            <%rs("resim")=resim%>
              <%rs("etiket")=etiket%>
                <%rs("p3")=p3%>
                  <%rs("p2")=p2%>
                    <%rs("h3")=h3%>
                  <%rs("h2")=h2%>
 <%rs.update%>
 
 
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
tx.WriteText "<title> canvasor.net" & canonical & " sayfasi yayina hazirlaniyor</title>"
tx.WriteText "<link href=""https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css"" rel=""stylesheet"">"

tx.WriteText "</head>"
tx.WriteText "<body> <h1> canvasor.net tarafindan sayfa yayina hazirlaniyor </h1><p>" &  canonical & "</p>"
 
tx.WriteText "<script src=""https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js""></script>"
tx.WriteText "<script src=""https://maxcdn.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js""></script>"
tx.WriteText "</body>"
tx.WriteText "</html>"

tx.SaveToFile Server.MapPath(klasorx & "/default.asp"), 2
tx.Close
Set dosyax = Nothing
Set fsox = Nothing%>

%>


 
 
 
<%set rs2= Server.CreateObject("adodb.recordset")%>
<%rs2.open"select*from kategori where canonical='"&canonical&"'",conn1,1,3%>
 
 
<%rs2("yayin")=0%>
<%rs2.update%>

<%response.Redirect(request.ServerVariables("HTTP_REFERER"))%>
 

