package org.most.user.cmd;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;
import org.most.user.model.UserDao;
import org.most.user.model.UserDto;

public class DeleteCmd implements UserCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		UserDao uDao = new UserDao();
		String userID = (String)req.getSession().getAttribute("userID");
		uDao.delete(new UserDto(userID,"","","",""));
		req.getSession().invalidate();
		mav.setViewName(req.getContextPath());
		mav.setRedirect(true);
		return mav;
	}

}
