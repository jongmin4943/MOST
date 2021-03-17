package org.most.user.cmd;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;
import org.most.user.model.UserDao;
import org.most.user.model.UserDto;

public class ModifyCmd implements UserCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		if(req.getMethod().equals("GET")) {
			mav.setViewName("/WEB-INF/views/user/forgotPw.jsp");
		} else {
			String userID = req.getParameter("userID");
			String userName = req.getParameter("userName");
			String userEmail = req.getParameter("userEmail");
			UserDao uDao = new UserDao();
			UserDto uDto = uDao.selectOne(new UserDto(userID,"","","",""));
			if(uDto != null && uDto.getUserName().equals(userName) && uDto.getUserEmail().equals(userEmail)) {
				req.getSession().setAttribute("temp", userID);
				mav.setViewName("resetPw.action");
				mav.setRedirect(true);
			} else {
				req.setAttribute("info", "empty");
				mav.setViewName("/WEB-INF/views/user/forgotPw.jsp");
				//System.out.println("정보가 일치하지 않습니다.");
			}
		}
		
		return mav;
	
				
	}

}
