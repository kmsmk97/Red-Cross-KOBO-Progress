package com.kobo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class koboReportServlet
 */
@WebServlet("/koboReportServlet")
public class koboReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("content-type", "text/csv");
		response.setHeader("content-disposition", "attachment;filename = Kobo Report.csv");
        PrintWriter P = response.getWriter();

        ArrayList<kobo> kobo = koboDBUtil.koboAllDetails();
               
        String output = "KID, Employee Name, Service Type, Division, Location, Date, Cost, Participants \n";

        for (kobo k : kobo) {
            output += k.getKid() + "," + k.getCname()+", "+k.getStype()+","
            		+ ""+k.getDivision()+","+k.getLocation()+","+k.getDate()+","+k.getCost()+","+k.getParticipants()+"    \n";
        }
       
        P.println(output);

        P.flush();
        P.close();
	}

}
