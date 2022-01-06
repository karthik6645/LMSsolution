package com.ajava;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.pojo.DAOAddition;

/**
 * Servlet implementation class SearchBooks
 */
@WebServlet("/SearchBooks")
public class SearchBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String searchSelection;
	private String selectId;
	private String searchTitle;
	private String searchAuthor;
	private String searchCategory;
	private int submit;
	private HttpSession session;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload fileUpload = new	ServletFileUpload(factory);
		DAOAddition dao = new DAOAddition();
         try {
			List<FileItem> items = fileUpload.parseRequest(req);
			for(FileItem item: items) {
				if(item.isFormField()) {
					String fieldName = item.getFieldName();
					if(fieldName.equals("searchSelection")) {
						searchSelection = item.getString();
					}
					else if(fieldName.equals("searchId")) {
						selectId = item.getString();
					}
					else if(fieldName.equals("searchTitle")) {
						searchTitle = item.getString();
					}
					else if(fieldName.equals("searchAuthor")) {
						searchAuthor = item.getString();
					}
					else if(fieldName.equals("searchCategory")) {
						searchCategory = item.getString();
					}
					else if(fieldName.equals("searchCategory")) {
						searchCategory = item.getString();
					}
					else if(fieldName.equals("submit")) {
						submit = Integer.parseInt(item.getString());
						session = req.getSession();
						session.setAttribute("submit", submit);
					}
				}else {
					continue;
				}
			}
		ArrayList<String> arrayList = new ArrayList<String>();
		arrayList.add(selectId);
		arrayList.add(searchTitle);
		arrayList.add(searchAuthor);
		arrayList.add(searchCategory);
		System.out.println(arrayList);
		System.out.println(searchSelection);
	ArrayList list = dao.getData(arrayList, searchSelection );
	System.out.println("in search servlet"+list);
	req.setAttribute("searchList", list);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
