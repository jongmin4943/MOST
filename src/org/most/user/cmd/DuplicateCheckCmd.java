package org.most.user.cmd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.most.controller.ModelAndView;
import org.most.user.model.UserDao;
import org.most.user.model.UserDto;

public class DuplicateCheckCmd implements UserCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userID = req.getParameter("userID");
		System.out.println("userID : " + userID);
		System.out.println("length : " + userID.length());
		UserDao dao = new UserDao();
		UserDto dto = dao.selectOne(new UserDto(userID));
		PrintWriter out = resp.getWriter();
		String pattern = "^[a-zA-Z0-9]*$";
		JSONObject jobj = new JSONObject();
		if(userID.length()<4) {
			jobj.put("possible", "short");
		}else if(!(Pattern.matches(pattern, userID))) {
			jobj.put("possible", "special");
		}else if(dto != null) {
			jobj.put("possible", "duplicate");
		} else {
			jobj.put("possible", "possible");
		}
		out.print(jobj);
		return null;
	}

}
