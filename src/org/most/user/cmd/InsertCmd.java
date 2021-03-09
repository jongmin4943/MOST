package org.most.user.cmd;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;
import org.most.user.model.UserDao;
import org.most.user.model.UserDto;

public class InsertCmd implements UserCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		if("GET".equals(req.getMethod())) {
			mav.setViewName("/WEB-INF/views/user/join.jsp");
		} else {
			String userID = req.getParameter("userID");
			String userPassword = req.getParameter("userPassword");
			String userName = req.getParameter("userName");
			String userEmail = req.getParameter("userEmail");
			UserDao uDao = new UserDao();
			uDao.insert(new UserDto(userID,userPassword,userName,userEmail,""));
			mav.setViewName("login.action");
			mav.setRedirect(true);
		}
		
		return mav;
	}

}
