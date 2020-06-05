package com.ajava;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
 * Servlet implementation class UpdatePassword
 */
@WebServlet("/UpdatePassword")
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String newPass;
	private int newPassSubmit;
	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	private HttpSession session;
	private PreparedStatement pstmt;
	private int i;
	private RequestDispatcher dispatcher;
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DiskFileItemFactory factory = new	DiskFileItemFactory();
	     ServletFileUpload fileUpload = new ServletFileUpload(factory);
	     String url="jdbc:mysql://localhost:3306/javahostingproject";
	 	String user="root";
	 	String password="Kothi@789";
	 	session = req.getSession();
	 	String s=(String)session.getAttribute("email");
	 	System.out.println("in upadate "+s );
	     try {
	    	 Class.forName("com.mysql.cj.jdbc.Driver");
	    	 List<FileItem> items = fileUpload.parseRequest(req);
				for(FileItem item: items) {
					String fieldName = item.getFieldName();
					if(fieldName.equals("newPass")) {
						newPass = item.getString();
					}
					else if(fieldName.equals("newPassSubmit")) {
						newPassSubmit =Integer.parseInt(item.getString());
					}
				}
				Connection conn = DriverManager.getConnection(url, user, password);
				String sql="update `users` set `password`=? where `email`=? or `phone_number`=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, newPass);
				pstmt.setString(2, s);
				pstmt.setString(3, s);
				i = pstmt.executeUpdate();
				System.out.println("after update execute"+newPass);
				System.out.println("i value"+i);
				if(i>0) {
					session.setAttribute("newPassSubmit", 1);
				}
				dispatcher = req.getRequestDispatcher("index.jsp");
				dispatcher.forward(req, resp);
	}catch (FileUploadException | SQLException | ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}


}
}
