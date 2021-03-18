package org.most.admin.cmd;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.comment.model.CommentDao;
import org.most.controller.ModelAndView;
import org.most.likedOST.model.LikedOstDao;
import org.most.ost.model.OstDao;
import org.most.user.model.UserDao;
import org.most.user.model.UserDto;

public class DeleteCmd implements AdminCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		if(req.getMethod().equals("POST")) {
			String[] userIDList = req.getParameterValues("selectedUser");
			UserDao uDao = new UserDao();
			CommentDao commentDao = new CommentDao();
			LikedOstDao loDao = new LikedOstDao();
			OstDao oDao = new OstDao();
			for(String userID:userIDList) {
				commentDao.deleteAll(userID);
				loDao.deleteAll(userID);
				uDao.delete(new UserDto(userID));
			}
			oDao.deleteLikedOstNull();
			mav.setViewName("list.action");
			mav.setRedirect(true);
		}
		return mav;
	}
}
