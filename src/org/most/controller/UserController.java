package org.most.controller;

import java.io.IOException;
import java.util.Hashtable;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.user.cmd.DeleteCmd;
import org.most.user.cmd.InsertCmd;
import org.most.user.cmd.LogoutCmd;
import org.most.user.cmd.ModifyCmd;
import org.most.user.cmd.ResetPwCmd;
import org.most.user.cmd.SelectCmd;
import org.most.user.cmd.UserCommand;
import org.most.user.model.UserDao;
import org.most.user.model.UserDto;

public class UserController extends Controller {
	private static final long serialVersionUID = 1L;
	
	static Hashtable<String, UserCommand> cmdMapper = new Hashtable<String, UserCommand>();
	static {
		cmdMapper.put("/join.action", new InsertCmd());
		cmdMapper.put("/login.action", new SelectCmd());
		cmdMapper.put("/delete.action", new DeleteCmd());
		cmdMapper.put("/forgotPw.action", new ModifyCmd());
		cmdMapper.put("/logout.action", new LogoutCmd());
		cmdMapper.put("/resetPw.action", new ResetPwCmd());
	}
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (String)request.getAttribute("path");
		//System.out.println("path =>" + path);
		UserCommand cmd = cmdMapper.get(path);
		ModelAndView mav = cmd.action(request, response);
		mav.forward(request, response);
	}
}
