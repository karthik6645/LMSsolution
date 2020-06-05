package com.pojo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import com.ajava.DTO;
import com.ajava.ImageAndPdfDTO;

public class ImageDAO {
	String url="jdbc:mysql://localhost:3306/javahostingproject";
	String user="root";
	String password="Kothi@789";
	public LinkedHashMap getData(ArrayList<String> select,String searchSelection) throws ClassNotFoundException, SQLException {
		ArrayList list=new ArrayList();
		LinkedHashMap lmap =null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, user, password);
		ResultSet res=null;
		 if(searchSelection.equals("delId1")) {
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
	ImageAndPdfDTO ipdto = new	ImageAndPdfDTO();
	        lmap=new LinkedHashMap();
//			ipdto.setId(res.getString(1));
//		ipdto.setImage(res.getBytes(6));
		lmap.put(res.getString(1), res.getBytes(6));
	        
		}
		return lmap;
	}
	public LinkedHashMap getData(String id) throws SQLException, ClassNotFoundException {
		ArrayList list = new ArrayList();
		System.out.println("id in image DAO"+id);
		LinkedHashMap lmap =null;
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url, user, password);
		String sql="select * from `book_shelf` where `book_id`=? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		 ResultSet res = pstmt.executeQuery();
		 System.out.println("id in image DAO"+id);
		 while(res.next()==true) {
			 lmap=new LinkedHashMap();
			 lmap.put(res.getString(1), res.getBytes(6));
			 
		 }
		 return lmap;
	}
}
