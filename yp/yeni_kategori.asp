 
<% set conn1= Server.CreateObject("adodb.connection") %>
<% conn1.open("driver={microsoft access driver (*.mdb)}; dbq="&server.MapPath("/vt1.mdb")) %>
  
<%set rsedt= Server.CreateObject("adodb.recordset")%>
<%rsedt.open"select*from editor where id=1",conn1,1,3%>
<%movex=request("movex")%>
<%if session("movex")="" and  movext="" then%>
<%session("movex")=movex%>
<%end if%>

<%if movex=12  then%>
<%session("movex")=""%>
<%end if%>

<%modal=request("modal")%>
<%modx=request("modx")%>
<%konum=request("konum")%>
<%ek=request("ek")%>
<%if ek="ok" then%><%session("ek")=""%><%end if%>
<%geri=request("geri")%><%if geri="" then%><%geri=0%><%end if%>
<%gelen=request("gelen")%><%if gelen="" then%><%gelen=0%><%end if%>
 
<%mas=request("mas")%><%if mas="" then%><%mas=0%><%end if%>
<%resim=request("resim")%><%if resim="" then%><%resim=0%><%end if%>
<%ses=request("ses")%><%if ses="" then%><%ses=0%><%end if%>
<%video=request("video")%><%if video="" then%><%video=0%><%end if%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://getbootstrap.com/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
 
<meta name="theme-color" content="#712cf9">
<style>
 
	.youtube{
	position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width:200px
	
	}
 
.video-wrapper {
    position: relative;
    padding-bottom:57.25%; /* 4:3 ratio */
    margin: 1%; /* IE6 workaround*/
    height: 0;
    overflow: hidden;
}

 

iframe,object,embed,video,.videoWrapper,.video-js {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
}

.video-js, img.vjs-poster {
    width: 100% !important;
    height: 100% !important;  
  
}
   .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
 .player {
    position: relative;
    width: 100%;
   
}

.player .imgbx {
    position: relative;
    width: 100%;
    height: 350px;
}

.player .imgbx img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.player audio {
    width: 100%;
    outline: none;
}
 
 
 
</style>
 

 

 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
 <!--#include file="skt.asp"-->
<header class="navbar navbar-expand-lg navbar-dark bd-navbar sticky-top" style="z-index:1">
120 - editor  - moduller  -  yeni kategori  -  
</header>

<div class="mt-3 my-md-4 bd-layout">
<%set kt= Server.CreateObject("adodb.recordset")%>
<%kt.open"select*from kategori where gelen="&gelen&"  order by id asc",conn1,1,3%>
<%set ilk_kat= Server.CreateObject("adodb.recordset")%>
<%ilk_kat.open"select*from kategori where id="&gelen&" ",conn1,1,3%>

<aside class="bd-sidebar" style="width:300px">
<form name="form1" method="post" action="kategori_ekle.asp">
  <p>140: <kbd>kategori_ekle.asp</kbd> <%=session("oki")%> -<%=session("okiho")%> </p>
  <p>
    <input name="ilk_kat" type="hidden" id="ilk_kat" size="38" value="<%if not ilk_kat.eof then%><%=ilk_kat("kategori")%><%end if%>">
     <input name="ilk_desc" type="hidden" id="ilk_desc" size="38" value="<%if not ilk_kat.eof then%><%=ilk_kat("descr")%><%end if%>">
     ek:<input name="ek" type="text" id="ek" value="<%=session("ek")%>" size="20"> <a href="?geri=<%=geri%>&gelen=<%=gelen%>&ek=ok">sil</a><br>
    kat:<input name="kategori" type="text" id="kategori" size="25">
	<b>
	link:<input name="canonical" type="text" id="canonical" size="25">
    <input name="gelen" type="hidden" id="gelen" value="<%=gelen%>">
    <input type="submit" name="button" id="button" value="EKLE">
  </p>
</form>
 <script>
        document.getElementById('kategori').addEventListener('input', function(event) {
            var kategoriValue = this.value.trim();
            var canonicalInput = document.getElementById('canonical');
            
            // Türkçe karakterleri ve boşlukları replace işlemiyle düzelt
            var canonicalValue = kategoriValue.toLowerCase()
                .replace(/ /g, '-') // Boşlukları tire ile değiştir
                .replace(/ı/g, 'i') // Türkçe ı harfini i harfine çevir
                .replace(/ğ/g, 'g') // Türkçe ğ harfini g harfine çevir
                .replace(/ü/g, 'u') // Türkçe ü harfini u harfine çevir
                .replace(/ş/g, 's') // Türkçe ş harfini s harfine çevir
                .replace(/ö/g, 'o') // Türkçe ö harfini o harfine çevir
                .replace(/ç/g, 'c'); // Türkçe ç harfini c harfine çevir
                
            canonicalInput.value = canonicalValue;
        });
    </script>
<%if gelen>0 then%>
<%set gel_kat= Server.CreateObject("adodb.recordset")%>
<%gel_kat.open"select*from kategori where id="&gelen&" ",conn1,1,3%>
<span style="font-size:18px">
<%set geri_kat= Server.CreateObject("adodb.recordset")%>
<%geri_kat.open"select*from kategori where id="&gel_kat("gelen")&" ",conn1,1,3%><%if geri>0 then%>
<a href="?gelen=0" style="text-decoration:none; color:#000"><span class="badge rounded-pill bg-danger"> < </span> index1</a> / 
<a href="?gelen=<%=geri%>" style="text-decoration:none; color:#000"><span class="badge rounded-pill bg-danger"> < </span> <%=geri_kat("kategori")%></a><%else%><a href="?gelen=0" style="text-decoration:none; color:#000"><span class="badge rounded-pill bg-danger"> < </span> index2</a><%if not geri_kat.eof then%> / <a href="?gelen=<%=geri_kat("id")%>" style="text-decoration:none; color:#000"><span class="badge rounded-pill bg-danger"> < </span> <%=geri_kat("kategori")%></a><%end if%><%end if%>  </span><br>
<kbd><a href="?geri=<%=geri%>&gelen=<%=gelen%>"> 149:<%=gel_kat("kategori")%></a>


</kbd>
<%end if%>
<%do while not kt.eof%>
<p>
<%if kt("yayin")-1=0 then%>
<span class="badge rounded-pill bg-success"> 
<a href="?movex=<%=kt("id")%>&geri=<%=geri%>&gelen=<%=gelen%>"><kbd><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-copy" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M4 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V2Zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H6ZM2 5a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1v-1h1v1a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h1v1H2Z"/></svg></kbd></a>

<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-play-fill" viewBox="0 0 16 16"><path d="m11.596 8.697-6.363 3.692c-.54.313-1.233-.066-1.233-.697V4.308c0-.63.692-1.01 1.233-.696l6.363 3.692a.802.802 0 0 1 0 1.393z"></path>
</svg> </span>

<%else%>
<span class="badge rounded-pill bg-danger"> 
<a href="?movex=<%=kt("id")%>&geri=<%=geri%>&gelen=<%=gelen%>"><kbd><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-copy" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M4 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V2Zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H6ZM2 5a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1v-1h1v1a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h1v1H2Z"/></svg></kbd></a>




