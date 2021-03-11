package org.most.user.cmd;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;
import org.most.user.model.UserDao;
import org.most.user.model.UserDto;

public class ResetPwCmd implements UserCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		if(req.getMethod().equals("GET")) {
			mav.setViewName("/WEB-INF/views/user/resetPw.jsp");
		} else {
			String userID = req.getParameter("userID");
			String userPassword = req.getParameter("userPassword");
			UserDao uDao = new UserDao();
			uDao.update(new UserDto(userID,userPassword,"","",""));
			req.getSession().removeAttribute("temp");
			mav.setViewName(req.getContextPath());
			mav.setRedirect(true);
		}
		return mav;
	}

}
