package org.most.notice.cmd;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;
import org.most.notice.model.NoticeDao;
import org.most.notice.model.NoticeDto;

public class WriteCmd implements NoticeCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		if(req.getMethod().equals("GET")) {
			mav.setViewName("/WEB-INF/views/notice/write.jsp");
		} else {
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			NoticeDao dao = new NoticeDao();
			dao.insert(new NoticeDto(title,content));
			int no = dao.selectLastestNotice();
			mav.setViewName("detail.action?no="+no);
			mav.setRedirect(true);
		}
		return mav;
	}
	
	

}
