package org.most.controller;

import java.io.IOException;
import java.util.Hashtable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.admin.cmd.AdminCommand;
import org.most.admin.cmd.DeleteCmd;
import org.most.admin.cmd.ListCmd;
import org.most.admin.cmd.SearchedListCmd;

public class AdminController extends Controller {
	private static final long serialVersionUID = 1L;
	
	static Hashtable<String, AdminCommand> cmdMapper = new Hashtable<String, AdminCommand>();
	static {
		cmdMapper.put("/list.action", new ListCmd());
		cmdMapper.put("/searchedList.action", new SearchedListCmd());
		cmdMapper.put("/delete.action", new DeleteCmd());
	}
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (String)request.getAttribute("path");
		//System.out.println("path =>" + path);
		AdminCommand cmd = cmdMapper.get(path);
		ModelAndView mav = cmd.action(request, response);
		mav.forward(request, response);
	}
}
