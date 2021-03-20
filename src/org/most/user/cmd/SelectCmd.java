package org.most.user.cmd;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;
import org.most.likedOST.model.LikedOstDao;
import org.most.ost.model.OstUserDto;
import org.most.user.model.UserDao;
import org.most.user.model.UserDto;

public class SelectCmd implements UserCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		if(req.getMethod().equals("GET")) {
			String header = req.getHeader("referer");
			if(header.equals("http://localhost:8888/MOST/user/join.action")) {
				header = (String)req.getSession().getAttribute("header");
			} else if(header.equals("http://localhost:8888/MOST/user/resetPw.action")) {
				header = "http://localhost:8888/MOST/";
			}
			req.getSession().setAttribute("header", header);
			mav.setViewName("/WEB-INF/views/user/login.jsp");
		} else {
			String header = (String)req.getSession().getAttribute("header");
			String userID = req.getParameter("userID");
			String userPassword = req.getParameter("userPassword");
			UserDao uDao = new UserDao();
			UserDto uDto = uDao.selectOne(new UserDto(userID,"","","",""));
			if(uDto == null) {
//				System.out.println("아이디가 존재하지 않음");
				req.setAttribute("loginFail", "fail");
				mav.setViewName("/WEB-INF/views/user/login.jsp");
			} else if(uDto.getUserPassword().equals(userPassword)) {
//				System.out.println("로그인성공");
				mav.setViewName(header);
				mav.setRedirect(true);
				req.getSession(true).setAttribute("userID", userID);
				if(userID != null) {
					List<OstUserDto> userList = new LikedOstDao().selectUsersLikes(userID);
					List<String> encodedOstName = new ArrayList<>();
					for(OstUserDto a : userList) {
						encodedOstName.add(URLEncoder.encode(a.getOstName()));
					}
					req.getServletContext().setAttribute("userChoice", userList);
					req.getServletContext().setAttribute("eon", encodedOstName);
				}
			} else {
//				System.out.println("비밀번호 틀림");
				req.setAttribute("loginFail", "fail");
				mav.setViewName("/WEB-INF/views/user/login.jsp");
			}
		}
		return mav;
	}

}
