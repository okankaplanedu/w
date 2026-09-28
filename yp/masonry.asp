<%mas=request("mas")%>
	<%if mas="" then%><%mas=0%> <%end if%> 
<!doctype html>
<html><head>
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
    padding-bottom:57.25%; 
    margin: 1%;  
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
 
<header class="navbar navbar-expand-lg navbar-dark bd-navbar sticky-top" style="z-index:1">
120 - <a href=""> editor</a>  - <a href=""> moduller</a>   -   <a href=""> kategori</a>
</header>

<div class="mt-3 my-md-4 bd-layout">


<aside class="bd-sidebar" style="width:300px"> 99
	
<form name="form4" method="post" action="">
h2:<input name="h2" type="text" id="h2"> <br>
 p2:<textarea name="p2" id="p2"></textarea><br> 
h3:<input name="h3" type="text" id="h3"><br>
p3:<textarea name="p3" id="p3"> </textarea> <br>
 etiket:<input name="etiket" type="text" id="etiket"><br>
resim:<input name="resim" type="text" id="resim" > <br>
ses:<input name="ses" type="hidden" id="ses" > <br>
 youtube:<input name="youtube" type="text" id="youtube"><br>
codepen:<input name="codepen" type="text" id="codepen"><br>
 sketchfab:<input name="sketchfab" type="text" id="sketchfab"><br>
 lat:<input name="lat" type="text" id="lat" size="1"><br>
long: <input name="lng" type="text" id="lng" size="1"><br>
zoom:<input name="zoom" type="text" id="zoom" size="1"><br>
fiyat:<input name="fiyat" type="text" id="fiyat"><br>
 etsy:<input name="etsylink" type="text" id="etsylink"><br>
 canonical:<input type="text" name="canonical" id="canonical"><br>
 <input type="submit" name="button4" id="button4" value="yeni mas">
     
  </form>
 
	
	
	</aside> 


<main class="bd-main">
<div>
 
 

<div class="okutam row" data-masonry="{"&quot;"percentPosition"&quot;": true }"> 
	 
	
	<%if mas=0 then%>
		136 : mas 0 --- tüm maslar
		<%else%> 
			138: mas not 0 -- seçilen mas
			<%end if%> 
		
		
	 
	
	
	</div>
 
 

 </div>
 
 
<div class="bd-toc mt-4 mb-5 my-md-0 ps-xl-3 mb-lg-5 text-muted" style="width:350px; background-color:#FFFFFF"> 
 
 162
</div>
<!-- //resimmetamdal -->

<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async=""></script>
 
<script src="https://getbootstrap.com/docs/5.2/dist/js/bootstrap.bundle.min.js"></script>
 
 </body></html>