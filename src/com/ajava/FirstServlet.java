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
 * Servlet implementation class FirstServlet
 */
@WebServlet("/FirstServlet")
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LocalDate now = LocalDate.now();
		int year = now.getYear();
		int month = now.getMonthValue();
		int dayOfMonth = now.getDayOfMonth();
		System.out.println("year: "+year+" Month: "+month+" dayOfMonth: "+dayOfMonth);
		LocalTime now2 = LocalTime.now();
		int hour = now2.getHour();
		int minute = now2.getMinute();
		int second = now2.getSecond();
		System.out.println("hour: "+hour+" minitues: "+minute+" second: "+second);
		int submitUp=0;
		HttpSession session = req.getSession();
		session.setAttribute("submitUp", submitUp);
		String s1="correct";
		
		int submit=0;
		session.setAttribute("submit", submit);//admin.jsp navigation
	 	session.setAttribute("inCorrectl", s1);// login 
	 	session.setAttribute("logInSubmit", 0);//loginsubmit
	 	 session.setAttribute("exists", "notExists");//already exists customer
	 	session.setAttribute("dbemail", "email");//forgotPassword
	 	session.setAttribute("forgotSubmit", 0);//forgotPassword
	 	session.setAttribute("newPassSubmit", 0);//new password setting
	 	session.setAttribute("users", "none");//checking admin or user
	 	session.setAttribute("notLogin", 0);//not login clicked dashborad option
	 	 session.setAttribute("existsAdmin", "notExists");//in admin user already exists
	 	 session.setAttribute("deletes", "notDeleted");//users delete
	 	session.setAttribute("deletedUser", "none");// users delete email
	 	session.setAttribute("added", "notAdded");//users addition
	 	 session.setAttribute("addedUser", "none" );//user details
	 	session.setAttribute("updated", "notUpdated");//users update
	 	session.setAttribute("updatedUser", "none");//updated user email
	 	session.setAttribute("updatedUserDisplay", "user");//updated user email
		RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
		dispatcher.forward(req, resp);
		
	}

}
