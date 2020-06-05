package com.pojo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ajava.DTO;

public class DAOAddition {
	static String url="jdbc:mysql://localhost:3306/javahostingproject";
	static String user="root";
	static String password="Kothi@789";
public ArrayList getData() throws SQLException, ClassNotFoundException {
	ArrayList list = new ArrayList();
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, user, password);
	String sql="select * from`book_shelf`";
	 Statement stmt = conn.createStatement();
	 ResultSet res = stmt.executeQuery(sql);
	 while(res.next()==true) {
		 DTO dto = new DTO();
	dto.setId(res.getString(1));
		dto.setTitle(res.getString(2));
		dto.setAuthor(res.getString(3));
		 dto.setRating(res.getString(4));
		 dto.setCategory(res.getString(5));
		dto.setPrice(res.getString(8));
		list.add(dto);
	 }
	return list;	
}
public ArrayList getData(ArrayList<String> select,String searchSelection) throws ClassNotFoundException, SQLException {
	ArrayList list=new ArrayList();
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, user, password);
	ResultSet res=null;
	
	if(searchSelection.equals("id")) {
	String sql="select * from `book_shelf` where `book_id`=? ";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, select.get(0));
	 res = pstmt.executeQuery();
	 if(res.next()==false) {DTO dto=new DTO();
	 dto.setEmpty(1);
	 list.add(dto); 
	 System.out.println("in if empty");
	 return list;}
	 System.out.println("after in if id in dao addition");
	 res.previous();
	}
	else if(searchSelection.equals("book_title")){
	String sql2="select * from `book_shelf` where `book_title`=? ";
	PreparedStatement pstmt = conn.prepareStatement(sql2);
	pstmt.setString(1, select.get(1));
	 res = pstmt.executeQuery();
	
	 if(res.next()==false) {DTO dto=new DTO();
	 dto.setEmpty(1);
	 
	 list.add(dto); 
	 System.out.println("in if empty");
	 return list;}
	 res.previous();
	}
//	System.out.println("after in if title in dao addition");
	else if(searchSelection.equals("author")) {
	String sql3="select * from `book_shelf` where `author`=? ";
	PreparedStatement pstmt = conn.prepareStatement(sql3);
	pstmt.setString(1, select.get(2));
	 res = pstmt.executeQuery();
	 
	 if(res.next()==false) {DTO dto=new DTO();
	 
	 dto.setEmpty(1);
	 list.add(dto);  System.out.println("in if empty");return list;}
	 res.previous();
	}
//	System.out.println("after in if author in dao addition");
	else if(searchSelection.equals("category")) {
	String sql4="select * from `book_shelf` where `category`=? ";
	PreparedStatement pstmt = conn.prepareStatement(sql4);
	pstmt.setString(1, select.get(3));
	 res = pstmt.executeQuery();
	 if(res.next()==false) {DTO dto=new DTO();
	 dto.setEmpty(1);
	 list.add(dto); System.out.println("in if empty"); return list;}
	 res.previous();
	 }
	
	
	
	
	else if(searchSelection.equals("delId1")) {
		String sql="select * from `book_shelf` where `book_id`=? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, select.get(0));
		 res = pstmt.executeQuery();
		}
		else if(searchSelection.equals("delTitle1")){
		String sql2="select * from `book_shelf` where `book_title`=? ";
		PreparedStatement pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1, select.get(1));
		 res = pstmt.executeQuery();
		}
		else if(searchSelection.equals("delAuthor1")) {
		String sql3="select * from `book_shelf` where `author`=? ";
		PreparedStatement pstmt = conn.prepareStatement(sql3);
		pstmt.setString(1, select.get(2));
		 res = pstmt.executeQuery();
		}
		else if(searchSelection.equals("delCategory1")) {
		String sql4="select * from `book_shelf` where `category`=? ";
		PreparedStatement pstmt = conn.prepareStatement(sql4);
		pstmt.setString(1, select.get(3));
		 res = pstmt.executeQuery();
		 }
	else if(searchSelection.equals("delBookAuthor")) {
		String sql5="select * from `book_shelf` where `book_title`=? and `author`=?";
		PreparedStatement pstmt = conn.prepareStatement(sql5);
		pstmt.setString(1, select.get(4));
		pstmt.setString(2, select.get(5));
		 res = pstmt.executeQuery();
	}
	
	while(res.next()==true) {
		DTO dto=new DTO();
		dto.setId(res.getString(1));
		System.out.println("delId" +res.getString(1));
	    dto.setTitle(res.getString(2));
		dto.setAuthor(res.getString(3));
		 dto.setCategory(res.getString(4));
		 dto.setRating(res.getString(5));
		dto.setPrice(res.getString(8));
         list.add(dto);
	}
	return list;
}
public static void main(String[] args) throws ClassNotFoundException, SQLException {
//	String sql="select * from `book_shelf` where `book_id`=? ";
//	Class.forName("com.mysql.cj.jdbc.Driver");
//	ResultSet res=null;
//	Connection conn = DriverManager.getConnection(url, user, password);
//	
//	PreparedStatement pstmt = conn.prepareStatement(sql);
//	pstmt.setString(1, "30");
//	 res = pstmt.executeQuery();
//	 System.out.println("res"+res.next());
//	 while(res.next()==true) {
//			DTO dto=new DTO();
//			dto.setId(res.getString(1));
//			System.out.println("delId" +res.getString(1));
//		    dto.setTitle(res.getString(2));
//			dto.setAuthor(res.getString(3));
//			 dto.setRating(res.getString(4));
//			 dto.setCategory(res.getString(5));
//			dto.setPrice(res.getString(8));
//	         
//		}
}
//public ArrayList getData(String oldTitle ,String oldAuthor) throws SQLException, ClassNotFoundException {
//	ArrayList list = new ArrayList();
//	Class.forName("com.mysql.cj.jdbc.Driver");
//	Connection conn = DriverManager.getConnection(url, user, password);
//	String sql="select * from`book_shelf`";
//	 Statement stmt = conn.createStatement();
//	 ResultSet res = stmt.executeQuery(sql);
//	 while(res.next()==true) {
//		 DTO dto = new DTO();
//	dto.setId(res.getString(1));
//		dto.setTitle(res.getString(2));
//		dto.setAuthor(res.getString(3));
//		 dto.setRating(res.getString(4));
//		 dto.setCategory(res.getString(5));
//		dto.setPrice(res.getString(8));
//		list.add(dto);
//	 }
//	 return list;	
//}
public ArrayList getData(String id) throws SQLException, ClassNotFoundException {
	ArrayList list = new ArrayList();
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, user, password);
	String sql="select * from `book_shelf` where `book_id`=? ";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	 ResultSet res = pstmt.executeQuery();
	 while(res.next()==true) {
		 DTO dto = new DTO();
	dto.setId(res.getString(1));
		dto.setTitle(res.getString(2));
		dto.setAuthor(res.getString(3));
		 dto.setRating(res.getString(4));
		 dto.setCategory(res.getString(5));
		dto.setPrice(res.getString(8));
		list.add(dto);
	 }
	 return list;
}
}
