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
 * Servlet implementation class UserAdd
 */
@WebServlet("/UserAdd")
public class UserAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String firstName;
	private String lastName;
	private String email;
	private String password1;
	private String phnumber;
	private String dob;
	private String gender;
	private int submitUp;
	private PreparedStatement pstmt;
	private PreparedStatement pstmt2;
	private ResultSet res;
	private String dbemail;
	private String dbphone;
	private RequestDispatcher dispatcher2;
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
				if(item.isFormField()) {
					String fieldName = item.getFieldName();
					if(fieldName.equals("firstName")) {
						 firstName = item.getString();
					}
					else if(fieldName.equals("lastName")) {
						 lastName = item.getString();
					}
					else if(fieldName.equals("email")) {
						 email = item.getString();
					}
					else if(fieldName.equals("password")) {
						 password1 = item.getString();
					}
					else if(fieldName.equals("phnumber")) {
						 phnumber = item.getString();
					}
					else if(fieldName.equals("dob")) {
						 dob = item.getString();
					}
					else if(fieldName.equals("gender")) {
						 gender = item.getString();
					}
					else if(fieldName.equals("submit")) {
						 submitUp = Integer.parseInt(item.getString());	
					}
				}else {
					continue;
				}
			}
			System.out.println("before conn in addUser up"+email);
			System.out.println("before conn in addUser up"+phnumber);
			Connection conn = DriverManager.getConnection(url, user, password);
			String sql2="select `email`,`phone_number` from `users`";
			pstmt2 = conn.prepareStatement(sql2);
			res = pstmt2.executeQuery();
			while(res.next()==true) {
				dbemail = res.getString(1);
				dbphone = res.getString(2);
				if(email.equals(dbemail)||phnumber.equals(dbphone)) {
					 HttpSession session2 = req.getSession();
					 System.out.println("in if addUser email"+email);
					 System.out.println("in if addUser db email "+dbemail);
					 System.out.println("in if addUser ph "+phnumber);
					 System.out.println("in if addUser db ph"+dbphone);
					 session2.setAttribute("existsAdmin", "exists");
//					resp.sendRedirect("ManageUsers");
					RequestDispatcher dispatcher = req.getRequestDispatcher("ManageUsers");
					dispatcher.forward(req, resp);
					 System.out.println("after admin.jsp in useradd send redirct");
					 break;
				}
			}
			
			String sql="insert into `users`(`first_name`,`last_name`,`email`,`password`,`phone_number`,`dob`,`gender`)values(?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, firstName);
			pstmt.setString(2, lastName);
			pstmt.setString(3, email);
			pstmt.setString(4, password1);
			pstmt.setString(5, phnumber);
			pstmt.setString(6, dob);
			pstmt.setString(7, gender);
			int i = pstmt.executeUpdate();
			if(i>0) {
				 HttpSession session = req.getSession();
				 session.setAttribute("submit", submitUp);
				 session.setAttribute("added", "addedy");
			}
			HttpSession session = req.getSession();
			String users=(String)session.getAttribute("users");
			if(users.equals("admin")) {
				 session.setAttribute("addedUser", email );
				 System.out.println("user adminPassword in if 2");
				 RequestDispatcher dispatcher1 = req.getRequestDispatcher("ManageUsers");
			 System.out.println("user adminPassword in if");
			dispatcher1.forward(req, resp);
			}
			else {
				RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
				dispatcher.forward(req, resp);
			}
		} catch (FileUploadException | SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
	}

}
}
