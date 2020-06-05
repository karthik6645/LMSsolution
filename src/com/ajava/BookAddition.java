package com.ajava;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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

import com.pojo.DAOAddition;

/**
 * Servlet implementation class BookAddition
 */
@WebServlet("/BookAddition")
public class BookAddition extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement pstmt2;
	private String additionId;
 @Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 String url="jdbc:mysql://localhost:3306/javahostingproject";
		String user="root";
		String password="Kothi@789";
	 String title = null,author = null,category = null;
	 int submit=0;
	 Double rating = null,price = null;
	 InputStream image = null,pdf = null;
DiskFileItemFactory factory = new	 DiskFileItemFactory();
ServletFileUpload fileUpload = new ServletFileUpload(factory);
List<FileItem> items;
try {
	items = fileUpload.parseRequest(req);
	for(FileItem item: items) {
		if(item.isFormField()) {
			String fieldName = item.getFieldName();
			if(fieldName.equals("title")) {
				 title = item.getString();
			}
			else if(fieldName.equals("author")) {
				author = item.getString();
			}
			else if(fieldName.equals("category")) {
				category=item.getString();
			}
			else if(fieldName.equals("rating")) {
				rating=Double.parseDouble(item.getString());
			}
			else if(fieldName.equals("price")) {
			price =	Double.parseDouble(item.getString());
			}
			else if(fieldName.equals("submit")) {
				submit=Integer.parseInt(item.getString());
				HttpSession session = req.getSession();
				session.setAttribute("submit", submit);
				  
			}
		}else {
			String fieldName1 = item.getFieldName();
			if(fieldName1.equals("image")) {
				 image = item.getInputStream();
			}
			else if(fieldName1.equals("pdf")) {
				pdf=item.getInputStream();
			}
			
		}
	}
	        Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, user, password);
			String sql="insert into `book_shelf`(book_title,author,category,rating,image,pdf,price) values(?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, author);
			pstmt.setString(3, category);
			pstmt.setDouble(4, rating);
			pstmt.setBinaryStream(5, image);
			pstmt.setBinaryStream(6, pdf);
			pstmt.setDouble(7, price);
			int i = pstmt.executeUpdate();
			System.out.println(i+"rows updated");
			  String sql2="select `book_id` from `book_shelf`where `book_title`=? and `author`=?";
			  pstmt2 = conn.prepareStatement(sql2);
			  pstmt2.setString(1, title);
			  pstmt2.setString(2, author);
			 ResultSet res = pstmt2.executeQuery();
			 while(res.next()==true) {
				 additionId = res.getString(1);
			 }
			 DAOAddition dao=new DAOAddition();
			 System.out.println("additionId"+additionId);
			 ArrayList additionList = dao.getData(additionId);
			 req.setAttribute("additionList", additionList);
			RequestDispatcher dispatcher = req.getRequestDispatcher("admin.jsp");
			dispatcher.forward(req, resp);
			conn.close();
			pstmt.close();
		} catch (ClassNotFoundException | SQLException | FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
