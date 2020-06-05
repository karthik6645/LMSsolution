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

import com.pojo.PdfDAO;

/**
 * Servlet implementation class imageDisplay2
 */
@WebServlet("/imageDisplay2")
public class imageDisplay2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletOutputStream os=null;
		byte[] image=null;
		HttpSession session = req.getSession();
		LinkedHashMap uiMap = (LinkedHashMap)session.getAttribute("uiMap");
		String id = req.getParameter("id");
		Set<String> set = uiMap.keySet();
		for(String key: set) {
			if(key.equals(id)) {
				 image = (byte[])uiMap.get(key);
				 System.out.println("image in "+image);
				 System.out.println("key"+key);
				 System.out.println("key"+id);
				 
			}
		}
	
		os.write(image);
		
	}

}
