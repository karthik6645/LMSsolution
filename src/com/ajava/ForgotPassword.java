package com.ajava;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class ForgotPassword
 */
@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String email;
	private int forgotSubmit;
	private PreparedStatement pstmt;
	private PreparedStatement pstmt2;
	private ResultSet res;
	private ResultSet res2;
	private HttpSession session;
	private String dbemail;
	private RequestDispatcher dispatcher;
	private String dbphone;


	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DiskFileItemFactory factory = new	DiskFileItemFactory();
		ServletFileUpload fileUpload = new	ServletFileUpload(factory);
		String url="jdbc:mysql://localhost:3306/javahostingproject";
		
		String user="root";
		String password="Kothi@789";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			List<FileItem> items = fileUpload.parseRequest(req);
			for(FileItem item: items) {
				String fieldName = item.getFieldName();
				if(fieldName.equals("email")) {
					email = item.getString();
				}
				else if(fieldName.equals("forgotSubmit")) {
					forgotSubmit =Integer.parseInt(item.getString());
				}
			}
			Connection conn = DriverManager.getConnection(url, user, password);
			if(email.contains("@")) {
			String sql="select `email`,`phone_number` from `users` where `email`=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			res = pstmt.executeQuery();
			System.out.println("in forgot if @ " +email);
			if(res.next()==false) {
				session = req.getSession();
				String s="noEmail";
				session.setAttribute("dbemail", s);
			}
			res.previous();
			}
			else {
			String sql2="select `email`,`phone_number` from `users` where `phone_number`=?";
			System.out.println("in forgot else phone "+email);
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, email);
			res = pstmt2.executeQuery();
			if(res.next()==false) {
				session = req.getSession();
				String s="noEmail";
				session.setAttribute("dbemail", s);
				
			}
			res.previous();
			}
			while(res.next()==true) {
				System.out.println("in forgot while"+email);
				 dbemail = res.getString(1);
				 dbphone = res.getString(2);
				 System.out.println("in forgot while db"+dbemail);
			}
			if(email.equals(dbemail)||email.equals(dbphone)) {
				session = req.getSession();
				session.setAttribute("email",email);
				session.setAttribute("forgotSubmit", forgotSubmit);
				dispatcher = req.getRequestDispatcher("index.jsp");
				dispatcher.forward(req, resp);
				System.out.println("in forgot if db"+dbemail);
				System.out.println("in forgot if db"+dbphone);
				
			}
			else {
//				resp.sendRedirect("index.jsp");
				session = req.getSession();
				
				session.setAttribute("forgotSubmit", 2);
				dispatcher = req.getRequestDispatcher("index.jsp");
				dispatcher.forward(req, resp);
			}
			
			
	} catch (FileUploadException | SQLException | ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

}
}