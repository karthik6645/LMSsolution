package com.ajava;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ImageCollection
 */
@WebServlet("/ImageCollection")
public class ImageCollection extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	byte[] image=null;
    	ServletOutputStream os = resp.getOutputStream();
    	String url="jdbc:mysql://localhost:3306/javahostingproject";
    	String user="root";
    	String password="Kothi@789";
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, user, password);
			Statement stmt = conn.createStatement();
			String sql="select image from `bookinfo`";
			ResultSet res = stmt.executeQuery(sql);
		     if( res.next()==true) {
			 image = res.getBytes(1);
			 os.write(image);
			 
			 
		     }
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	
    	
    }
	

}