<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pause-circle-fill" viewBox="0 0 16 16"><path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM6.25 5C5.56 5 5 5.56 5 6.25v3.5a1.25 1.25 0 1 0 2.5 0v-3.5C7.5 5.56 6.94 5 6.25 5zm3.5 0c-.69 0-1.25.56-1.25 1.25v3.5a1.25 1.25 0 1 0 2.5 0v-3.5C11 5.56 10.44 5 9.75 5z"></path></svg> </span>

<%end if%>
 
<img src="../../medya/resim/<%=  kt("resim")  %>" style="width:25px;"> 

<a href="?geri=<%=kt("gelen")%>&gelen=<%=kt("id")%>" style="text-decoration:none; color:#000" title="<%=kt("kategori")%>"><%=left(kt("kategori"),15)%> </a>    <span style="font-size:15px;float:right">  <%if not kt("youtube")="" then %><a href="youtube_link_sil.asp?id=<%=kt("id")%>">(YT)</a><%end if%>   </span> 

 



<%set sil_kont= Server.CreateObject("adodb.recordset")%>
<%sil_kont.open"select*from kategori where gelen="&kt("id")&" ",conn1,1,3%>
<%if sil_kont.eof then%>
<%set sil_kont2= Server.CreateObject("adodb.recordset")%>
<%sil_kont2.open"select*from masonry where kat="&kt("id")&" ",conn1,1,3%>
<%if sil_kont2.eof then%>
<span style="float:right"><a href="kategori_sil.asp?id=<%=kt("id")%>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z"></path>
</svg></a> </span>
<%end if%><%end if%>
</p>
<%kt.movenext%>
<%loop%>
208
<br>
kategoride mas varsa silinemez
</aside>
<%if gelen=0 then%>

<div class="bd-main" style="margin-top:50px; padding:1%">
<div class=" row" data-masonry="{";percentPosition": true }">

<%set main= Server.CreateObject("adodb.recordset")%>
<%main.open"select*from masonry where anasayfa=1",conn1,1,3%>
<%do while not main.eof%>
<div class="col-sm-6 col-lg-6 mb-6"> 
<div class="card "> 
<div class="card-body"> 
<h2><%=main("h2")%></h2>
<p><%=main("p2")%></p>

<%if not main("resim")="" then%>
<img class="card p-3" src="../medya/resim/<%=main("resim")%>" alt="<%=main("p2")%>" style="width:100%; height:100%"><%end if%>

<%if not main("youtube")="" then%>
<div class="video-wrapper" style="position: relative;"><a href="https://www.youtube.com/watch?v=<%=main("youtube")%>" target="_blank" style="display: block; max-width: 100%; max-height: 100%;"><img src="https://img.youtube.com/vi/<%=main("youtube")%>/maxresdefault.jpg" alt="<%=main("h2")%>" style="object-fit: contain; width: 100%;"><img src="ytpng.png" alt="<%=main("h2")%>" class="youtube"></a></div>
<%end if%>
<%if not main("ses")="" then%><div class="player"> <audio controls> <source src="medya/ses/<%=main("ses")%>"> </audio> <%end if%>
<%if not main("lat")="" then%> <%dim latValue2 %><%latValue2 = main("lat")%><%dim decimallatValue2%><%decimallatValue2 = CDbl(Replace(latValue2, ",", "."))%><%dim latresult2%><%latresult2 = decimallatValue2/10000 - 0.005%><%lat2 = Replace(FormatNumber(latresult, 4, vbTrue, vbFalse, vbFalse), ",", ".")%><%dim lngValue2%><%lngValue2 = main("lng")%><%dim decimallngValue2%><%decimallngValue2 = CDbl(Replace(lngValue2, ",", "."))%><%dim lngresult2%><%lngresult2 = decimallngValue2/10000 - 0.005%><%lng2 = Replace(FormatNumber(lngresult2, 4, vbTrue, vbFalse, vbFalse), ",", ".")%> <div class="video-wrapper"> <embed src="https://www.openstreetmap.org/export/embed.html?bbox=<%=main("lat")%>%2C<%=main("lng")%>%2C<%=lat2%>%2C<%=lng2%>&amp;layer=mapnik" width="100%" height="100%" frameborder="0"></embed></div><%end if%>
<%if not main("kod")="" then%> <style>.kod-blok { overflow: auto;max-height: 400px;}</style><div class="kod-blok"><pre><code><textarea class="form-control" style="width:100%; height:300px"><%=main("kod")%></textarea></code></pre></div><%end if%>
<%if not main("codepen")="" then%>
<div class="card" style="width: 100%; height:350px;"><iframe style="width: 100%; height:350px" scrolling="no" title="vbnvbn" src="https://codepen.io/Okan-Kaplan/embed/<%=main("codepen")%>?default-tab=html%2Cresult" frameborder="no" loading="lazy" allowtransparency="true" allowfullscreen="true"></iframe></div>
<%end if%>

<%if not main("sketchfab")="" then%>
<div class="card" style="width: 100%; height:350px;"><iframe style="width:100%;height:350px" title="<%=main("h2")%>" frameborder="0" allowfullscreen="" mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking="" execution-while-out-of-viewport="" execution-while-not-rendered="" web-share="" src="https://sketchfab.com/models/<%=main("sketchfab")%>/embed"> </iframe> </div>
<%end if%>



<h3><%=main("h3")%></h3>
<p><%=main("p3")%></p>
  </div>
 </div>
 </div>
 <%main.movenext%>
 <%loop%>
 
 </div>


  
  
  <div class="bd-toc mt-4 mb-5 my-md-0 ps-xl-3 mb-lg-5 text-muted"></div>
  
 
  </div>
  </main>
  

  

<%response.End()%><%end if%>

<main class="bd-main">
<div>
<% if gelen > 0 and mas > 0 then%> 
 
editör | vt : masonry | masonry_yenile.asp
<%set mas2= Server.CreateObject("adodb.recordset")%>
<%mas2.open"select*from masonry where id="&mas&" ",conn1,1,3%>
<form name="form4" method="post" action="masonry_yenile.asp">
  
  <input name="id" type="hidden" id="id" value="<%=mas2("id")%>">
  
  h2:
    <label>
    <input name="h2" type="text" id="h2" value="<%=mas2("h2")%>">
    </label>
 
 <br> 
<textarea name="p2" id="p2" style="display:none"><%=mas2("p2")%></textarea> 
<!--------------------------------------------p2------------------------------------>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#p2Modal"> paragraf 2 </button>

<div class="modal fade" id="p2Modal" tabindex="-1" aria-labelledby="p2ModalLabel" aria-hidden="true">
<div class="modal-dialog modal-xl">
<div class="modal-content">
 <div class="modal-body" style="height:450px; "> 
<iframe id="p2ifrm" src="p2editor.asp?geri=<%=geri%>&gelen=<%=gelen%>&mas=<%=mas%>&id=<%=mas2("id")%>" width="100%" height="700px"></iframe>
</div>
</div>
</div>
</div>
<!-----------------------------------------------//p2--------------------------------->

 
<%if not mas2("p2")="" then%> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16"> <path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783"/>
</svg><%end if%> 

<br>
  h3:
    <label>
    <input name="h3" type="text" id="h3" value="<%=mas2("h3")%>">
    </label>
  <br> 
 <textarea name="p3" id="p3" style="display:none"><%=mas2("p3")%></textarea> 
<!--------------------------------------------p2------------------------------------>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#p3Modal"> paragraf 3 </button>

