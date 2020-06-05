package com.ajava;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PdfDispaly2
 */
@WebServlet("/PdfDispaly2")
public class PdfDispaly2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletOutputStream os=null;
		byte[] pdf=null;
		HttpSession session = req.getSession();
		LinkedHashMap upMap = (LinkedHashMap)session.getAttribute("uiMap");
		String id = req.getParameter("id");
		Set<String> set = upMap.keySet();
		for(String key: set) {
			if(key.equals(id)) {
				 pdf = (byte[])upMap.get(key);
				 System.out.println("pdf in pdf"+pdf);
				 System.out.println("key in pdf"+key);
				 System.out.println("key in pdf"+id);
			}
		}
	
		os.write(pdf);
		
	}

}
