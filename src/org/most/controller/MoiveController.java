package org.most.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MoiveController extends Controller {
	private static final long serialVersionUID = 1L;
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewName = "/WEB-INF/views/";
		String reqUri = request.getRequestURI();
		int startIdx = reqUri.indexOf("MOST")+5; // 5는 MOST/ 의미
		reqUri = request.getRequestURI().substring(startIdx);
		
		
	}
}