<div class="modal fade" id="p3Modal" tabindex="-1" aria-labelledby="p3ModalLabel" aria-hidden="true">
<div class="modal-dialog modal-xl">
<div class="modal-content">
 <div class="modal-body" style="height:450px; "> 
<iframe id="p3ifrm" src="p3editor.asp?geri=<%=geri%>&gelen=<%=gelen%>&mas=<%=mas%>&id=<%=mas2("id")%>" width="100%" height="700px"></iframe>
</div>
</div>
</div>
</div>
<!-----------------------------------------------//p3--------------------------------->

<%if not mas2("p3")="" then%> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16"> <path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783"/>
</svg><%end if%> 

<br>
  etiket:
    <label>
    <input name="etiket" type="text" id="etiket" value="<%=mas2("etiket")%>">
    </label>
  <br>
  <input name="resim" type="hidden" id="resim" value="<%=mas2("resim")%>"> 
  
 <%if not mas2("resim")="" then%> <img src="../medya/resim/<%=mas2("resim")%>" width="90"><a href="masonry_resim_sil.asp?id=<%=mas2("id")%>">sil 261</a><%end if%>
  
  
  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
  <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0"/>
  <path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1z"/>
</svg>
   
 <!--------------------------------------------resimsec----------------------------------->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#resimModal"> resimsec </button>

<div class="modal fade" id="resimModal" tabindex="-1" aria-labelledby="resimModalLabel" aria-hidden="true">
<div class="modal-dialog modal-xl">
<div class="modal-content">
 <div class="modal-body" style="height:450px; "> 
   
<div class="overflow-auto modal-body" style="height:400px">
<input type="search" id="search" placeholder="Search" class="form-control sticky-sm-top" style="position:fixed; top:50px;width:20%">
<nav id="TableOfContents">
<ul class="treeview">
<% Set resim = Server.CreateObject("adodb.recordset") %>
<% resim.open "SELECT * FROM resim order by id desc", conn1, 1, 3 %>
<%do while not resim.eof%>
<div class="lazy-item loaded" style="float:left"> <a href="masonry_resim_ekle.asp?id=<%=mas2("id")%>&resim=<%=resim("resim")%>"><img src="../medya/resim/<%=resim("resim")%>" height="100" style="margin:5px"> <p style="font-size:.10px"><%=resim("ad")%></p> </a><p style="font-size:16px"><%=resim("resim")%></p></div>
<%resim.movenext%>
<%loop%>
 </ul>
</nav>

<script>
 
  function lazyLoad() {
    var lazyItems = document.querySelectorAll('.lazy-item:not(.loaded)');
    for (var i = 0; i < lazyItems.length; i++) {
      lazyItems[i].style.display = '';
      lazyItems[i].classList.add('loaded');
    }
  }
 
  function filter() {
    var term = document.getElementById('search').value.toLowerCase();
    var items = document.querySelectorAll('.lazy-item');
    for (var i = 0; i < items.length; i++) {
      var text = items[i].textContent.toLowerCase();
      if (text.indexOf(term) > -1) {
        items[i].style.display = '';
      } else {
        items[i].style.display = 'none';
      }
    }
  }

 
  document.getElementById('search').addEventListener('input', function() {
    filter();
    lazyLoad(); 
  });

 
  window.addEventListener('DOMContentLoaded', function() {
    lazyLoad();
  });
</script>
</div>
</div>
</div>
</div>
</div>
<!-----------------------------------------------//resim------------------------------->
 <br>
 <input name="ses" type="hidden" id="ses" value="<%=mas2("ses")%>"> 
 
<%if not mas2("ses")="" then%>
<span> <audio controls id="myAudio30" style=" width:100px"> <source src="../medya/ses/<%=mas2("ses")%>" type="audio/mp3"> </audio><span style=" position:absolute;margin-top:15px"> <a href="masonry_ses_sil.asp?id=<%=mas2("id")%>">sil 273</a></span></span><%end if%>
 
 
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-volume-up-fill" viewBox="0 0 16 16">
  <path d="M11.536 14.01A8.47 8.47 0 0 0 14.026 8a8.47 8.47 0 0 0-2.49-6.01l-.708.707A7.48 7.48 0 0 1 13.025 8c0 2.071-.84 3.946-2.197 5.303z"/>
  <path d="M10.121 12.596A6.48 6.48 0 0 0 12.025 8a6.48 6.48 0 0 0-1.904-4.596l-.707.707A5.48 5.48 0 0 1 11.025 8a5.48 5.48 0 0 1-1.61 3.89z"/>
  <path d="M8.707 11.182A4.5 4.5 0 0 0 10.025 8a4.5 4.5 0 0 0-1.318-3.182L8 5.525A3.5 3.5 0 0 1 9.025 8 3.5 3.5 0 0 1 8 10.475zM6.717 3.55A.5.5 0 0 1 7 4v8a.5.5 0 0 1-.812.39L3.825 10.5H1.5A.5.5 0 0 1 1 10V6a.5.5 0 0 1 .5-.5h2.325l2.363-1.89a.5.5 0 0 1 .529-.06"/>
</svg>

<!--------------------------------------------ses------------------------------------>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#sesModal"> ses sec </button>

<div class="modal fade" id="sesModal" tabindex="-1" aria-labelledby="sesModalLabel" aria-hidden="true">
<div class="modal-dialog modal-xl">
<div class="modal-content">
 <div class="modal-body" style="height:450px; "> 
  <div class="overflow-auto modal-body" style="height:400px">
          <input type="search" id="search2" placeholder="Search" class="form-control sticky-sm-top" style="position:fixed; top:50px;width:20%">
          <nav id="TableOfContents">
            <ul class="treeview">
              <% Set ses = Server.CreateObject("adodb.recordset") %>
              <% ses.open "SELECT * FROM ses order by id desc", conn1, 1, 3 %>
              <% do while not ses.eof %>
                <div class="card card-body lazy2-item loaded" style="float:left; margin-left:10px">
                  <a href="masonry_ses_ekle.asp?id=<%=mas2("id")%>&ses=<%=ses("ses")%>">
                    <%=ses("ses")%>
                    <p style="font-size:.10px"><%=ses("ad")%></p>
                  </a>
                  <audio controls id="myAudio30" style=" width:150px">
                    <source src="../medya/ses/<%=ses("ses")%>" type="audio/mp3">
                  </audio>
                </div>
                <% ses.movenext %>
              <% loop %>
            </ul>
          </nav>
          <script>
            function lazy2Load() {
              var lazy2Items = document.querySelectorAll('.lazy2-item:not(.loaded)');
              for (var i2 = 0; i2 < lazy2Items.length; i2++) {
                lazy2Items[i2].style.display = '';
                lazy2Items[i2].classList.add('loaded');
              }
            }
 
            function filter2() {
              var term2 = document.getElementById('search2').value.toLowerCase();
              var items2 = document.querySelectorAll('.lazy2-item');
              for (var i2 = 0; i2 < items2.length; i2++) {
                var text2 = items2[i2].textContent.toLowerCase();
                if (text2.indexOf(term2) > -1) {
                  items2[i2].style.display = '';
                } else {
                  items2[i2].style.display = 'none';
                }
              }
            }
 
            document.getElementById('search2').addEventListener('input', function() {
              filter2();
              lazy2Load(); 
            });
 
            window.addEventListener('DOMContentLoaded', function() {
              lazy2Load();
            });
          </script>
        </div>
