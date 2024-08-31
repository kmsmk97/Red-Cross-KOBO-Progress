package com.kobo;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class insert kobo
 */
@WebServlet("/Signup")
public class insertKoboServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String kid=request.getParameter("kid");
		// catch the user inputs form form and assign to the variables
		
		String cname = request.getParameter("cname");
		String stype = request.getParameter("stype");
		String division = request.getParameter("division");
		String location = request.getParameter("location");
		String date = request.getParameter("date");
		String cost = request.getParameter("cost");
		String participants = request.getParameter("participants");
		
		boolean isTrue;
		
		//send assigned values to the DButill file
		isTrue = koboDBUtil.insertKobo(cname, stype, division, location, date, cost, participants);
		
		//check that send data successfully passed or fail
		if(isTrue == true) {

				
			RequestDispatcher  dis = request.getRequestDispatcher("koboTableDetails.jsp");
			  dis.forward(request,response);
		}
		else {
			
			RequestDispatcher  dis2 = request.getRequestDispatcher("insertKobo.jsp");
			dis2.forward(request,response);
		}
		
		
	}

}
