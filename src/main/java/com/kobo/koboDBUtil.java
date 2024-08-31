package com.kobo;

import java.sql.Connection;

import java.sql.ResultSet;
//import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
//import java.util.ArrayList;
//import java.util.List;
import java.util.List;





public class koboDBUtil {
	
	//instance variables
	private static Connection con = null;
	private static Statement stmt = null;
    private static ResultSet rs = null;
	private static boolean isSuccess;

		
		//INSERT METHOD for catch inserted form the signup.java file and create the parameter
		public static boolean insertKobo( String cname, String stype, String division, String location, String date, String cost, String participants ) {
		
			//assign boolean variable
			boolean isSuccess = false;
			
			try {
					//database connection
			    	con =dbconnect.getConnection();
					stmt = con.createStatement();
					
					//SQL query for insert data to kobo table
					String sql = "insert into kobo values (0,'"+cname+"','"+stype+"', '"+division+"', '"+location+"', '"+date+"', '"+cost+"', '"+participants+"')";
					
					//assign executed value
					int rs = stmt.executeUpdate(sql);
					
					//check data insert successful or unsuccessful
					if(rs >0) {
						isSuccess = true;
					}
					else {
						isSuccess = false;
					}
			    }
			    catch (Exception e) {
			    	e.printStackTrace();
			    }
		
		//return boolean value
		return isSuccess;
		}
		
		//retrieve data from the kobo database for update and delete form
		public static List<kobo>koboDetails(String kid)
		{
			int convertedID = Integer.parseInt(kid);
			
			ArrayList<kobo>kobo=new ArrayList<>();
			try {
				
		String sql="Select * from kobo where kid='"+convertedID+"'";
		rs=stmt.executeQuery(sql);
		
		if(rs.next())
		{
			int Kid = rs.getInt("kid");
			String cname = rs.getString("cname");
			String stype = rs.getString("stype");
			String division = rs.getString("division");
			String location = rs.getString("location");
			String date = rs.getString("date");
			double cost = rs.getDouble("cost");
			String participants = rs.getString("participants");
			kobo d = new kobo(Kid,cname,stype,division,location,date,cost,participants);
			
			
			kobo.add(d);
			
		}
		
		
		}
		catch(Exception e)
	{
		e.printStackTrace();
	}
	
	
	
	return kobo;
	
			}
		
		
	//update all data in KOBO table  
		public static boolean updateKobo(String kid,String cname, String stype, String division, String location, String date,String cost, String participants) {
	    	
	    	try {
	    		
	    		con = dbconnect.getConnection();
	    		stmt = con.createStatement();
	    		String sql = "UPDATE KOBO set cname='"+cname+"',stype='"+stype+"',division='"+division+"',location='"+location+"',date='"+date+"',cost='"+cost+"',participants='"+participants+"'"
	    				+ "where kid='"+kid+"'";
	    		int rs = stmt.executeUpdate(sql);
	    		
	    		if(rs > 0) {
	    			isSuccess = true;
	    		}
	    		else {
	    			isSuccess = false;
	    		}
	    		
	    	}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	return isSuccess;
	    }
	 
	//Delete all KOBO data set with ID    
	    public static boolean deleteKobo(String kid) {
	    	
	    	int convId = Integer.parseInt(kid);
	    	
	    	try {
	    		
	    		con = dbconnect.getConnection();
	    		stmt = con.createStatement();
	    		String sql = "delete from kobo where kid='"+convId+"'";
	    		int r = stmt.executeUpdate(sql);
	    		
	    		if (r > 0) {
	    			isSuccess = true;
	    		}
	    		else {
	    			isSuccess = false;
	    		}
	    		
	    	}
	    	catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	return isSuccess;
	    }
	    
	    //Retrieve all data for the generate report
	    public static ArrayList<kobo> koboAllDetails() {
			ArrayList<kobo> kobo = new ArrayList<kobo>();
			
			try {
				//database connection
				con = dbconnect.getConnection();
	    		stmt = con.createStatement();
					
					String sql = "select * from kobo;";
					
					ResultSet rs = stmt.executeQuery(sql);
					
					while(rs.next()) {  //variables for catch the values
						
						int Kid = rs.getInt("kid");
						String cname = rs.getString("cname");
						String stype = rs.getString("stype");
						String division = rs.getString("division");
						String location = rs.getString("location");
						String date = rs.getString("date");
						double cost = rs.getDouble("cost");
						String participants = rs.getString("participants");
						kobo d = new kobo(Kid,cname,stype,division,location,date,cost,participants);
						
						kobo.add(d); //customer ArrayList
					
					}
			     
				
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return kobo;
		}
	    
		
}
