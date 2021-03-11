package org.most.ost.cmd;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;

public class ListCmd implements OstCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		if(req.getMethod().equals("GET")) {
			mav.setViewName("/WEB-INF/views/ost/list.jsp");
		} else {
			String keyword = req.getParameter("search");
			String option = req.getParameter("option");
			// keyword 검색어
			// option 카테고리
			// 이거 두개를 가지고 list.jsp로 간다
			// list.jsp에서 가지고간 두개로 ajax검색시스템을 만들어 뿌려준다.
			mav.setViewName("/WEB-INF/views/ost/list.jsp");
		}
		return mav;
	}

}
