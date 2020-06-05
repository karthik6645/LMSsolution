package com.pojo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ajava.DTOusers;


public class User {
	static String url="jdbc:mysql://localhost:3306/javahostingproject";
	static String user="root";
	static String password="Kothi@789";
	private Connection conn;
	private Statement stmt;
	private ResultSet res;
	private String firstName;
	private String LastName;
	private String email;
	private String passworddb;
	private String phNumber;
	private Date date;
	private String gender;
	 public ArrayList userInfo() throws SQLException {
		 ArrayList l=new ArrayList();
		 conn = DriverManager.getConnection(url, user, password);
		 stmt = conn.createStatement();
		 String sql="select * from `users`";
		 res = stmt.executeQuery(sql);
		 while(res.next()==true) {
			 DTOusers dtoUsers = new DTOusers();
			  dtoUsers.setFirstName(res.getString(2));
			 dtoUsers.setLastName(res.getString(3));
			 dtoUsers.setEmail(res.getString(4));
			dtoUsers.setPassworddb(res.getString(5));
			 dtoUsers.setPhNumber(res.getString(6));
			dtoUsers.setDate(res.getDate(7));
			 dtoUsers.setGender(res.getString(8));
	          l.add(dtoUsers);
		 }
		 
	    	return l;
	    }
}
