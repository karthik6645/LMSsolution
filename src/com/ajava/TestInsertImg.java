package com.ajava;

import java.io.IOException;
import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;



@WebServlet("/TestInsertImg")
public class TestInsertImg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   @Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//	  InputStream stream=null;
//	  String id=null,name=null;
//	 DiskFileItemFactory factory = new  DiskFileItemFactory();
//	 File file=new File("C:\\Users\\thatipati\\eclipse-workspace\\AdvanceJavaProject\\WebContent\\pdf's\\");
//	 factory.setRepository(file);
//            ServletFileUpload FileUpload = new ServletFileUpload(factory);
//	List<FileItem> items;
//	try {
//		items = FileUpload.parseRequest(req);
//		for(FileItem item: items) {
//			if(item.isFormField()) {
//				 
//			}else {
////				 stream = item.getInputStream();
//				item.write(new File("C:\\Users\\thatipati\\Desktop\\Full Stack Mentoring\\java\\DemoFiles1\\"+item.getName()));
//			}
//		}
//          System.out.println("id is "+id);
//          System.out.println("name is "+name);
//	} catch (Exception e1) {
//		
//		e1.printStackTrace();
//	}
//		String url="jdbc:mysql://localhost:3306/javahostingproject";
//		String user="root";
//		String password="Kothi@789";
//		try {
//			Class.forName("com.mysql.cj.jdbc.Driver");
//		Connection conn = DriverManager.getConnection(url, user, password);
////		System.out.println("id is"+id);
//			String sql="select * from book_shelf";
//			PreparedStatement pstmt = conn.prepareStatement(sql);
//			pstmt.setBinaryStream(1, stream);
//			int i = pstmt.executeUpdate();
//			System.out.println(i+"has affected");
//		}
//		catch(ClassNotFoundException | SQLException e) {
//			e.printStackTrace();
//		}
}
}
