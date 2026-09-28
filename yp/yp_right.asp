<%if session("oki")= "tamam" and  session("okiho")= day(now) then%>



<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header">
    <h5 id="offcanvasRightLabel">index</h5>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
     <form name="form1" method="post" action="menu_ekle.asp">
       <label>
       <select name="gelen" id="gelen">
         <option value="0"> ../ </option>
              <%set rs2= Server.CreateObject("adodb.recordset")%>
<%rs2.open"select*from menu where gelen=0 order by sira asc",conn,1,3%>
<%do while not rs2.eof%>
<option value="<%=rs2("id")%>"> <%=rs2("menu")%> </option>
<%rs2.movenext%>
<%loop%>
       </select>
       </label>
       <label>
       <input name="menu" type="text" id="menu" size="10">
       </label>
          <label>
          <input type="submit" name="button" id="button" value="ekle">
          </label>
     </form>
     
     <%set rs= Server.CreateObject("adodb.recordset")%>
<%rs.open"select*from menu where gelen=0 order by sira asc",conn,1,3%>
 
<%do while not rs.eof%>
 
  <form name="form2" method="post" action="menu_yenile.asp">
    <label>
    <input name="menu" type="text" id="menu" value="<%=rs("menu")%>" size="10">
    </label>
    <label>
    <input name="sira" type="text" id="sira" value="<%=rs("sira")%>" size="1">
    </label>
<input type="hidden" name="id" id="id" value="<%=rs("id")%>">
    <label>
    <input type="submit" name="button2" id="button2" value="yenile">
    </label>
  <span style="float:right"><a href="menu_sil.asp?id=<%=rs("id")%>">sil</a></span>  </form>
 
      <%set rs3= Server.CreateObject("adodb.recordset")%>
<%rs3.open"select*from menu where gelen="&rs("id")&" order by sira asc",conn,1,3%>
 
<%do while not rs3.eof%>

  <form name="form2" method="post" action="menu_yenile.asp">
    <label><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-return-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5"/>
</svg>
    <input name="menu" type="text" id="menu" value="<%=rs3("menu")%>" size="10">
    </label>
    <label>
    <input name="sira" type="text" id="sira" value="<%=rs3("sira")%>" size="1">
    </label>
<input type="hidden" name="id" id="id" value="<%=rs3("id")%>">
    <label>
    <input type="submit" name="button2" id="button2" value="yenile">
    </label>
  <span style="float:right"><a href="menu_sil.asp?id=<%=rs3("id")%>">sil</a></span>  </form>
 



<%rs3.movenext%>
<%loop%>

 
<%rs.movenext%>
<%loop%>
  </div>
</div><%else%>

<%response.Redirect("http://canvasor.net")%>
<%end if%>
