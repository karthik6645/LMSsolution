package com.ajava;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
 * Servlet implementation class DeleteBooks
 */
@WebServlet("/DeleteBooks")
public class DeleteBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletFileUpload fileUpload;
	private DiskFileItemFactory factory;
	private String delId;
	private String delTitle;
	private String delAuthor;
	private String delCategory;
	private String delTitle2;
	private String delAuthor2;
	private int submit;
	private String select;
	private RequestDispatcher dispatcher;
	private Connection conn;
	private PreparedStatement pstmt;
	private PreparedStatement pstmt2;
	private PreparedStatement pstmt3;
	private PreparedStatement pstmt4;
	private PreparedStatement pstmt5;
	private int pstmti;
	private int pstmt2i;
	private int pstmt3i;
	private int pstmt4i;
	private int pstmt5i;
@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	factory = new DiskFileItemFactory();
	fileUpload = new	ServletFileUpload(factory);
	try {
		List<FileItem> items = fileUpload.parseRequest(req);
		for(FileItem item : items) {
			if(item.isFormField()) {
				String fieldName = item.getFieldName();
				if(fieldName.equals("delId")) {
					delId = item.getString();
				}
				else if(fieldName.equals("delTitle")) {
					delTitle = item.getString();
				}
				else if(fieldName.equals("delAuthor")) {
					delAuthor = item.getString();
				}
				else if(fieldName.equals("delCategory")) {
					delCategory = item.getString();
				}
				else if(fieldName.equals("delTitle2")) {
					delTitle2 = item.getString();
				}
				else if(fieldName.equals("delAuthor2")) {
					delAuthor2 = item.getString();
				}
				else if(fieldName.equals("submit")) {
					submit = Integer.parseInt(item.getString());
					HttpSession session = req.getSession();
					session.setAttribute("submit", submit);
				}
				else if(fieldName.equals("selection")) {
					select = item.getString();
					System.out.println("in form"+select);
				}else {
					continue;
				}
			}
		}
		ArrayList<String> arrayList = new ArrayList<String>();
		arrayList.add(delId);
		arrayList.add(delTitle);
		arrayList.add(delAuthor);
		arrayList.add(delCategory);
		arrayList.add(delTitle2);
		arrayList.add(delAuthor2);
		System.out.println(arrayList);
		System.out.println("anto "+select);
		DAOAddition dao = new DAOAddition();
	ArrayList deleteList = dao.getData(arrayList, select );
//	DTO dto=(DTO)deleteList.get(0);
//	System.out.println("in deletebook servlet"+dto.getId());
	req.setAttribute("deleteList", deleteList);
	String url="jdbc:mysql://localhost:3306/javahostingproject";
	  String user="root";
	   String password="Kothi@789";
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url, user, password);
	if(select.equals("delId1")) {
	String sqlId="delete from `book_shelf` where `book_id`=?";
	pstmt = conn.prepareStatement(sqlId);
	pstmt.setString(1, delId);
	pstmti = pstmt.executeUpdate();
	System.out.println(pstmti+" row/s have/has updated");
	req.setAttribute("deleteVal", pstmti);
	}
	else if(select.equals("delTitle1")) {
	String sqlTitle="delete from `book_shelf` where `book_title`=?";
	pstmt2 = conn.prepareStatement(sqlTitle);
	pstmt2.setString(1, delTitle);
	pstmt2i = pstmt2.executeUpdate();
	System.out.println(pstmt2i+" row/s have/has updated");
	req.setAttribute("deleteVal", pstmt2i);
	}
	else if(select.equals("delAuthor1")) {
	String sqlAuthor="delete from `book_shelf` where `author`=?";
	pstmt3 = conn.prepareStatement(sqlAuthor);
	pstmt3.setString(1, delAuthor);
	pstmt3i = pstmt3.executeUpdate();
	System.out.println(pstmt3i+" row/s have/has updated");
	req.setAttribute("deleteVal", pstmt3i);
	}
	else if(select.equals("delCategory1")) {
	String sqlCategory="delete from `book_shelf` where `category`=?";
	pstmt4 = conn.prepareStatement(sqlCategory);
	pstmt4.setString(1, delCategory);
	pstmt4i = pstmt4.executeUpdate();
	System.out.println(pstmt4i+" row/s have/has updated");
	req.setAttribute("deleteVal", pstmt4i);
	}
	else if(select.equals("delBookAuthor")) {
	String sqlIdTitle="delete from `book_shelf` where `book_title`=? and `author`=?";
	pstmt5 = conn.prepareStatement(sqlIdTitle);
	pstmt5.setString(1, delTitle2);
	pstmt5.setString(2, delAuthor2);
	pstmt5i = pstmt5.executeUpdate();
	System.out.println(pstmt5i+" row/s have/has updated");
	req.setAttribute("deleteVal", pstmt5i);
	}
		dispatcher = req.getRequestDispatcher("admin.jsp");
		dispatcher.forward(req, resp);
		if(conn!=null) {conn.close();}
		if(pstmt!=null) {pstmt.close();}
		if(pstmt2!=null) {pstmt2.close();}
		if(pstmt3!=null) {pstmt3.close();}
		if(pstmt4!=null) {pstmt4.close();}
		if(pstmt5!=null) {pstmt5.close();}
	} catch (FileUploadException | ClassNotFoundException | SQLException e) {
		
		e.printStackTrace();
	}
	}
}
