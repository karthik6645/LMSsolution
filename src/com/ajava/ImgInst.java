package com.ajava;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ImgInst {
public static void main(String[] args) throws SQLException, FileNotFoundException, ClassNotFoundException {
	Class.forName("com.mysql.cj.jdbc.Driver");
	String url="jdbc:mysql://localhost:3306/javahostingproject";
	String user="root";
	String password="Kothi@789";
	Connection conn = DriverManager.getConnection(url, user, password);
	String sql="update `bookinfo` set `image`=?,`pdf`=? where `book_id`=1";
	System.out.println(sql);
	PreparedStatement pstmt = conn.prepareStatement(sql);
	String imgPath="C:\\Users\\thatipati\\eclipse-workspace\\AdvanceJavaProject\\WebContent\\pdf's\\Living in the Light_ A guide to personal transformation ( PDFDrive.com ).pdf";
	FileInputStream fis= new FileInputStream(imgPath);
	pstmt.setBinaryStream(1, fis);
	String pdfPath="C:\\Users\\thatipati\\eclipse-workspace\\AdvanceJavaProject\\WebContent\\pdf's\\rich dad text.txt";
	FileReader file=new FileReader(pdfPath);
	pstmt.setCharacterStream(2, file);
	int i = pstmt.executeUpdate();
	System.out.println(i+"row has been affected");
	
}
}