</div>
</div>
</div>
</div>
<!-----------------------------------------------//ses--------------------------------->

  
  
  
  <br> 
<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-youtube" viewBox="0 0 16 16">
  <path d="M8.051 1.999h.089c.822.003 4.987.033 6.11.335a2.01 2.01 0 0 1 1.415 1.42c.101.38.172.883.22 1.402l.01.104.022.26.008.104c.065.914.073 1.77.074 1.957v.075c-.001.194-.01 1.108-.082 2.06l-.008.105-.009.104c-.05.572-.124 1.14-.235 1.558a2.01 2.01 0 0 1-1.415 1.42c-1.16.312-5.569.334-6.18.335h-.142c-.309 0-1.587-.006-2.927-.052l-.17-.006-.087-.004-.171-.007-.171-.007c-1.11-.049-2.167-.128-2.654-.26a2.01 2.01 0 0 1-1.415-1.419c-.111-.417-.185-.986-.235-1.558L.09 9.82l-.008-.104A31 31 0 0 1 0 7.68v-.123c.002-.215.01-.958.064-1.778l.007-.103.003-.052.008-.104.022-.26.01-.104c.048-.519.119-1.023.22-1.402a2.01 2.01 0 0 1 1.415-1.42c.487-.13 1.544-.21 2.654-.26l.17-.007.172-.006.086-.003.171-.007A100 100 0 0 1 7.858 2zM6.4 5.209v4.818l4.157-2.408z"/>
</svg> 
    <label>
    <input name="youtube" type="text" id="youtube" value="<%=mas2("youtube")%>">
    </label> 
    <br>
  <label>
    codepen : <input name="codepen" type="text" id="codepen" value="<%=mas2("codepen")%>">
    </label> 
    <br>
  <label>
     sketchfab : <input name="sketchfab" type="text" id="sketchfab" value="<%=mas2("sketchfab")%>">
    </label> 
    <br>

<!------------------
<!--------------------------------------------kod------------------------------------>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#kodModal"> kod </button>

<div class="modal fade" id="kodModal" tabindex="-1" aria-labelledby="kodModalLabel" aria-hidden="true">
<div class="modal-dialog modal-xl">
<div class="modal-content">
 <div class="modal-body" style="height:450px;"> 

<iframe src="kodeditor.asp?id=<%=mas%>" width="100%" height="300px"></iframe>
</div>
</div>
</div>
</div>
<!-----------------------------------------------//kod-------------------------------->



     <br> 
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
  <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10m0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6"/>
</svg>     lng
     <label>
     <input name="lat" type="text" id="lat" size="1" value="<%=mas2("lat")%>">
     
     </label>
      lat
     <label>
     <input name="lng" type="text" id="lng" size="1" value="<%=mas2("lng")%>">
     
     </label>
        zoom
     <label>
     <input name="zoom" type="text" id="zoom" size="1" value="<%=mas2("zoom")%>">
     
     </label>
  
     <br> 
 
    <label>
 
     
      <br> 
    fiyat:
    <label>
    <input name="fiyat" type="text" id="fiyat" value="<%=mas2("fiyat")%>">
    </label> 
    <br> 
     etsy link:
     <label>
    <input name="etsylink" type="text" id="etsylink" value="<%=mas2("etsylink")%>">
    </label> 
    <br> 
    <input type="hidden" name="canonical" id="canonical" value="<%=ilk_kat("canonical")%>">
    <label>
    <input type="submit" name="button4" id="button4" value="yenile">
    </label>
  </form>
 
 <%else%>  <%set katoku= Server.CreateObject("adodb.recordset")%>
<%katoku.open"select*from kategori where id="&gelen&"",conn1,1,3%>
573 - <a href="medya_dosya.asp" target="_blank">medya obje</a> | <%=katoku("canonical")%>/ <a href="../<%=katoku("canonical")%>/" target="_blank">incele</a> | yayin : <%=katoku("yayin")%> <%if katoku("yayin")=1 then%><a href="yayin_iptal.asp?canonical=<%=ilk_kat("canonical")%>">yayin iptal</a><%end if%>
<div id="topClick">Yenile 2 Butonunu Tetikle</div>

<%if gelen>0 then%>

    
    <h1 id="content"><%=katoku("baslik")%></h1>
    <p><%=katoku("detay")%></p>

