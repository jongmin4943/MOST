package org.most.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ModelAndView {
	private String viewName = "";
	private boolean isRedirect = false;
	
	public ModelAndView() {}

	public ModelAndView(String viewName, boolean isRedirect) {
		this.viewName = viewName;
		this.isRedirect = isRedirect;
	}
	public String getViewName() {
		return viewName;
	}

	public void setViewName(String viewName) {
		this.viewName = viewName;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	public void forward(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(isRedirect) {
			resp.sendRedirect(viewName);
		} else {
			RequestDispatcher view = req.getRequestDispatcher(viewName);
			view.forward(req, resp);
		}
	}
	
}
