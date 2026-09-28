 

<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
  <div class="container-fluid">

    <span data-bs-toggle="offcanvas" href="#offcanvasExample" role="button" aria-controls="offcanvasExample" style="margin:5px; padding-right:8px">
     <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0z"/>
  <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"/>
</svg>   </span>

    <a class="navbar-brand" href="yp.asp"> Canvasor </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>    </button>
      
        <%set nav1= Server.CreateObject("adodb.recordset")%>
<%nav1.open"select*from menu where gelen=0 order by sira asc",conn,1,3%>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
         
<%do while not nav1.eof%>
<%set nav2= Server.CreateObject("adodb.recordset")%>
<%nav2.open"select*from menu where gelen="&nav1("id")&" order by sira asc",conn,1,3%>            

<li class="nav-item dropdown">
<a href="#"  class="nav-link <%if not nav2.eof then%>dropdown-toggle<%end if%>" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
<%=nav1("menu")%>         </a>
            
   
            
            <%if not nav2.eof then%>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
          
          <%do while not nav2.eof%>
            <li><a  href="?id=<%=nav2("id")%>" class="dropdown-item" ><%=nav2("menu")%></a></li>
        <%nav2.movenext%>
<%loop%>
          </ul>
          <%end if%>
        </li>
<%nav1.movenext%>
<%loop%>
      
      </ul>
    </div>
    
  <span  data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">  <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-box-arrow-in-left" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10 3.5a.5.5 0 0 0-.5-.5h-8a.5.5 0 0 0-.5.5v9a.5.5 0 0 0 .5.5h8a.5.5 0 0 0 .5-.5v-2a.5.5 0 0 1 1 0v2A1.5 1.5 0 0 1 9.5 14h-8A1.5 1.5 0 0 1 0 12.5v-9A1.5 1.5 0 0 1 1.5 2h8A1.5 1.5 0 0 1 11 3.5v2a.5.5 0 0 1-1 0z"/>
  <path fill-rule="evenodd" d="M4.146 8.354a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H14.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708z"/>
</svg></span>




  </div>
</nav> 