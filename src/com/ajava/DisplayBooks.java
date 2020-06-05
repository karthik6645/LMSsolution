package com.ajava;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pojo.DAOAddition;

/**
 * Servlet implementation class DisplayBooks
 */
@WebServlet("/DisplayBooks")
public class DisplayBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	DAOAddition dao = new DAOAddition();
	ArrayList list=null;
	try {
		list = dao.getData();
		System.out.println("list obj in servlet"+list.get(2));
	} catch (SQLException | ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	req.setAttribute("list", list);
//	int submit = Integer.parseInt(req.getParameter("displayselect"));
	int submit=2;
	HttpSession session = req.getSession();
	session.setAttribute("submit", submit);
	  HttpSession session2 = req.getSession();
      String users= (String)session2.getAttribute("users");
       if(users.equals("admin")) {
       RequestDispatcher dispatcher = req.getRequestDispatcher("admin.jsp");
       dispatcher.forward(req, resp);
       }
       else if(users.equals("user")){
      	 RequestDispatcher dispatcher = req.getRequestDispatcher("user.jsp");
           dispatcher.forward(req, resp);

       }
	
}
}
