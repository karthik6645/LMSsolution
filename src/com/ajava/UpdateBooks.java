package com.ajava;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
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
import com.pojo.ImageDAO;
import com.pojo.PdfDAO;

/**
 * Servlet implementation class UpdateBooks
 */
@WebServlet("/UpdateBooks")
public class UpdateBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String oldTitle;
	private String oldAuthor;
	private String newTitle;
	private String newAuthor;
	private String newCategory;
	private int submit;
	private InputStream newImage;
	private InputStream newPdf;
//	private double newRating;
//	private double newPrice;
	private ResultSet res;
	private String dbTitle;
	private String dbAuthor;
	private String dbCategory;
	private String newRating;
	private String dbRating;
	private InputStream dbImage;
	private InputStream dbPdf;
	private String dbPrice;
	private String newPrice;
	private RequestDispatcher dispatcher;
	private String pdfName;
	private String imageName;
	private long imageSize;
	private long pdfSize;
	private String dbId;
	private String newId;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   @Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   String url="jdbc:mysql://localhost:3306/javahostingproject"; 
	 
	   String user="root";
	   String password="Kothi@789";
	   DiskFileItemFactory factory = new DiskFileItemFactory();
	  ServletFileUpload fileUpload = new ServletFileUpload(factory);
	 
	   try {
		   Class.forName("com.mysql.cj.jdbc.Driver");
		   List<FileItem> items = fileUpload.parseRequest(req);
		   for(FileItem item: items) {
			   if(item.isFormField()) {
				   String fieldName = item.getFieldName();
				   if(fieldName.equals("oldTitle")) {
						  oldTitle = item.getString();
					  }
					  else if(fieldName.equals("oldAuthor")) {
						  oldAuthor = item.getString();
					  }
		   }
		   }
			Connection conn = DriverManager.getConnection(url, user, password);
			String sql2="select * from `book_shelf` where `book_title`=? and `author`=?";
		  PreparedStatement pstmt2 = conn.prepareStatement(sql2);
		  pstmt2.setString(1, oldTitle);
		  pstmt2.setString(2, oldAuthor);
		  res = pstmt2.executeQuery();
		  while(res.next()==true) {
			  dbId = res.getString(1);
			  dbTitle = res.getString(2);
			  System.out.println("in res"+dbTitle);
			  dbAuthor = res.getString(3);
			  System.out.println("in res"+dbAuthor);
			  dbCategory = res.getString(4);
			  System.out.println("in res"+dbCategory);
			 dbRating = res.getString(5);
			 System.out.println("in res"+dbRating);
			 dbImage = res.getBinaryStream(6);
			
			dbPdf = res.getBinaryStream(7);
			
			 dbPrice = res.getString(8);
			 System.out.println("in res"+dbPrice);
		  }
		DAOAddition dao = new DAOAddition();
		ArrayList bUpdate = dao.getData(dbId);
//		ImageDAO imageDAO = new ImageDAO();
//		LinkedHashMap uiMap = imageDAO.getData(dbId);
//		PdfDAO pdfDAO = new PdfDAO();
//		LinkedHashMap upMap = pdfDAO.getData(dbId);
//		HttpSession session2 = req.getSession();
//		session2.setAttribute("uiMap",uiMap );
//		session2.setAttribute("upMap", upMap);
//		req.setAttribute("uiMap", uiMap);
//		req.setAttribute("upMap", upMap);
		req.setAttribute("updateList", bUpdate);
		   for(FileItem item: items) {
			  if(item.isFormField()) {
				  String fieldName = item.getFieldName();
				  if(fieldName.equals("newTitle")) {
					   newTitle = item.getString();
					   System.out.println("in fecth"+newTitle);
					   if(newTitle.equals("")) {
						   newTitle=dbTitle;
						   System.out.println("in fecth if"+newTitle);
					   }
				  }
				  else if(fieldName.equals("newAuthor")) {
					  newAuthor = item.getString();
					  System.out.println("in fecth"+newAuthor);
					  if(newAuthor.equals("")) {
						   newAuthor=dbAuthor;
						   System.out.println("in fecth if"+newAuthor);
					   }
				  }
				  else if(fieldName.equals("newCategory")) {
					  newCategory= item.getString();
					  System.out.println("in fecth"+newCategory);
					  if(newCategory.equals("")) {
						   newCategory=dbCategory;
						   System.out.println("in fecth if"+newCategory);
					   }
					  }
				  else if(fieldName.equals("newRating")) {
					   newRating = item.getString();
					   System.out.println("in fecth "+newRating);
					  if(newRating.equals("")) {
						  newRating=dbRating;
						  System.out.println("in fecth if"+newRating);
					  } 
				  }
				  else if(fieldName.equals("newPrice")) {
					  newPrice = item.getString();
					  System.out.println("in fecth "+newPrice);
					  if(newPrice.equals("")) {
						  newPrice=dbPrice;
						  System.out.println("in fecth if "+newPrice);
					  }
				  }
				  else if(fieldName.equals("submit")) {
					 submit = Integer.parseInt(item.getString());
					 HttpSession session = req.getSession();
					 session.setAttribute("submit", submit);
				  }
			  }else {
				  String fieldName1 = item.getFieldName();
				  if(fieldName1.equals("newImage")) {
					  newImage = item.getInputStream();
				imageSize = item.getSize();
					  System.out.println("in fecth size "+imageSize);
					  if(imageSize==0) {
						   newImage=dbImage;
						   System.out.println("in fecth if "+imageSize);
					   }
				  }
				  else if(fieldName1.equals("newPdf")) {
					newPdf = item.getInputStream(); 
				      pdfSize = item.getSize();
					  System.out.println("in fecth size "+pdfSize);
					 if(pdfSize==0) {
						   newPdf=dbPdf;
						   System.out.println("in fecth if "+pdfSize);
					   }
				  }
			  }
		   }
		
	
		String sql="update `book_shelf` "
	     + "set `book_title`=?,`author`=?,`category`=?,`rating`=?,`image`=?,`pdf`=?,`price`=? "
	     + "where `book_title`=? and `author`=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, newTitle);
		pstmt.setString(2, newAuthor);
		pstmt.setString(3, newCategory);
		pstmt.setString(4, newRating);
		pstmt.setBinaryStream(5, newImage);
		pstmt.setBinaryStream(6, newPdf);
		pstmt.setString(7, newPrice);
		pstmt.setString(8, oldTitle);
		pstmt.setString(9, oldAuthor);
		long l = pstmt.executeLargeUpdate();
		req.setAttribute("updateVal", l);
		System.out.println(l+" rows has updated");
		DAOAddition dao2 = new DAOAddition();
		String sql3="select * from `book_shelf` where `book_title`=? and `author`=?";
		  PreparedStatement pstmt3 = conn.prepareStatement(sql2);
		  pstmt3.setString(1, newTitle );
		  pstmt3.setString(2, newAuthor);
		  res = pstmt3.executeQuery();
while(res.next()==true) {
	newId = res.getString(1);
	
}
ArrayList aUpdate = dao2.getData(newId);
req.setAttribute("aUpdate", aUpdate);

		dispatcher = req.getRequestDispatcher("admin.jsp");
		dispatcher.forward(req, resp);
		conn.close();
		pstmt.close();
		pstmt2.close();
	} catch (SQLException | FileUploadException | ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

}