<div class="okutam row" data-masonry='{"percentPosition": true }'><%set masoku= Server.CreateObject("adodb.recordset")%><%masoku.open"select*from masonry where kat="&gelen&" order by sira asc",conn1,1,3%><%sirano=1%> &lt;!--#include file="../mainilk.asp"--><%do while not masoku.eof%><div class="col-sm-6 col-lg-6 mb-6" style="padding:1%"> <div class="card "> <div class="card-body"> <h2 class="card-title"><%=masoku("h2")%></h2> <p class="card-text">  <%=masoku("p2")%></p> <%if not masoku("resim")="" then%> <img class="card p-3" src="../medya/resim/<%=masoku("resim")%>" alt="<%=masoku("p2")%>" style="width:100%; height:100%"> <%end if%><%if not masoku("ses")="" then%> <div class="player"> <audio controls=""> <source src="../medya/ses/<%=masoku("ses")%>"> </audio> </div> <%end if%><%if not masoku("youtube")="" then%><div class="video-wrapper" style="position: relative;"><a href="https://www.youtube.com/watch?v=<%=masoku("youtube")%>" target="_blank" style="display: block; max-width: 100%; max-height: 100%;"><img src="https://img.youtube.com/vi/<%=masoku("youtube")%>/maxresdefault.jpg" alt="<%=masoku("h3")%>" style="object-fit: contain; width: 100%;"><img src="../ytpng.png" alt="Play Button" class="youtube"></a></div><%end if%><%if not masoku("codepen")="" then%><div class="card" style="width: 100%; height:350px;"><iframe  style="width: 100%; height:350px" scrolling="no" title="<%=masoku("h3")%>" src="https://codepen.io/Okan-Kaplan/embed/<%=masoku("codepen")%>?default-tab=html%2Cresult" frameborder="no" loading="lazy" allowtransparency="true" allowfullscreen="true"></iframe></div><%end if%><%if not masoku("sketchfab")="" then%><div class="card" style="width: 100%; height:350px;"><iframe style="width:100%;height:350px"  title="<%=masoku("h2")%>" frameborder="0" allowfullscreen mozallowfullscreen="true" webkitallowfullscreen="true" allow="autoplay; fullscreen; xr-spatial-tracking" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src="https://sketchfab.com/models/<%=masoku("sketchfab")%>/embed"> </iframe> </div><%end if%><%if not masoku("lat")="" then%> <% dim latValue%><%latValue = masoku("lat")%><%dim decimallatValue%><%decimallatValue = CDbl(Replace(latValue, ",", "."))%><%dim latresult%><%latresult = decimallatValue/10000 - 0.005%><%lat2 = Replace(FormatNumber(latresult, 4, vbTrue, vbFalse, vbFalse), ",", ".")%><%dim lngValue%><%lngValue = masoku("lng")%><%dim decimallngValue%><%decimallngValue = CDbl(Replace(lngValue, ",", "."))%><%dim lngresult%><%lngresult = decimallngValue/10000 - 0.005%><%lng2 = Replace(FormatNumber(lngresult, 4, vbTrue, vbFalse, vbFalse), ",", ".")%> <div class="video-wrapper"> <embed src="https://www.openstreetmap.org/export/embed.html?bbox=<%=masoku("lat")%>%2C<%=masoku("lng")%>%2C<%=lat2%>%2C<%=lng2%>&amp;layer=mapnik" width="100%" height="100%" frameborder="0"></embed></div><%end if%><%if not masoku("kod")="" then%> <style>.kod-blok { overflow: auto;max-height: 400px;}</style><div class="kod-blok"><pre><code><textarea class="form-control" style="width:100%; height:300px"><%=masoku("kod")%></textarea></code></pre></div><%end if%><h3 class="card-title"><%=masoku("h3")%></h3><p class="card-text"><%=masoku("p3")%></p></div><p class="card-text" style="padding-left:5px"><a href="../tag.asp?tag=<%=masoku("tur")%>"><span class="badge bg-danger"><%=masoku("tur")%></span></a> <%if not masoku("etiket")="" then%> <% etiket = masoku("etiket") %><%Dim etiketlerArray, sira%><%etiketlerArray = Split(etiket, ",")%><%For sira = LBound(etiketlerArray) To UBound(etiketlerArray)%><a href="../tag.asp?tag=<%= Trim(etiketlerArray(sira)) %>"><span class="badge bg-danger"> <%= Trim(etiketlerArray(sira)) %> </span></a> <%Next%><%end if%></p><%if not masoku("fiyat")="" then%><span class=" badge rounded-pill  " style=" float: right; font-size:30px ;margin:10px; background-color:#F1641E"> <a href="<%=masoku("etsylink")%>" target="_blank" style="text-decoration:none; color:#FFFFFF;font-size:40px"><%=masoku("fiyat")%></a> <span style=" position:absolute;float:right ; margin-left:20px; margin-top:-45px"><a href="<%=masoku("etsylink")%>" target="_blank" style="text-decoration:none; color:#FFFFFF"><svg version="1.0" xmlns="http://www.w3.org/2000/svg"  width="40.000000pt" height="40.000000pt" viewBox="0 0 2048.000000 2048.000000" preserveAspectRatio="xMidYMid meet"> <g transform="translate(0.000000,2048.000000) scale(0.100000,-0.100000)" fill="#fff" stroke="none"> <path d="M10510 18494 c-355 -16 -672 -38 -928 -64 -1872 -194 -3554 -761 -4872 -1640 -905 -604 -1637 -1409 -2065 -2269 -345 -694 -560 -1470 -679 -2451 -46 -374 -113 -1226 -102 -1283 4 -21 -1 -44 -16 -76 -23 -46 -23 -51 -26 -541 -10 -1545 79 -2508 309 -3317 313 -1104 877 -2032 1694 -2787 781 -721 1768 -1267 2945 -1630 367 -113 843 -224 1250 -291 327 -54 384 -62 695 -95 555 -59 1380 -72 1900 -30 293 24 679 65 830 90 33 5 105 17 160 25 564 89 1114 225 1685 414 255 85 711 260 883 340 45 21 120 55 167 76 133 59 473 235 652 336 948 538 1710 1176 2286 1916 847 1089 1359 2454 1501 4008 49 537 49 1241 0 1780 -17 191 -51 489 -69 605 -117 750 -250 1316 -455 1927 -498 1482 -1338 2687 -2460 3528 -1126 844 -2499 1303 -4230 1416 -158 10 -910 20 -1055 13z m1170 -398 c930 -78 1644 -233 2410 -524 265 -101 646 -281 891 -422 691 -396 1323 -961 1825 -1630 379 -504 679 -1042 929 -1665 302 -751 529 -1653 634 -2515 6 -47 15 -123 21 -170 36 -304 65 -933 56 -1230 -17 -542 -45 -847 -122 -1319 -242 -1481 -883 -2779 -1849 -3746 -794 -795 -1885 -1462 -3100 -1897 -77 -27 -151 -54 -165 -58 -321 -103 -472 -148 -680 -201 -482 -124 -979 -216 -1445 -268 -230 -26 -295 -32 -520 -47 -336 -24 -1112 -24 -1425 -1 -994 75 -1816 237 -2630 519 -1035 359 -1935 919 -2640 1644 -914 940 -1401 2032 -1574 3529 -58 497 -83 1005 -92 1901 -7 604 -6 665 9 703 17 40 23 101 47 441 78 1091 214 1873 442 2545 378 1117 1195 2127 2313 2861 513 337 1067 610 1740 859 476 175 1087 345 1635 454 58 12 139 28 180 36 503 101 1312 196 1865 219 213 9 1071 -4 1245 -18z"/> <path d="M6770 13773 c-588 -25 -1098 -35 -1499 -30 -488 6 -480 7 -528 -45 -93 -99 -57 -274 70 -340 36 -18 68 -22 217 -29 96 -4 176 -8 178 -8 1 -1 -1 -103 -4 -228 -9 -331 12 -609 96 -1303 17 -135 35 -281 40 -325 22 -180 40 -402 50 -615 12 -242 5 -427 -40 -1015 -22 -288 -30 -714 -17 -880 l8 -100 -118 -18 c-107 -15 -303 -60 -393 -88 -146 -47 -185 -213 -78 -334 53 -60 96 -71 313 -85 99 -6 199 -13 223 -15 24 -3 63 0 88 5 48 11 60 7 159 -54 70 -43 135 -46 214 -11 61 28 63 28 204 21 78 -3 594 -10 1147 -16 634 -6 1120 -15 1318 -25 359 -18 373 -16 438 49 45 45 64 93 64 166 0 99 -129 749 -167 840 -31 76 -101 119 -194 120 -101 0 -176 -58 -201 -158 -7 -29 -19 -49 -37 -59 -14 -9 -51 -41 -81 -72 -31 -31 -72 -69 -93 -84 -105 -79 -114 -245 -18 -335 l36 -33 -285 5 c-157 3 -582 8 -945 11 -810 6 -1100 14 -1120 29 -8 6 -21 47 -29 91 -53 284 -48 720 14 1380 6 55 12 170 16 255 7 213 4 203 62 196 26 -4 115 -11 197 -16 83 -5 319 -21 525 -35 206 -14 438 -29 515 -34 137 -9 140 -10 160 -37 46 -64 99 -114 132 -125 46 -15 109 -4 155 26 27 18 51 25 87 25 51 0 86 11 131 41 14 9 45 19 70 23 98 15 162 90 179 211 18 128 -21 213 -117 255 -24 11 -57 31 -73 44 -15 13 -51 32 -79 41 -33 11 -50 22 -50 33 0 36 -22 93 -47 122 -36 44 -78 63 -153 71 -36 4 -88 11 -116 14 -69 10 -117 -8 -169 -59 -50 -50 -75 -116 -75 -197 0 -32 -5 -61 -10 -64 -10 -6 -142 1 -475 25 -364 26 -436 31 -634 45 -118 9 -217 17 -219 19 -2 2 -10 66 -17 143 -13 124 -53 450 -75 608 -65 469 -89 713 -97 970 -6 223 3 502 17 524 5 9 91 15 321 21 173 5 438 14 589 19 444 16 872 21 1060 13 l175 -7 -1 -60 c0 -33 -2 -98 -4 -145 -5 -131 31 -187 138 -214 46 -12 47 -14 53 -58 16 -109 84 -168 196 -168 73 0 130 26 171 76 35 43 46 84 62 249 16 163 41 287 80 401 27 78 26 128 -5 180 -26 44 -85 87 -145 104 -49 14 -294 38 -500 50 -162 9 -878 11 -1060 3z"/> <path d="M9906 13170 c-86 -43 -111 -89 -125 -233 -9 -92 -15 -113 -37 -143 -15 -19 -43 -84 -64 -144 -49 -145 -109 -246 -203 -347 -124 -130 -248 -204 -450 -268 -71 -22 -131 -48 -149 -63 -90 -76 -90 -248 0 -324 55 -46 209 -68 547 -77 l240 -6 0 -85 c-1 -47 -7 -222 -14 -390 -20 -465 -1 -1355 35 -1650 45 -362 152 -616 336 -797 91 -90 136 -122 246 -178 176 -87 351 -125 622 -132 353 -10 670 44 844 142 138 78 211 155 258 274 33 84 31 238 -5 341 -21 58 -27 94 -27 158 0 52 -5 93 -14 110 -20 38 -65 78 -108 96 -46 20 -138 21 -182 2 -33 -14 -96 -81 -96 -102 0 -7 -21 -22 -46 -34 -68 -34 -116 -117 -144 -255 -7 -33 -23 -82 -37 -109 -21 -41 -24 -60 -21 -115 l3 -66 -40 -6 c-22 -4 -116 -10 -210 -14 -378 -15 -594 42 -749 199 -105 105 -160 222 -190 405 -21 124 -24 177 -46 681 -24 540 -25 868 -5 1235 8 149 15 278 15 288 0 25 29 33 175 46 72 7 175 17 230 22 55 5 212 18 348 28 240 19 251 20 295 48 142 88 113 316 -47 367 -25 8 -120 22 -211 31 -91 9 -226 23 -300 31 -74 7 -204 17 -287 20 l-153 7 0 26 c0 30 35 464 50 621 23 240 9 306 -73 355 -56 32 -151 34 -211 5z"/> <path d="M16771 11878 c-18 -5 -54 -31 -80 -57 l-46 -48 -90 -6 c-224 -17 -351 -71 -391 -164 -20 -47 -18 -137 5 -181 41 -79 98 -110 221 -119 101 -7 103 -9 76 -80 -8 -21 -36 -99 -61 -173 -247 -720 -591 -1608 -621 -1604 -11 2 -194 369 -316 634 -270 584 -426 1076 -390 1231 7 28 12 108 12 178 0 123 -1 129 -29 173 -42 66 -89 85 -238 98 -68 6 -173 12 -235 13 -97 2 -118 -1 -146 -18 -75 -45 -117 -160 -92 -250 16 -56 72 -118 116 -129 16 -4 45 -23 64 -41 19 -19 53 -40 75 -47 l40 -13 7 -80 c33 -376 239 -918 708 -1857 84 -167 163 -317 176 -335 13 -17 24 -35 24 -39 0 -13 -193 -361 -292 -523 -340 -564 -753 -1031 -1174 -1324 -87 -60 -114 -68 -289 -82 -271 -21 -395 -61 -509 -166 -84 -76 -127 -172 -133 -293 -5 -85 -3 -94 24 -146 56 -106 155 -138 288 -92 206 70 413 164 614 280 69 40 131 72 139 72 7 0 48 14 90 32 87 36 156 93 172 143 8 24 42 61 113 122 678 585 1240 1461 1745 2720 115 285 282 730 332 883 4 14 45 131 90 260 45 129 97 280 116 335 19 55 40 105 47 111 7 6 59 16 117 23 136 16 177 28 215 67 67 67 67 173 1 265 -39 52 -90 80 -159 87 -42 4 -49 8 -61 36 -17 42 -77 92 -123 105 -46 13 -106 13 -152 -1z"/> <path d="M13495 11679 c-47 -20 -73 -21 -380 -23 -264 -2 -347 -6 -418 -20 -419 -82 -643 -254 -688 -528 -52 -313 223 -737 601 -928 168 -85 305 -115 675 -149 255 -24 348 -42 441 -86 112 -54 172 -133 220 -290 26 -84 27 -103 28 -280 1 -153 -2 -201 -16 -245 -39 -126 -118 -199 -320 -295 -366 -174 -689 -208 -845 -89 -57 44 -60 59 -25 171 78 252 100 353 88 415 -22 117 -190 177 -318 113 -33 -16 -66 -25 -98 -25 -60 0 -96 -13 -133 -48 -48 -45 -70 -100 -70 -167 1 -68 17 -114 72 -200 l39 -60 -13 -71 c-63 -363 330 -653 822 -604 156 15 305 49 458 102 540 187 753 428 795 899 27 311 -67 677 -220 857 -96 112 -254 205 -424 247 -121 31 -163 37 -434 69 -353 42 -493 79 -617 162 -164 108 -285 289 -285 424 0 44 4 52 33 73 111 84 266 114 629 124 l237 6 38 -25 c21 -14 55 -30 75 -37 l37 -12 -7 -67 c-4 -37 -7 -121 -7 -187 0 -110 2 -123 24 -153 72 -101 227 -121 310 -40 55 54 70 100 80 252 10 150 5 188 -34 235 -32 37 -31 41 6 77 97 91 68 257 -56 321 -16 9 -48 30 -70 48 -73 59 -144 69 -230 34z"/> </g></svg></a></span></span><%end if%><span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger" style="margin-left:-50px; margin-top:5px; font-size:18px"><%=sirano%></span></div></div><%sirano=sirano+1%><%masoku.movenext%><%loop%>&lt;!--#include file="../mainson.asp"--></div><%end if%>
 
 

 </div>
 
 
