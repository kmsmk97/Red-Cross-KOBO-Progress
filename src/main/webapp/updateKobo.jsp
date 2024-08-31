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
	
	
 
 <title> Update KOBO Form </title>
 
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


<!-- Connection for kobo table -->	
<%

try {
	String kid = request.getParameter("kid");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/redcrossdb","root","");
	String sql="Select * from kobo where kid="+kid;
	Statement st=con.createStatement();
	ResultSet resultSet=st.executeQuery(sql);
	while(resultSet.next()){

%>
		<div align=center id ="bor"  style="background-image: url(koboImages/kobo1.jpg);background-repeat: no-repeat;">
	<form action="updateKobo" id = "insertkobo" method = "post" >
	<h1>UPDATE KOBO DETAILS</h1><br/>
	<input type="hidden" name="kid" value="<%=resultSet.getString("kid") %>">
	
	<!-- user inputs -->
	<table align="center">
	<tr>
		<td>KOBO ID            : </td>  <td><input type = "text" name ="kid" id ="cid" value="<%=resultSet.getString("kid") %>"  readonly></td>
	</tr>
	<tr>
		<td>Employee Name      : </td>  <td><input type = "text" name ="cname" id ="cname" value="<%=resultSet.getString("cname") %>"readonly></td>
	</tr>
	<tr>
		<td>Service Type       : </td><td><input type = "text" name ="stype" id ="stype" value="<%=resultSet.getString("stype") %>"></td>
	</tr>
	<tr>
		<td> Name of Division  : </td> <td><input type = "text" name ="division" id ="division" value="<%=resultSet.getString("division") %>"></td>
	</tr>
	<tr>
		<td>Location           : </td> <td><input type = "text" name ="location" id ="location" value="<%=resultSet.getString("location") %>"></td>
	</tr>
	<tr>
		 <td>Date              : </td> <td> <input type = "date" name ="date" id ="location" value="<%=resultSet.getString("date") %>"></td>
	</tr>
	<tr>
		<td>Cost Rs.           : </td>  <td><input type = "number" name ="cost" id ="cost" value="<%=resultSet.getString("cost") %>"></td>
	</tr>
	<tr>
		<td>Number of Participants : </td> <td><input type = "number" name ="participants" id ="participants" value="<%=resultSet.getString("participants") %>"></td>
	</tr>
	<tr>
	<td></td><td></td>
	</tr>
	<tr>
		<td> </td> <td><input  style= "background-color:#b30000; COLOR:WHITE;"type = "submit"  name = "submit" id = "button" value = "Update"></td>
	</tr>
	
	</table>
	</form>
	<br><br><br>	
	<br></div>
<%
}


}catch(Exception e)
{
e.printStackTrace();
}
%>

</body>
 <hr>
</html>