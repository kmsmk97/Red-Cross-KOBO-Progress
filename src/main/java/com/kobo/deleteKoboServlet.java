package com.kobo;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class deleteKoboServlet
 */
@WebServlet("/deleteKoboServlet")
public class deleteKoboServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String kid = request.getParameter("kid");
		boolean isTrue;
		
		isTrue = koboDBUtil.deleteKobo(kid);
		
		if (isTrue == true) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("koboTableDetails.jsp");
			dispatcher.forward(request, response);
		}
		else {
			
					
			RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
	}

}
