<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="koboCss/kobo.css">
	<link rel="stylesheet" type="text/css" href="koboCss/styles.css">
	<link rel="stylesheet" type="text/css" href="koboCss/header.css">
	
	
 
 <title> ALOO KOBO ACTIVITIES </title>
 
 <header>	
 
		<hr>

<ul class="one" position=fixed;>

<li><lable style="font-size:30px;">Red Cross</lable></li>
<li><a href="#">Home</a></li>
<li><a href="#">Employees</a></li>
<li><a href="#">Members</a></li>
<li><a href="#">Vaccine</a></li>
<li><a href="#">Hospital</a></li>
<li><a href="#">Uber Central</a></li>
<li><a href="#">Inventory</a></li>
<li><a href="koboTableDetails.jsp">KOBO</a></li>
<li><a href="#">Complaints & Suggestions</a></li>

</ul>
		
 	
 </head>

 <hr>

<body>
<div align=center id ="bor" style="background-image: url(koboImages/koboT.png);background-repeat: no-repeat;">
<h1>ALL KOBO DETAILS</h1>
	<BR>
		<form action="search" name="frm" method="post">
		<table align="center">
			<tr>
			<td colspan=2 style="font-size:12pt;" align="center">
			<td><label for="fname"><b>SEARCH KOBO DETAILS BY DATE (MM/DD/YYYY)</b></label></td>
			<td><input type="date" name="date"  ></td>
			<td><input   type="submit" name="submit" value="Search" style= "background-color:red; COLOR:WHITE;"></td></tr>
			<br>
		</table>
	</form>
	
	<BR><BR>
<a href="insertKobo.jsp">ADD NEW KOBO</a>
<BR>	
<table border ="2"><br>

<tr style="background-color:#e60000;color:white">
<th><b>KOBO ID</b></th>
<th><b>Employee Name</b></th>
<th><b>Service Type</b></th>
<th><b>Name of Division</b></th>
<th><b>Location</b></th>
<th><b>Date</b></th>
<th><b>Cost</b></th>
<th><b>Number of Participants</b></th>

<th>Update</th>
<th>Delete</th>

</tr>

<%

try {
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/redcrossdb","root","");
	String sql="Select * from kobo" ;
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(sql);
	while(rs.next()){

%>
<tr style="background-image: url(../koboImages/koboin.jpg);">
<td><%=rs.getString(1)%></td>
<td ><%=rs.getString(2)%></td>
<td ><%=rs.getString(3)%></td>
<td ><%=rs.getString(4)%></td>
<td ><%=rs.getString(5)%></td>
<td ><%=rs.getString(6)%></td>
<td ><%=rs.getString(7)%></td>
<td ><%=rs.getString(8)%></td>


<td><a style= "background-color: blue; color:white"  href="updateKobo.jsp?kid=<%=rs.getString("kid")%>" >UPDATE</a></td>
<td><a style= "background-color: red; color:white" href="deleteKobo.jsp?kid=<%=rs.getString("kid")%>">DELETE</a></td>
</tr>
<%

}

}catch(Exception e)
{
e.printStackTrace();
}
%>



</table>
<br><br>
	<form action="koboPdf.jsp" method="post">	
		
     Generate Annual Report   :<input type = "text" name ="Year" id ="Year" placeholder = "Year"   required>
         <br><br>   
          <input style ="background-color:red; COLOR:WHITE;" type="submit" value="Genarate" >  
  </form>
<br><br><br><br>
Download All KOBO Details.csv <br><a href="Kreport"><button style= "background-color:red; COLOR:WHITE;" ><b>Print</b></button></a>
<br><br><br><br><br><br><br><br><br><br><br><br><br>

</div>
</body>
 <hr>
</html>