<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="koboCss/kobo.css">
	<link rel="stylesheet" type="text/css" href="koboCss/styles.css">
	<link rel="stylesheet" type="text/css" href="koboCss/header.css">
	
	
 
 <title> Insert KOBO Form </title>
 
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
<!-- Connection for employee table -->	
<%
try {
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/redcrossdb","root","");
	String sql="Select * from employee_details" ;
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(sql);


%>
	
	<div align=center id ="bor" style="background-image: url(koboImages/kobo2.jpg);background-repeat: no-repeat;" >
	<form  action="koIn" id = "insertkobo" method = "post" >
	<h1>INSERT KOBO DETAILS</h1><br/>
	
	<!-- user inputs -->
	<table>
		<!-- Coordinators Name get from Employee table -->
	<!-- Coordinators Name get from Employee table -->
	<tr>
		<td>Employee Name : </td> <td><select id="cname" name="cname"><% while(rs.next()){%>
  		<option value="<%=rs.getString("empFullName") %>"><%=rs.getString("empFullName") %></option>
<% 
	}
				
	} catch (Exception e) {
	e.printStackTrace();
	}
%>
</select></td>    
	</tr>
	<tr>
		<td>Service Type       : </td><td><input type = "text" name ="stype" id ="stype" placeholder = "Service Type"   required></td>
	</tr>
	<tr>
		<td> Name of Division  : </td> <td><input type = "text" name ="division" id ="division" placeholder = "Name of Division"  required></td>
	</tr>
	<tr>
		<td>Location           : </td> <td><input type = "text" name ="location" id ="location" placeholder = "Location"  required></td>
	</tr>
	<tr>
		 <td>Date              : </td> <td> <input type = "Date" name ="date" id ="location"  required></td>
	</tr>
	<tr>
		<td>Cost Rs.           : </td>  <td><input type = "number" name ="cost" id ="cost" placeholder = "Cost"  required></td>
	</tr>
	<tr>
		<td>Number of Participants : </td> <td><input type = "number" name ="participants" id ="participants" placeholder = "Number of Participants"  required></td>
	</tr>
	<tr>
		<td> </td> <td><input  style= "background-color:#b30000; COLOR:WHITE;"type = "submit"  name = "submit" id = "button" value = "Submit"></td>
	</tr>
	
	</table>
		
	</form>
	<br> <br>
	<a href="koboTableDetails.jsp"><button style= "background-color:#b30000; COLOR:WHITE;" ><b>All KOBOS</b></button></a>	
		 <br>	
	 <br>
	
	</div>
	

</body>
 <hr>
</html>