<div class="bd-toc mt-4 mb-5 my-md-0 ps-xl-3 mb-lg-5 text-muted" style="width:350px; background-color:#FFFFFF"> 
 
<%if not ilk_kat.eof then%>
523-kategori_guncelle.asp

<form name="form2" method="post" action="kategori_guncelle.asp">
<input name="id" type="hidden" id="id" value="<%=ilk_kat("id")%>">
title : <label><input name="title" type="text" id="title" value="<%=ilk_kat("title")%>"></label>
<br>
descr:  <label><input name="descr" type="text" id="descr" value="<%=ilk_kat("descr")%>"></label>
<br>
etiket:  <label><input name="etiket" type="text" id="etiket" value="<%=ilk_kat("etiket")%>"></label>
<br>
h1: <label><input name="baslik" type="text" id="baslik" value="<%=ilk_kat("baslik")%>"></label>
<br>p: <label><input name="detay" type="text" id="detay" value="<%=ilk_kat("detay")%>">
</label>
<br><img src="../medya/resim/<%=ilk_kat("resim")%>" width="90"><input name="resim" type="hidden" id="resim" value="<%=ilk_kat("resim")%>"> <span data-bs-toggle="modal" data-bs-target="#resimmetamodal"> > resim sec</span>  483
<br>
<input type="hidden" name="canonical" id="canonical" value="<%=ilk_kat("canonical")%>">

<label><input type="submit" name="button3" id="button3" value="yenile"> </label>
      </form>
        <%end if%><p>
