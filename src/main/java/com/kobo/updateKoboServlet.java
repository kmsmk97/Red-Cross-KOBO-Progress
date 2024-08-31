package com.kobo;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class updateKoboServlet
 */
@WebServlet("/updateKoboServlet")
public class updateKoboServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String kid = request.getParameter("kid");
		String cname = request.getParameter("cname");
		String stype = request.getParameter("stype");
		String division = request.getParameter("division");
		String location = request.getParameter("location");
		String date = request.getParameter("date");
		String cost = request.getParameter("cost");
		String participants = request.getParameter("participants");
		
		boolean isTrue;
		
		isTrue = koboDBUtil.updateKobo(kid,cname,stype,division,location,date,cost,participants);
		
		if(isTrue == true) {
			
		
			
			RequestDispatcher dis = request.getRequestDispatcher("koboTableDetails.jsp");
			dis.forward(request, response);
		}
		else {
			List<kobo> koboDetails = koboDBUtil.koboDetails(kid);
			request.setAttribute("koboDetails", koboDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("useraccount.jsp");
			dis.forward(request, response);
		}
	}

}
