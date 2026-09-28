<%Set conn = Server.createObject("Adodb.Connection")%>
<%conn.Open "Driver={MySQL ODBC 3.51 Driver};Server=localhost;Database=canvasor_net_db;User=canvasor_net_us;Password=d%fw3Pl14Mz8juqgT;Option=3;option=16387;"
conn.Execute "SET NAMES 'latin5'"
conn.Execute "SET CHARACTER SET latin5"
conn.Execute "SET COLLATION_CONNECTION = 'latin5_turkish_ci'"
%>