<a href="?geri=<%=geri%>&gelen=<%=gelen%>&mas=0">  <span <%if mas=0 then%>class="badge bg-danger"<%end if%>>  incele </span></a> 383
<p>anasayfada listelensin + sorular + not defteri + link verme </p>
 
<p>yorum paylasim footer navlink</p>
<p><a href="masonry.asp" target="_blank">615 masonry kutuphane</a></p>
<p>
617. <a href="masonry_ekle.asp?canonical=<%=ilk_kat("canonical")%>&id=<%=gelen%>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-folder-plus" viewBox="0 0 16 16" style="width:30px; height:30px"> <path d="m.5 3 .04.87a2 2 0 0 0-.342 1.311l.637 7A2 2 0 0 0 2.826 14H9v-1H2.826a1 1 0 0 1-.995-.91l-.637-7A1 1 0 0 1 2.19 4h11.62a1 1 0 0 1 .996 1.09L14.54 8h1.005l.256-2.819A2 2 0 0 0 13.81 3H9.828a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 6.172 1H2.5a2 2 0 0 0-2 2m5.672-1a1 1 0 0 1 .707.293L7.586 3H2.19q-.362.002-.683.12L1.5 2.98a1 1 0 0 1 1-.98z"/> <path d="M13.5 9a.5.5 0 0 1 .5.5V11h1.5a.5.5 0 1 1 0 1H14v1.5a.5.5 0 1 1-1 0V12h-1.5a.5.5 0 0 1 0-1H13V9.5a.5.5 0 0 1 .5-.5"/> </svg></a> 

<%set mas1= Server.CreateObject("adodb.recordset")%>
<%mas1.open"select*from masonry where kat="&gelen&" order by sira asc",conn1,1,3%>
<%do while not mas1.eof%>

<div> 

<form name="form3" method="post" action="masonry_sira_yenile.asp">
626.<a href="?geri=<%=geri%>&gelen=<%=gelen%>&mas=<%=mas1("id")%>"><span <%if mas-mas1("id")=0 then%>class="badge bg-danger"<%end if%>> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16" style="width:30px;height:30px"> <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/><path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z"/>
</svg></span></a> 


   <input name="sira" type="text" id="sira" value="<%=mas1("sira")%>" size="1">
    <input name="tur" type="text" id="tur" value="<%=mas1("tur")%>" size="5">

    <input name="id" type="hidden" id="id" value="<%=mas1("id")%>" size="1">
    <label>
    <input type="submit" name="button2" id="button2" value="+">
    </label>
<span style="float:right">

<a href="anasayfa_yayin.asp?id=<%=mas1("id")%>&yayin=<%=mas1("anasayfa")%>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-add" viewBox="0 0 16 16" style="width:30px;height:30px; background-color: <%if not mas1("anasayfa")=1 then%>#FF0000<%else%>#009900<%end if%>; color: #fff"> <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h4a.5.5 0 1 0 0-1h-4a.5.5 0 0 1-.5-.5V7.207l5-5 6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z"/> <path d="M16 12.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0m-3.5-2a.5.5 0 0 0-.5.5v1h-1a.5.5 0 0 0 0 1h1v1a.5.5 0 1 0 1 0v-1h1a.5.5 0 1 0 0-1h-1v-1a.5.5 0 0 0-.5-.5"/> </svg></a>

<a href="masonry_sil.asp?canonical=<%=ilk_kat("canonical")%>&id=<%=mas1("id")%>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16" style="width:30px;height:30px"> <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/> <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/> </svg></a> 



<%if not mas1.eof then%>
<%if not mas1("h2")=" " and  not mas1("p2")="" then%> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16"><path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783"/>
</svg> <%end if%><%end if%>
</span></form> 
</div>
<%mas1.movenext%>
<%loop%>
    </div>
 </main>
</div>


 
 <%if gelen>0 then%>
<!-- resimmetamdal -->
<div class="modal fade" id="resimmetamodal" tabindex="-1" aria-labelledby="resimmetamodalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl">
    <div class="modal-content" style="height:600px">
      <div class="modal-header">
        <h5 class="modal-title" id="resimmetamodalLabel">735 resimmeta sec</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="overflow-auto modal-body" style="height:400px">
          <input type="search" id="search3" placeholder="Search" class="form-control sticky-sm-top" style="position:fixed; top:50px;width:20%">
          <nav id="TableOfContents">
            <ul class="treeview">
              <% Set resimkat = Server.CreateObject("adodb.recordset") %>
              <% resimkat.open "SELECT * FROM resim order by id desc", conn1, 1, 3 %>
              <% do while not resimkat.eof %>
                <div class="lazy3-item loaded" style="float:left">
                  <a href="masonry_resimkat_ekle.asp?id=<%=ilk_kat("id")%>&resim=<%=resimkat("resim")%>">
                    <img src="../medya/resim/<%=resimkat("resim")%>" height="100" style="margin:5px">
                    <p style="font-size:.10px"><%=resimkat("ad")%></p>
                  </a>
                  <p style="font-size:16px"><%=resimkat("resim")%></p>
                </div>
                <% resimkat.movenext %>
              <% loop %>
            </ul>
          </nav>
          <script>
            function lazy3Load() {
              var lazy3Items = document.querySelectorAll('.lazy3-item:not(.loaded)');
              for (var i3 = 0; i3 < lazy3Items.length; i3++) {
                lazy3Items[i3].style.display = '';
                lazy3Items[i3].classList.add('loaded');
              }
            }
 
            function filter3() {
              var term3 = document.getElementById('search3').value.toLowerCase();
              var items3 = document.querySelectorAll('.lazy3-item');
              for (var i3 = 0; i3 < items3.length; i3++) {
                var text3 = items3[i3].textContent.toLowerCase();
                if (text3.indexOf(term3) > -1) {
                  items3[i3].style.display = '';
                } else {
                  items3[i3].style.display = 'none';
                }
              }
            }
 
            document.getElementById('search3').addEventListener('input', function() {
              filter3();
              lazy3Load(); 
            });
 
            window.addEventListener('DOMContentLoaded', function() {
              lazy3Load();
            });
          </script>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- //resimmetamdal -->
<%end if%>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
 
<script src="https://getbootstrap.com/docs/5.2/dist/js/bootstrap.bundle.min.js"></script>
 
<%=ilk_kat("id")%> / <%=ilk_kat("canonical")%> 
<form accept-charset="UTF-8"  method="post" action="sayfa_yayinla.asp" target="_blank">
  <input type="hidden" name="id" id="id" value="<%=ilk_kat("id")%> " >
    <input type="hidden" name="canonical" id="canonical" value="<%=ilk_kat("canonical")%> " >
