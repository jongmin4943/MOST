package org.most.notice.cmd;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;
import org.most.notice.model.NoticeDao;
import org.most.notice.model.NoticeDto;

public class DetailCmd implements NoticeCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		String no = req.getParameter("no");
		NoticeDao dao = new NoticeDao();
		NoticeDto notice = dao.selectOne(no);
		NoticeDto nextNotice = dao.selectNext(no);
		NoticeDto preNotice = dao.selectpre(no);
		dao.updateNoticeHit(no);
		req.setAttribute("notice", notice);
		req.setAttribute("pre", preNotice);
		req.setAttribute("next", nextNotice);
		mav.setViewName("/WEB-INF/views/notice/detail.jsp");
		return mav;
	}

}
