package org.most.user.cmd;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;
import org.most.user.model.UserDao;
import org.most.user.model.UserDto;

public class SelectCmd implements UserCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		if(req.getMethod().equals("GET")) {
			mav.setViewName("/WEB-INF/views/user/login.jsp");
		} else {
			String userID = req.getParameter("userID");
			String userPassword = req.getParameter("userPassword");
			UserDao uDao = new UserDao();
			UserDto uDto = uDao.selectOne(new UserDto(userID,"","","",""));
			if(uDto == null) {
				System.out.println("아이디가 존재하지 않음");
				req.setAttribute("loginFail", "fail");
				mav.setViewName("/WEB-INF/views/user/login.jsp");
			} else if(uDto.getUserPassword().equals(userPassword)) {
				System.out.println("로그인성공");
				mav.setViewName(req.getContextPath());
				mav.setRedirect(true);
				req.getSession(true).setAttribute("userID", userID);
			} else {
				System.out.println("비밀번호 틀림");
				req.setAttribute("loginFail", "fail");
				mav.setViewName("/WEB-INF/views/user/login.jsp");
			}
		}
		return mav;
	}

}