package org.most;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/*")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void control(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewName = "/WEB-INF/views/";
		String reqUri = request.getRequestURI();
		int startIdx = reqUri.indexOf("MOST")+5; // 5는 MOST/ 의미
		reqUri = request.getRequestURI().substring(startIdx);
		String method = request.getMethod();
		System.out.println(reqUri);
		if("user/join.action".equals(reqUri)) {
			if(method.equals("GET")) {
				viewName += "user/join.jsp";
			} else {
				
			}
		} else if("user/forgotPw.action".equals(reqUri)) {
			viewName += "user/forgotPw.jsp";
		} else if("user/delete.action".equals(reqUri)) {
			viewName += "user/delete.jsp";
		} else if("user/login.action".equals(reqUri)) {
			viewName += "user/login.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(viewName);
		view.forward(request, response);
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		control(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		control(request, response);
	}

}
