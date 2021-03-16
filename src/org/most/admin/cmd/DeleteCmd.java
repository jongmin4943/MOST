package org.most.admin.cmd;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;
import org.most.user.model.UserDao;
import org.most.user.model.UserDto;

public class DeleteCmd implements AdminCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		if(req.getMethod().equals("POST")) {
			String[] userIDList = req.getParameterValues("selectedUser");
			UserDao uDao = new UserDao();
			for(String userID:userIDList) {
				uDao.delete(new UserDto(userID));
			}
			mav.setViewName("list.action");
			mav.setRedirect(true);
		}
		return mav;
	}
}
