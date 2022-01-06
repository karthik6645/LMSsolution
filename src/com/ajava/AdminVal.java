package com.ajava;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminVal
 */
@WebServlet("/AdminVal")
public class AdminVal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
		HttpSession session = req.getSession();
		int submit=0;
		session.setAttribute("submit", submit);
		int log=(int)session.getAttribute("logInSubmit");
		String users=(String)session.getAttribute("users");
		if(log==0) {
			session.setAttribute("notLogin", 1);
			RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
			dispatcher.forward(req, resp);
		}
		else if(log==1&& users.equals("admin")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("admin.jsp");
		dispatcher.forward(req, resp);
		
       }
		else if(log==1&& users.equals("user")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("user.jsp");
		dispatcher.forward(req, resp);
       }
    }

}
