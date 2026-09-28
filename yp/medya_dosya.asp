 
 
<!DOCTYPE html>
<html>
<head>
<%kat=request("kat")%>
<%if kat="" then%><%kat=1%><%end if%>
  
 <% set conn2= Server.CreateObject("adodb.connection") %>
<% conn2.open("driver={microsoft access driver (*.mdb)}; dbq="&server.MapPath("/vt1.mdb")) %>

<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
<link href="https://getbootstrap.com/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript" src="../js/site.js" ></script>
<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
<script type="text/javascript" language="javascript" src="../js/demo.js"></script>
<script type="text/javascript" class="init">
$(document).ready(function () {
$('#example').DataTable({
    "dom": '<"top"lf>t<"bottom"ip>',
	
    "lengthChange": false
});

});
</script> 
<link href="https://fonts.googleapis.com/css2?family=Luxurious+Roman&display=swap" rel="stylesheet">
<style>
body{font-family: 'Luxurious Roman', cursive;}

 .popover-body {
  max-height: 300px;
  overflow-y: auto;
}

</style>
</head>
<body >

 


<br>
<a href="?kat=1">RESiM ALBUMU </a> |   <a href="?kat=3">SES DOSYASI</a> 
<%if kat=1 then%> 
<div>53:RESiM ALBUMU / kayitlarda kullaniliyorsa silinemez</div>
<a href="medya/resim/upload/resim_form.asp?format=.gif" >gif yukle</a> <br>
 <%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"select*from resim order by ad asc",conn2,1,3%>
<%do while not rs.eof%>

<span style="padding-left:5px"><table   border="0" cellpadding="0" cellspacing="0" style="float:left; margin:3px">

    <td><img  class="rounded" src="../medya/resim/<%=rs("resim")%>" style="display:block; margin:auto; width:150px; height:100px; object-fit:cover;">
	<br>
	
	<%=rs("resim")%> 
	
	</td>
  </tr>   
 
  
  <tr>
    <td>
    
   
 
 <form name="form2" method="post" action="resim_detay_yenile.asp">
 resim_detay_yenile<br>
  <input name="detay" type="text" id="detay" value="<%=rs("detay")%>" size="15">
   <br>ad:<br>
   <input name="ad" type="text" id="ad" value="<%=rs("ad")%>" size="15">
   <input name="resim_id" type="hidden" id="resim_id" value="<%=rs("id")%>">
   <br>
   <input type="submit" name="button" id="button" value="resim detay yenile">
 </form>
    
    </td>
  </tr>
  <tr>
    <td>  <a href="medya/resim/upload/resim_sil.asp?resim=<%=rs("resim")%>&id=<%=rs("id")%>">resim sil  </a>
	| <a href="medya/resim/upload/resize.asp?gelen=<%=rs("resim")%>">resize</a>
	
	</td>
  </tr>
</table>
</span>
<%rs.movenext%>
<%loop%>


<%end if%>





 






<%if kat=3 then%> 

<div>84:SES DOSYASI - kayitlarda kullanilyorsa silinemez</div>

<a href="/medya/ses/upload/ses_form.asp?format=.mp3" >mp3 yukle</a>
<br>
 <%set rs3= Server.CreateObject("adodb.recordset")%>
<%rs3.open"select*from ses order by id desc",conn2,1,3%>
<%do while not rs3.eof%>
<div style="float:left"> <audio controls id="myAudio<%=rs3("id")%>"  style=" width:150px"> <source src="../medya/ses/<%=rs3("ses")%>" type="audio/mp3"> </audio> 
 <br>
 
 <form name="form1" method="post" action="ses_detay_yenile.asp">
 ses_detay_yenile<br>
   <textarea name="detay" cols="15" rows="1" id="detay">  <%=rs3("detay")%> </textarea><br>
    <input name="ad" type="text" id="ad" value="<%=rs3("ad")%>"><br>
   <input name="ses_id" type="hidden" id="ses_id" value="<%=rs3("id")%>">
   <input type="submit" name="button" id="button" value="ses detay">
 </form>
 
<a href="medya/ses/upload/ses_sil.asp?ses=<%=rs3("ses")%>&id=<%=rs3("id")%>"> sil  </a> 
</div>
<%rs3.movenext%>
<%loop%>


<%end if%>

 

 
