package com.ajava;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.mysql.cj.protocol.StandardSocketFactory;

/**
 * Servlet implementation class LoginIn
 */
@WebServlet("/LoginIn")
public class LoginIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String userName;
	private String passwordl;
	private String users;
	private int logInSubmit;
	private String remember;
	private PreparedStatement pstmt;
	private PreparedStatement pstmt2;
	private ResultSet res;
	private ResultSet res2;
	private HttpSession session;
	private String passworddb;
	private RequestDispatcher dispatcher;
	private String adminName;
	private String adminPassword;
	private HttpSession session2;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	DiskFileItemFactory factory = new	DiskFileItemFactory();
     ServletFileUpload fileUpload = new ServletFileUpload(factory);
     String url="jdbc:mysql://localhost:3306/javahostingproject";
 	String user="root";
 	String password="Kothi@789";
 	session = req.getSession();
 	String s1="correct";
 	session.setAttribute("inCorrectl", s1);
 	
     try {
    	 Class.forName("com.mysql.cj.jdbc.Driver");
		List<FileItem> items = fileUpload.parseRequest(req);
		for(FileItem item: items) {
			if(item.isFormField()) {
				String fieldName = item.getFieldName();
				if(fieldName.equals("userName")) {
					userName = item.getString();
				}
				if(fieldName.equals("passwordl")) {
					passwordl = item.getString();
				}
				if(fieldName.equals("users")) {
					users = item.getString();
					session2 = req.getSession();
					session2.setAttribute("users", users);
				}
				if(fieldName.equals("logInSubmit")) {
					logInSubmit = Integer.parseInt(item.getString());
					session2 = req.getSession();
					session2.setAttribute("logInSubmit", logInSubmit);
				}
				if(fieldName.equals("remember")) {
					remember = item.getString();
					System.out.println("login remember "+remember);
				}
			}else {
				continue;
			}
		}
		System.out.println("username "+userName);
		System.out.println("contains "+userName.contains("@"));
		if(users.equals("user")) {
		Connection conn = DriverManager.getConnection(url, user, password);
		if(userName.contains("@")) {
		String sql="select `password` from `users` where `email`=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userName);
		res = pstmt.executeQuery();
		if(res.next()==false) {
			session = req.getSession();
			String s="inCorrect";
			session.setAttribute("inCorrectl", s);
			System.out.println("in if @ "+s);
		}
		res.previous();
		}
		else {
		String sql2="select `password` from `users` where `phone_number`=?";
		pstmt2 = conn.prepareStatement(sql2);
		pstmt2.setString(1, userName);
		res= pstmt2.executeQuery();
		System.out.println("in else "+userName);
		if(res.next()==false) {
			session = req.getSession();
			String s="inCorrect";
			session.setAttribute("inCorrectl", s);
			System.out.println("in if ph "+s+"in res.next()");
		}
		res.previous();
		System.out.println("after res2.next()");
		}
		System.out.println("after res2.next() before while");
		while(res.next()==true) {
			passworddb = res.getString(1);
			System.out.println("in while "+passworddb );
			System.out.println("in while "+passwordl);
		}
		System.out.println("after while "+passworddb );
		System.out.println("after while "+passwordl);
		if(passwordl.equals(passworddb)) {
			dispatcher = req.getRequestDispatcher("user.jsp");
			dispatcher.forward(req, resp);
			
		}
		else {
//			resp.sendRedirect("index.jsp");
			session = req.getSession();
			String s="inCorrect";
			session.setAttribute("inCorrectl", s);
			dispatcher = req.getRequestDispatcher("index.jsp");
			dispatcher.forward(req, resp);
		}
		}
		else {
			ServletContext context = getServletContext();
			adminName = context.getInitParameter("adminName");
			adminPassword = context.getInitParameter("adminPassword");
			System.out.println("admin name "+adminName);
			System.out.println("admin adminPassword "+adminPassword);
			if(userName.equals(adminName)&& adminPassword.equals(passwordl)) {
				 System.out.println("admin adminPassword in if");
                RequestDispatcher dispatcher = req.getRequestDispatcher("admin.jsp");
                System.out.println("admin adminPassword in if mid");
				dispatcher.forward(req, resp);
				 
				System.out.println("admin adminPassword in if after");
			}
			else {
				session = req.getSession();
				String s="inCorrect";
				session.setAttribute("inCorrectl", s);
				dispatcher = req.getRequestDispatcher("index.jsp");
				dispatcher.forward(req, resp);
			}
		}
	} catch (FileUploadException | ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}

}
