package org.most.admin.cmd;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;
import org.most.user.model.UserDao;

public class ListCmd implements AdminCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		if(req.getMethod().equals("GET")) {
			String p = req.getParameter("p")==null?"1":req.getParameter("p");
			UserDao uDao = new UserDao();
			int page = 1;
			try {
				page = Integer.parseInt(p);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			List<Object> list = uDao.selectCurrPage(page);
			int cnt = uDao.selectCount();//-1은 admin 제외
			req.setAttribute("total", cnt);
			cnt = (int)Math.ceil(cnt/(double)10);
			req.setAttribute("list", list);
			req.setAttribute("cnt", cnt);
			mav.setViewName("/WEB-INF/views/admin/list.jsp");
		}
		return mav;
	}

}
