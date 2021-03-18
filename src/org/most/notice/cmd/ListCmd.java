package org.most.notice.cmd;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;
import org.most.notice.model.NoticeDao;
import org.most.notice.model.NoticeDto;

public class ListCmd implements NoticeCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		String p = req.getParameter("p")==null?"1":req.getParameter("p");
		int page = 1;
		try {
			page = Integer.parseInt(p);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		NoticeDao dao = new NoticeDao();
		List<NoticeDto> list = dao.selectCurrPage(page);
		int cnt = dao.selectCount();
		cnt = (int)Math.ceil(cnt/(double)10);
		req.setAttribute("list", list);
		req.setAttribute("cnt", cnt);
		mav.setViewName("/WEB-INF/views/notice/list.jsp");
		return mav;
	}

}
