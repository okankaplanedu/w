<%if session("oki")= "tamam" and  session("okiho")= day(now) then%>



<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasExampleLabel"><a href="yp.asp">Canvasor</a></h5>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <div id="selectedService">
    
    
    <%if not id="" then%>
    
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-left-short" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M12 8a.5.5 0 0 1-.5.5H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5a.5.5 0 0 1 .5.5"/>
</svg>
 <%set mxg= Server.CreateObject("adodb.recordset")%>
<%mxg.open"select*from menu where id="&id&"",conn,1,3%> 
 <%set mxg2= Server.CreateObject("adodb.recordset")%>
<%mxg2.open"select*from menu where id="&mxg("gelen")&"",conn,1,3%> 
<%if not mxg2.eof then%><%if mxg2("gelen")>0 then%><a href="?id=<%=mxg2("id")%>"><%end if%><%=mxg2("menu")%><%if mxg2("gelen")>0 then%></a><%end if%><%end if%>
<hr>
 <%set mx1= Server.CreateObject("adodb.recordset")%>
<%mx1.open"select*from menu where id="&id&"",conn,1,3%> 
 <%=mx1("menu")%> 
<span style="float:right"><a href="editor.asp?id=<%=id%>" target="_blank">editor</a>  </span>
<%else%>
index<span style="float:right"><a href="editor.asp" target="_blank">editor</a>
 <%end if%>
    </div>
    <div class="dropdown mt-3">
       <%if not id="" then%>
      <nav id="TableOfContents">
        <ul>
<%set mx2= Server.CreateObject("adodb.recordset")%>
<%mx2.open"select*from menu where gelen="&id&"",conn,1,3%> 
<%do while not mx2.eof%>
          <li><a href="?id=<%=mx2("id")%>"><%=mx2("menu")%></a><span style="float:right"><a href="editor.asp?id=<%=mx2("id")%>" target="_blank">editor</a>
        </span>
           
            <ul>
            <%set mx3= Server.CreateObject("adodb.recordset")%>
<%mx3.open"select*from menu where gelen="&mx2("id")&"",conn,1,3%> 
<%do while not mx3.eof%>
              <li><a href="?id=<%=mx3("id")%>"><%=mx3("menu")%></a>  <span style="float:right"><a href="menu_sil.asp?id=<%=mx3("id")%>">sil</a></span>
            </li>
                <%mx3.movenext%>
          <%loop%> 
              
              
            </ul>
          </li>
          <%mx2.movenext%>
          <%loop%>
        </ul>
      </nav>
      <%else%>
      
...
      <%end if%>
      
      <hr>
<%set mx33= Server.CreateObject("adodb.recordset")%>
<%mx33.open"select*from menu where gelen=0 order by sira asc",conn,1,3%> 
<nav id="TableOfContents">
<ul>
<%do while not mx33.eof%>
 <%=mx33("menu")%> 
<ul>

      <%set mx331= Server.CreateObject("adodb.recordset")%>
<%mx331.open"select*from menu where gelen="&mx33("id")&" order by sira asc",conn,1,3%> 

<%do while not mx331.eof%>
<li><li><a href="?id=<%=mx331("id")%>"><%=mx331("menu")%></a>



<ul>

      <%set mx332= Server.CreateObject("adodb.recordset")%>
<%mx332.open"select*from menu where gelen="&mx331("id")&" order by sira asc",conn,1,3%> 

<%do while not mx332.eof%>
<li><li><a href="?id=<%=mx332("id")%>"><%=mx332("menu")%></a>





<ul>

      <%set mx333= Server.CreateObject("adodb.recordset")%>
<%mx333.open"select*from menu where gelen="&mx332("id")&" order by sira asc",conn,1,3%> 

<%do while not mx333.eof%>
<li><li><a href="?id=<%=mx333("id")%>"><%=mx333("menu")%></a>



<ul>

      <%set mx334= Server.CreateObject("adodb.recordset")%>
<%mx334.open"select*from menu where gelen="&mx333("id")&" order by sira asc",conn,1,3%> 

<%do while not mx334.eof%>
<li><li><a href="?id=<%=mx334("id")%>"><%=mx334("menu")%></a></li>
 <%mx334.movenext%>
      <%loop%>
      </ul>

</li>
 <%mx333.movenext%>
      <%loop%>
      </ul>

</li>
 <%mx332.movenext%>
      <%loop%>
      </ul>

</li>
 <%mx331.movenext%>
      <%loop%>
      </ul>
     
</li>

      <%mx33.movenext%>
      <%loop%>
      </ul>
      </nav>
      
      
      
    </div>
  </div>
</div><%else%><%response.Redirect("http://canvasor.net")%>
<%end if%>
