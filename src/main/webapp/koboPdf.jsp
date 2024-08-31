<%@page import="com.mysql.fabric.xmlrpc.base.Data"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import ="java.util.Date" %>




<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delivery cost</title>
<link rel="stylesheet" type="text/css" href="koboCss/styles.css">
<link rel="stylesheet" type="text/css" href="koboCss/header.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>
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
<body>

	<!-- <br><br>-->
<center>



<div id="list">
<img src ="koboImages/reportb.jpeg" width =620px height="200px" >
<hr>



<table border ="1"><br>
	
	<h1>Annual Kobo Report</h1>
	<cenetr><p style="width: 50%;margin:0% 5%">Today & Time:<%=new Date().toString()%> </p></cenetr>  
		<tr style="background-color:#e60000;color:white" >
		    
			<th><b>Employee Name</b></th>
			<th><b>Service Type</b></th>
			<th><b>Division</b></th>
			<th><b>Location</b></th>
			<th><b>Conducted Date</b></th>
			<th><b>Cost</b></th>
			<th><b>Participants</b></th>
			<th><b>KID</b></th>
			 
			
		</tr>

<%

	try {
		String year=request.getParameter("Year");
	
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/redcrossdb","root","");
		String sql = "select *   from kobo where date LIKE '"+year+"%'";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(sql);
		Connection connection = null;
		while(rs.next()){

	%>
		<tr>
			
			<td><%=rs.getString("cname")%></td>
			<td><%=rs.getString("stype")%></td>
			<td><%=rs.getString("division")%></td>
			<td><%=rs.getString("location")%></td>
			<td><%=rs.getString("date")%></td>
			<td><%=rs.getString("cost")%></td>
			<td><%=rs.getString("participants")%></td>
			<td><%=rs.getString("kid")%></td>
			 
			
			
		</tr> 

	<%
		}

			String sql1 = "select SUM(Cost) AS new_cost  from kobo where date LIKE '"+year+"%'";;
			rs = st.executeQuery(sql1);
			Float New_cost;	
					
				if(rs.next()){
					New_cost=rs.getFloat("new_cost");
 				}
%>
				<tr style="background-color:#ffcccc;color:black" >
				    <td><b>  Annual Budget Rs.</b> </td>
					<td><b><center>  <%=rs.getString("new_cost")%>/-</center></b></td>
				</tr>
				
<% 				
				
			String sql2 = "select COUNT(kid) AS new_count  from kobo where date LIKE '"+year+"%'";;
			rs = st.executeQuery(sql2);
			Float new_count;	
					
				if(rs.next()){
					New_cost=rs.getFloat("new_count");
 				}
%>
				<tr style="background-color:#ffcccc;color:black" >
				    <td><b>  No. of Annual Progresses</b> </td>
					<td><b><center>   <%=rs.getString("new_count")%></center></b></td>
				</tr>
				
				

	<%
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
	%>

</table><br><br>
<center>...................................<br>Signature</center>

</center>


  </div> 
 
<br>		

<center><button style= "background-color:red; COLOR:WHITE;" onclick="print()" >Download  Report</button></center>
<br><br><br>


<br><br>
<a href="koboTableDetails.jsp"><button style= "background-color:red; COLOR:WHITE;">Back</button></a>
		<p>Copyright©2021 RED CROSS KANDY</p>

<hr>	
	
	<script >
	
	function print(){
	var element = document.getElementById("list");
	var opt = {
	  margin:       1,
	  filename:     'Annual KOBO Report.pdf',
	  image:        { type: 'jpeg', quality: 0.98 },
	  html2canvas:  { scale: 2 },
	  jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
	};
	 
	// New Promise-based usage:
	html2pdf().from(element).set(opt).save();
	
	}

	</script>

</body>

</html>
