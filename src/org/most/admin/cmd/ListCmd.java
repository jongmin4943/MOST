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
			UserDao uDao = new UserDao();
			List<Object> list = uDao.selectAll();
			req.setAttribute("list", list);
			mav.setViewName("/WEB-INF/views/admin/list.jsp");
		}
		return mav;
	}

}
