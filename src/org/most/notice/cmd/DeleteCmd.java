package org.most.notice.cmd;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;
import org.most.notice.model.NoticeDao;

public class DeleteCmd implements NoticeCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		String no = req.getParameter("no");
		String[] noList = req.getParameterValues("selectedBoard");
		NoticeDao dao = new NoticeDao();
		if(noList == null) {
			dao.delete(no);
		} else {
			for(int i=0; i<noList.length; i++) {
				dao.delete(noList[i]);
			}
		}
		mav.setViewName("list.action");
		mav.setRedirect(true);
		return mav;
	}

}
