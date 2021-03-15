package org.most.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.action")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DispatcherServlet() {
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		//uri에 따른 뷰페이지 분기
		String reqUri = req.getRequestURI();
		String ctxPath = req.getContextPath();
		String path = reqUri.substring(ctxPath.length());
		
		int endIdx = path.indexOf("/", 1);
		int endIdx2 = path.lastIndexOf("/");
		String path2 = path.substring(endIdx2);
		req.setAttribute("path", path2);
		String frontPath = path.substring(0, endIdx);
		//System.out.println("frontPath => " + frontPath); // "/saram/list.action"
		// saram으로 갈지 board로 갈지 분기 시킨다.
		
		Controller ctrl = null;
		if("/user".equals(frontPath)) {
			ctrl = new UserController();
		} else if("/ost".equals(frontPath)) {
			ctrl = new OstController();
		}
		
		if(ctrl != null)
			ctrl.doProcess(req, resp);
		else
			System.out.println("지정 된 패스가 없다!");
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
