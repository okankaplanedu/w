  
 <% set conn1= Server.CreateObject("adodb.connection") %>
<% conn1.open("driver={microsoft access driver (*.mdb)}; dbq="&server.MapPath("/vt1.mdb")) %>
<%geri=request("geri")%>
<%gelen=request("gelen")%>
<%mas=request("mas")%>
<%id=request("id")%>
<%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"select * from masonry where id="&id&"", conn1, 1, 3%>
 

 
<%
Session.CodePage = 1254
Session.LCID = 1055
%>
<%Response.Charset="ISO-8859-9"
Response.Charset="Windows-1254"
response.ContentType="text/HTML"
%>
 
<!--#include file="../conn2.asp"-->
<%id=request("id")%>
<%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"select*from masonry where id="&mas&"",conn2,1,3%>
<!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css/wysiwyg.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Are+You+Serious&family=Barriecito&family=Bigelow+Rules&family=Birthstone+Bounce&family=Cantora+One&family=Capriola&family=Combo&family=Comforter&family=Diplomata&family=Eczar&family=Englebert&family=Francois+One&family=Fraunces:wght@200&family=Freckle+Face&family=Galindo&family=Glass+Antiqua&family=Grape+Nuts&family=Inknut+Antiqua:wght@300&family=Josefin+Sans:wght@300&family=Just+Me+Again+Down+Here&family=Kanit:wght@200&family=Kavivanar&family=Lexend+Zetta:wght@200&family=Life+Savers&family=Lora&family=Love+Light&family=Luxurious+Roman&family=Mansalva&family=Merriweather:wght@300&family=Modern+Antiqua&family=Montserrat:wght@300&family=Mynerve&family=New+Rocker&family=Noto+Serif+Makasar&family=Old+Standard+TT&family=Oooh+Baby&family=Orelega+One&family=PT+Serif&family=Peralta&family=Playfair+Display&family=Poppins:wght@200&family=Quicksand:wght@300&family=Rakkas&family=Ribeye+Marrow&family=Roboto+Slab:wght@300&family=Rowdies:wght@300&family=Rubik+Marker+Hatch&family=Rubik+Vinyl&family=Rum+Raisin&family=Saira+Stencil+One&family=Sigmar&family=Space+Grotesk:wght@300&family=Syne+Mono&family=Tapestry&family=Titillium+Web:wght@200&family=Turret+Road:wght@200&family=Twinkle+Star&family=Underdog&family=Wellfleet&family=Xanh+Mono&family=Yeseva+One&family=Ysabeau+Office:wght@200&family=Zilla+Slab+Highlight&display=swap" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<div>

 

 
<form name="form1" method="post" action="p2_yenile.asp">
<textarea id="editor" name="editor"><%=rs("p2")%> </textarea>
<input name="id" type="hidden" value="<%=rs("id")%>">
<label><input type="submit" name="button" id="button" value="yenile"></label>
 
</form>
 

</div>     
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/txt2.js">
</script>
<script type="text/javascript">
$(document).ready(function () {
$('#editor').wysiwyg({
});
});
</script>

 
 

</body>
</html>
 