<textarea id="headKodlari"  name="headKodlari" rows="1" style="width:100%">zzzz gggg &lt;!DOCTYPE html>&lt;html lang="tr">&lt;head itemscope itemtype="http://schema.org/WebSite">&lt;meta http-equiv="Content-Type" content="text/html; charset=UTF-8">&lt;meta name="viewport" content="width=device-width, initial-scale=1">&lt;title itemprop="name"><%=ilk_kat("title")%>&lt;/title>&lt;meta name="description" itemprop="description" content="<%=ilk_kat("descr")%>">&lt;meta name="keywords" content="<%=ilk_kat("etiket")%>">&lt;meta name="author" content="<%=rsedt("author")%>">&lt;link rel="canonical" href="<%=rsedt("site_adresi")%><%=ilk_kat("canonical")%>/"/>&lt;meta property="og:type" content="article">&lt;meta property="og:site_name" content="<%=rsedt("site_adresi")%><%=ilk_kat("canonical")%>">&lt;meta property="og:url" content="<%=rsedt("site_adresi")%><%=ilk_kat("canonical")%>/">&lt;meta property="og:title" content="<%=ilk_kat("title")%>">&lt;meta property="og:description" content="<%=ilk_kat("descr")%>">&lt;meta property="og:image" content="<%=rsedt("site_adresi")%>medya/resim/<%=ilk_kat("resim")%>">&lt;meta property="og:image:width" content="1280">&lt;meta property="og:image:height" content="720">&lt;meta name="title" content="<%=ilk_kat("title")%>">&lt;meta name="url" content="<%=rsedt("site_adresi")%><%=ilk_kat("canonical")%>/">&lt;meta name="articleSection" content="Haber">&lt;meta name="articleSection" content="Video">&lt;link rel="alternate" type="application/rss+xml" href="<%=rsedt("site_adresi")%>rss.html"/>&lt;meta name="robots" content="max-snippet:-1, max-image-preview:large, max-video-preview:-1">&lt;link rel="manifest" href="<%=rsedt("site_adresi")%>manifest.json"/>&lt;link rel="icon" href="<%=rsedt("site_adresi")%>favicons/favicon.ico"/>&lt;meta name="generator" content="canvasorNet">&lt;link rel="apple-touch-icon" sizes="180x180" href="<%=rsedt("site_adresi")%>favicons/apple-touch-icon.png"/>&lt;link rel="icon" type="image/png" sizes="32x32" href="<%=rsedt("site_adresi")%>favicons/favicon-32x32.png"/>&lt;link rel="icon" type="image/png" sizes="16x16" href="<%=rsedt("site_adresi")%>favicons/favicon-16x16.png"/>&lt;link rel="mask-icon" href="<%=rsedt("site_adresi")%>favicons/safari-pinned-tab.svg" color="#aa0000"/>&lt;link rel="shortcut icon" href="<%=rsedt("site_adresi")%>favicons/favicon.ico"/>&lt;meta name="google-site-verification" content="<%=rsedt("google_kod")%>">&lt;meta name="p:domain_verify" content="">&lt;link href="https://getbootstrap.com/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet">&lt;link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">&lt;link href="https://fonts.googleapis.com/css2?family=Grandstander:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet"> &lt;meta name="theme-color" content="#712cf9">&lt;style>body {font-family: "Grandstander", cursive;font-weight:auto;font-style: normal;}.youtube{position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width:200px}.video-wrapper {position: relative;padding-bottom: 57.25%; margin: 1%;  height: 0;overflow: hidden;}iframe,object,embed,video,.videoWrapper,.video-js {position: absolute;top: 0;left: 0;width: 100%;height: 100%;}.video-js,img.vjs-poster {width: 100% !important;height: 100% !important;}.bd-placeholder-img {font-size: 1.125rem;text-anchor: middle;-webkit-user-select: none;-moz-user-select: none;user-select: none;}@media (min-width: 768px) {.bd-placeholder-img-lg {font-size: 3.5rem;}}.player {position: relative;width: 100%;}.player .imgbx {position: relative;width: 100%;height: 350px;}.player .imgbx img {position: absolute;top: 0;left: 0;width: 100%;height: 100%;object-fit: cover;}.player audio {width: 100%;outline: none;}&lt;/style>&lt!--#include file="../headnot.asp"-->&lt;/head>&lt;body>&lt;div class="mt-3 my-md-4 bd-layout">&lt;aside class="bd-sidebar">&lt!--#include file="../leftnot.asp"-->&lt;/aside>&lt;main class="bd-main" style="margin-top:50px; padding:1%">&lt;div>&lt;h1 id="content"><%=ilk_kat("baslik")%>&lt;/h1>&lt;p><%=ilk_kat("detay")%>&lt;/p><%if not katoku("etiket")="" then%>&lt;span style="float:right; margin-top:-20px"><%Dim etiketx%><%etiketx =  katoku("etiket")%><%Dim etiketlerArrayx%><%etiketlerArrayx = Split(etiketx, ",")%><%Dim ix%><%For ix = LBound(etiketlerArrayx) To UBound(etiketlerArrayx)%> &lt;a href="../tag.asp?tag=<%= Trim(etiketlerArrayx(ix)) %>"> &lt;span class="badge bg-danger"><%= Trim(etiketlerArrayx(ix)) %>&lt;/span>&lt;/a> <%Next%><%end if%>&lt;/span><%end if%><hr style="color:#FFFFFF">&lt;div class="okutam row" data-masonry='{"percentPosition": true }'></textarea>
 
<textarea id="mainKodlari"  name="mainKodlari" rows="1" style="width:100%"></textarea>
 
 
<textarea id="footerKodlari"  name="footerKodlari" rows="1" style="width:100%">&lt;/div>&lt;/div>&lt;div class="bd-toc mt-4 mb-5 my-md-0 ps-xl-3 mb-lg-5 text-muted">&lt!--#include file="../rightnot.asp"-->&lt;/div>&lt!--#include file="../navbar.asp"-->&lt;/div>&lt;/main>&lt;/div>&lt;button class="btn btn-secondary" onClick="scrollToTop()" id="scrollToTopBtn" title="Başa Dön" style="position: fixed; bottom: 0; right: 0; float: right;">&lt;svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-arrow-up-circle-fill" viewBox="0 0 16 16">&lt;path d="M16 8A8 8 0 1 0 0 8a8 8 0 0 0 16 0m-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707z">&lt;/path>&lt;/svg>&lt;/button>&lt;!--#include file="../footer.asp"-->&lt;script>function scrollToTop() {window.scrollTo({top: 0,behavior: "smooth"});}window.onscroll = function() {scrollFunction();};function scrollFunction() {var scrollToTopBtn = document.getElementById("scrollToTopBtn");if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {scrollToTopBtn.style.display = "block";} else {scrollToTopBtn.style.display = "none";}}&lt;/script>&lt;script src="<%=rsedt("site_adresi")%>js/masonry.js">&lt;/script>&lt;script src="https://getbootstrap.com/docs/5.2/dist/js/bootstrap.bundle.min.js">&lt;/script>&lt;/body>&lt;/html></textarea>


 
 
<input type="submit" name="button5" id="button5" value="yenile2"> 
 
</form> 
<script>
    // Main içindeki HTML kodlarını al ve textarea içine yerleştir
    window.onload = function() {
        var mainIcerik = document.querySelector('.okutam').innerHTML;
        // Remove style properties related to position
        mainIcerik = mainIcerik.replace(/style="[^"]*position:\s*absolute;[^"]*"/g, '');
		
        document.getElementById('mainKodlari').value = mainIcerik;
    };
</script>
 
<script>
  document.getElementById("topClick").addEventListener("click", function() {
    document.getElementById("button5").click();
  });
</script>
<script src="https://getbootstrap.com/docs/5.2/dist/js/bootstrap.bundle.min.js"></script>


 

<script src="https://getbootstrap.com/docs/5.2/assets/js/docs.min.js"></script>
</body>
</html>
 