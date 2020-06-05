package com.ajava;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pojo.User;

/**
 * Servlet implementation class ManageUsers
 */
@WebServlet("/ManageUsers")
public class ManageUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//   int submit = Integer.parseInt(req.getParameter("submit"));
		System.out.println("in manager user servlt");
	int submit=6;
   HttpSession session = req.getSession();
   session.setAttribute("submit", submit);
   User users=new User();
   try {
	ArrayList l=users.userInfo();
	req.setAttribute("usersList", l);
	System.out.println("in manager user servlt end");
	RequestDispatcher dispatcher = req.getRequestDispatcher("admin.jsp");
	dispatcher.forward(req, resp);
	System.out.println("in manager user servlt ded end");
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
	}

}
