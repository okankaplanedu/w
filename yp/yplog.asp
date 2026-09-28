<%a=request("a")%>
<%b=request("b")%>
<%c=request("c")%>
 
<%if a - hour(now)=0 and  b - minute(now) =0  and  c - 1973 = 0 then%>
<%session("oki")= "tamam" %>
<%session("okiho")= day(now)%>
<%response.redirect("yeni_kategori.asp")%>
<% else%>
<%response.redirect("http://www.canvasor.net")%>
<%end if%>
