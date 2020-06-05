<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.io.*,java.sql.*,javax.servlet.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<p>inga emo</p>
<%
response.setContentType("image/jpg");
	byte[] image=null;
    	ServletOutputStream os = response.getOutputStream();
    	String url="jdbc:mysql://localhost:3306/javahostingproject";
    	String user="root";
    	String password="Kothi@789";
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, user, password);
			Statement stmt = conn.createStatement();
			String sql="select image from `bookinfo`";
			ResultSet res = stmt.executeQuery(sql);
		     if( res.next()==true) {
		    	
		image = res.getBytes(1);
			 os.write(image);
			 out.println("hi in jsp");
		     }
		} catch (ClassNotFoundException | SQLException e) {
		
			e.printStackTrace();
		}
    	
    	%>
</body>
</html>