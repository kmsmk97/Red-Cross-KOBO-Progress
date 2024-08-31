<%@ page import="java.util.*" %>
 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
    <head>
<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="koboCss/kobo.css">
	<link rel="stylesheet" type="text/css" href="koboCss/styles.css">
	<link rel="stylesheet" type="text/css" href="koboCss/header.css">
	
	
 
 <title> ALL SERACH DETAILS </title>
 
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
    <body >
    <div align=center id ="bor" style="background-image: url(koboImages/koboT.png);background-repeat: no-repeat;"> 
    	<h1>KOBO Search Results</h1>
    	<a href="koboTableDetails.jsp"><button style= "background-color:red; COLOR:WHITE;">Back</button></a>
        <table border="2">
           
            <tr>
            <th>KOBO ID</th>
			<th>Employee Name</th>
			<th>Service Type</th>
			<th>Name of Division</th>
			<th>Location</th>
			<th>Date</th>
			<th>Cost</th>
			<th>Number of Participants</th>

            </tr>
            <%
                int count = 0;
                String color = "#F9EBB3";
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");
                    System.out.println(al.toString());
                    
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        if ((count % 2) == 0) {
                            color = "#eeffee";
                        }
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
                        
            %>
            <tr style="background-color:<%=color%>;">
                <td><%=pList.get(0)%></td>
                <td><%=pList.get(1)%></td>
                <td><%=pList.get(2)%></td>
                <td><%=pList.get(3)%></td>
                <td><%=pList.get(4)%></td>
                <td><%=pList.get(5)%></td>
                <td><%=pList.get(6)%></td>
                <td><%=pList.get(7)%></td>
                
                
            </tr>
            <%
                    }
                }
                
            %>
            <%
            if (count == 0) {
            %>
            <tr>
                <td colspan=8 align="center"
                    style="background-color:#eeffee"><b>No Record Found..</b></td>
            </tr>
            <%            
            	}
            %>
        </table>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        </div>
    </body>
     <hr>
</html>