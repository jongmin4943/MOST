package org.most.controller;

import java.io.IOException;
import java.util.Hashtable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.notice.cmd.ListCmd;
import org.most.notice.cmd.NoticeCommand;


public class NoticeController extends Controller {
	private static final long serialVersionUID = 1L;
	
	static Hashtable<String, NoticeCommand> cmdMapper = new Hashtable<String, NoticeCommand>();
	static {
		cmdMapper.put("/list.action", new ListCmd());
	}
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (String)request.getAttribute("path");
		NoticeCommand cmd = cmdMapper.get(path);
		ModelAndView mav = cmd.action(request, response);
		mav.forward(request, response);
	}
}
