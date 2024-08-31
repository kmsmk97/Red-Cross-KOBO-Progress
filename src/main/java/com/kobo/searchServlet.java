package com.kobo;

import java.io.IOException;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class searchServlet
 */
@WebServlet("/searchServlet")
public class searchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Connection con = null;
	private static Statement stmt = null;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
      
        try {
        	//database connection
	    	con =dbconnect.getConnection();
			stmt = con.createStatement();
            System.out.println("Connected!");
            String date = request.getParameter("date");
 
            ArrayList al = null;
            ArrayList pid_list = new ArrayList();
            //SQL query for search function by coordinator's name
            String query = "select * from kobo where date='" + date + "' ";
 
            System.out.println("query " + query);
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);
 
            while (rs.next()) {
                al = new ArrayList();
 

                al.add(rs.getInt(1));
                al.add(rs.getString(2));
                al.add(rs.getString(3));
                al.add(rs.getString(4));              
                al.add(rs.getString(5));
                al.add(rs.getString(6));
                al.add(rs.getString(7));              
                al.add(rs.getString(8));
                
                
 
                System.out.println("al :: " + al);
                pid_list.add(al);
            }
 
            request.setAttribute("piList", pid_list);
            System.out.println("piList " + pid_list);
            RequestDispatcher view = request.getRequestDispatcher("/searchKoboView.jsp");
            view.forward(request, response);
            con.close();
            System.out.println("Disconnected!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
	
}
