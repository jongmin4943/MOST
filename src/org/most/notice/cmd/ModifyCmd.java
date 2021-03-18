package org.most.notice.cmd;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;
import org.most.notice.model.NoticeDao;
import org.most.notice.model.NoticeDto;

public class ModifyCmd implements NoticeCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		NoticeDao dao = new NoticeDao();
		if(req.getMethod().equals("GET")) {
			String no = req.getParameter("no");
			NoticeDto notice = dao.selectOne(no);
			req.setAttribute("notice", notice);
			mav.setViewName("/WEB-INF/views/notice/modify.jsp");
		} else {
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String no = req.getParameter("no");
			NoticeDto notice = new NoticeDto(no, title, content,"","");
			dao.update(notice);
			mav.setViewName("detail.action?no="+no);
			mav.setRedirect(true);
		}
		return mav;
	}

}
