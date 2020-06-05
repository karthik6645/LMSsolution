package com.ajava;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement pstmt;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String email = req.getParameter("id");
    String url="jdbc:mysql://localhost:3306/javahostingproject";
	String user="root";
	String password="Kothi@789";
	try {
		Connection conn = DriverManager.getConnection(url, user, password);
		String sql="delete from `users` where `email`=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		int i = pstmt.executeUpdate();
		HttpSession session = req.getSession();
		 session.setAttribute("submit", 6);
		if(i>0) {
			 
			 session.setAttribute("deletes", "deleted");
			 session.setAttribute("deletedUser", email);
		}
	    RequestDispatcher dispatcher1 = req.getRequestDispatcher("ManageUsers");
		dispatcher1.forward(req, resp);
		

	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

}
