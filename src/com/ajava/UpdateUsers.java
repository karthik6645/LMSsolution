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
 * Servlet implementation class UpdateUsers
 */
@WebServlet("/UpdateUsers")
public class UpdateUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String firstName;
	private String firstname1;
	private String lastName;
	private String email;
	private String password1;
	private String phnumber;
	private String dob;
	private String gender;
	private int submitUp;
	private int count;
	private PreparedStatement pstmt;
	private PreparedStatement pstmt2;
	private ResultSet res;
	private String dbemail;
	private String dbphone;
	private String emailOrginal;
	private String phoneNumberOrginal;
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
				System.out.println("in users add for2");
				if(item.isFormField()) {
					String fieldName = item.getFieldName();
					System.out.println("in user add feild name"+fieldName);
					if(fieldName.equals("firstName")) {
						 firstName = item.getString();
						 System.out.println("in user add feild name frsname"+firstName);
					}
					else if(fieldName.equals("lastName")) {
						 lastName = item.getString();
						 System.out.println("in user add feild name lastname"+lastName);
					}
					else if(fieldName.equals("email")) {
						 email = item.getString();
						 System.out.println("in user add feild name in eamil "+email);
					}
					else if(fieldName.equals("password")) {
						 password1 = item.getString();
						 System.out.println("in user add feild name password"+password);
					}
					else if(fieldName.equals("phoneNumber")) {
						 phnumber = item.getString();
						 System.out.println("in user add feild name in ph "+phnumber);
					}
					else if(fieldName.equals("dob")) {
						
						 dob = item.getString();
						 System.out.println("in user add feild name in dob"+dob);
					}
					else if(fieldName.equals("gender")) {
						 gender = item.getString();
						 System.out.println("in user add feild name in gender"+gender);
					}
					else if(fieldName.equals("submit")) {
						 submitUp = Integer.parseInt(item.getString());	
					}
					else if(fieldName.equals("firstname1")) {
						firstname1 = item.getString();

					}
					else if(fieldName.equals("emailOrginal")) {
						emailOrginal = item.getString();
						 System.out.println("in user add feild name lastname"+emailOrginal);
					}
					else if(fieldName.equals("phoneNumberOrginal")) {
						phoneNumberOrginal = item.getString();
						 System.out.println("in user add feild name lastname"+phoneNumberOrginal);
					}
				}else {
					continue;
				}
			}
			Connection conn = DriverManager.getConnection(url, user, password);
			if(emailOrginal.equals(email)&& phoneNumberOrginal.equals(phnumber)) {
				String sql="update `users` "
					     + "set `first_name`=?,`last_name`=?,`email`=?,`password`=?,`phone_number`=?,`dob`=?,`gender`=? "
					     + "where `email`=? and `phone_number`=?";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, firstName);
						pstmt.setString(2, lastName);
						pstmt.setString(3, email);
						pstmt.setString(4, password1);
						pstmt.setString(5, phnumber);
						pstmt.setString(6, dob);
						pstmt.setString(7, gender);
						pstmt.setString(8, email);
						pstmt.setString(9, phnumber);
						long l = pstmt.executeLargeUpdate();
						 HttpSession session = req.getSession();
						 session.setAttribute("submit", 6);
						if(l>0) {
							
							 session.setAttribute("updated", "updated");
							 session.setAttribute("updatedUser", email);
						}
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
			}
			else if(emailOrginal.equals(email)) {
				int count=0;
				String sql2="select `phone_number` from `users`";
				pstmt2 = conn.prepareStatement(sql2);
				res = pstmt2.executeQuery();
				while(res.next()==true) {
					System.out.println("-----------------------------");
					dbphone = res.getString(1);
					System.out.println("db email"+dbphone);
					if(phnumber.equals(dbphone)) {
						 HttpSession session2 = req.getSession();
						 System.out.println("in if update user ph "+phnumber);
						 System.out.println("in if update user db ph"+dbphone);
						 session2.setAttribute("existsAdmin", "exists");
						 session2.setAttribute("updatedUserDisplay", "Phone Number");//updated user email
//						resp.sendRedirect("ManageUsers");
						RequestDispatcher dispatcher = req.getRequestDispatcher("ManageUsers");
						dispatcher.forward(req, resp);
						 System.out.println("after admin.jsp in useradd send redirct");
						count+=1;
						System.out.println("in phone if "+count);
					}
				}
				System.out.println("in phone if out "+count);
				if(count==0) {
					System.out.println("in phone if out out"+count);
				String sql="update `users` "
					     + "set `first_name`=?,`last_name`=?,`email`=?,`password`=?,`phone_number`=?,`dob`=?,`gender`=? "
					     + "where `email`=? and `phone_number`=?";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, firstName);
						pstmt.setString(2, lastName);
						pstmt.setString(3, email);
						pstmt.setString(4, password1);
						pstmt.setString(5, phnumber);
						pstmt.setString(6, dob);
						pstmt.setString(7, gender);
						pstmt.setString(8, email);
						pstmt.setString(9, phoneNumberOrginal);
						long l = pstmt.executeLargeUpdate();
						System.out.println("l in if count=0"+l);
						 HttpSession session = req.getSession();
						 session.setAttribute("submit", 6);
						if(l>0) {
							System.out.println("l in if count=0 in in "+l);
							 session.setAttribute("updated", "updated");
							 session.setAttribute("updatedUser", email);
						}
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
				}
				
			}
			else if(phoneNumberOrginal.equals(phnumber)) {
				int count=0;
				String sql2="select `email` from `users`";
				pstmt2 = conn.prepareStatement(sql2);
				res = pstmt2.executeQuery();
				while(res.next()==true) {
					dbemail = res.getString(1);
					System.out.println("db email"+dbemail);
					if(email.equals(dbemail)) {
						 HttpSession session2 = req.getSession();
						 System.out.println("in if update user ph "+phnumber);
						 System.out.println("in if update user db ph"+dbemail);
						 session2.setAttribute("existsAdmin", "exists");
						 session2.setAttribute("updatedUserDisplay", "Email");
//						resp.sendRedirect("ManageUsers");
						RequestDispatcher dispatcher = req.getRequestDispatcher("ManageUsers");
						dispatcher.forward(req, resp);
						 System.out.println("after admin.jsp in useradd send redirct");
						count+=1;
					}
				}
				if(count==0) {
				String sql="update `users` "
					     + "set `first_name`=?,`last_name`=?,`email`=?,`password`=?,`phone_number`=?,`dob`=?,`gender`=? "
					     + "where `email`=? and `phone_number`=?";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, firstName);
						pstmt.setString(2, lastName);
						pstmt.setString(3, email);
						pstmt.setString(4, password1);
						pstmt.setString(5, phnumber);
						pstmt.setString(6, dob);
						pstmt.setString(7, gender);
						pstmt.setString(8, emailOrginal);
						pstmt.setString(9, phnumber);
						long l = pstmt.executeLargeUpdate();
						 HttpSession session = req.getSession();
						 session.setAttribute("submit", 6);
						if(l>0) {
							
							 session.setAttribute("updated", "updated");
							 session.setAttribute("updatedUser", emailOrginal);
						}
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
				}
				
			}
			else {
				int count=0;
				System.out.println("in users update"+email);
				System.out.println("in users update"+phnumber);
			
				String sql2="select `email`,`phone_number` from `users`";
				pstmt2 = conn.prepareStatement(sql2);
				res = pstmt2.executeQuery();
				while(res.next()==true) {
					dbemail = res.getString(1);
					System.out.println("db email"+dbemail);
					dbphone = res.getString(2);
					System.out.println("db email"+dbphone);
					if(email.equals(dbemail)||phnumber.equals(dbphone)) {
						 HttpSession session2 = req.getSession();
						 System.out.println("in if update user email"+email);
						 System.out.println("in if update user db email "+dbemail);
						 System.out.println("in if update user ph "+phnumber);
						 System.out.println("in if update user db ph"+dbphone);
						 session2.setAttribute("existsAdmin", "exists");
						 session2.setAttribute("updatedUserDisplay", "Email & Phone Number");

//						resp.sendRedirect("ManageUsers");
						RequestDispatcher dispatcher = req.getRequestDispatcher("ManageUsers");
						dispatcher.forward(req, resp);
						 System.out.println("after admin.jsp in useradd send redirct");
						count+=1;
					}
				}
				if(count==0) {
				String sql="update `users` "
					     + "set `first_name`=?,`last_name`=?,`email`=?,`password`=?,`phone_number`=?,`dob`=?,`gender`=? "
					     + "where `email`=? and `phone_number`=?";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, firstName);
						pstmt.setString(2, lastName);
						pstmt.setString(3, email);
						pstmt.setString(4, password1);
						pstmt.setString(5, phnumber);
						pstmt.setString(6, dob);
						pstmt.setString(7, gender);
						pstmt.setString(8, emailOrginal);
						pstmt.setString(9, phoneNumberOrginal);
						long l = pstmt.executeLargeUpdate();
						 HttpSession session = req.getSession();
						 session.setAttribute("submit", 6);
						if(l>0) {
							
							 session.setAttribute("updated", "updated");
							 session.setAttribute("updatedUser", emailOrginal);
						}
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
			}
		}
			
	}catch (FileUploadException | SQLException | ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
}

}
}