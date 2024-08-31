package com.kobo;

import java.sql.Connection;
import java.sql.DriverManager;

public class dbconnect {

	//create static variables for save url,username and password
		private static String url = "jdbc:mysql://localhost:3306/redcrossdb";
		private static String userName = "root";
		private static String password = "";
		private static Connection con;

		//method for return connection
		public static Connection getConnection() {
			
			try {
				
				//database driver
				Class.forName("com.mysql.jdbc.Driver");
				
				//assign database connection to variable
				con = DriverManager.getConnection(url, userName, password );
				
				
			}catch (Exception e){
				
				System.out.println("Database connection failed!!!");
				
			}
			//return value
			return con;
		}

}
