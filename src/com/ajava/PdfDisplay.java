package com.ajava;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PdfDisplay
 */
@WebServlet("/PdfDisplay")
public class PdfDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="jdbc:mysql://localhost:3306/javahostingproject";
		  String user="root";
		   String password="Kothi@789";
		  
		    ServletOutputStream  os=response.getOutputStream();
		try {
			String id = request.getParameter("id");
			Class.forName("com.mysql.cj.jdbc.Driver");
		
			Connection conn = DriverManager.getConnection(url, user, password);
			 String sql="select pdf from `book_shelf` where `book_id`=?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
		
			 ResultSet res = pstmt.executeQuery();
			 if(res.next()) {
				byte[] pdf = res.getBytes(1);
				os.write(pdf);
				
			 }
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
