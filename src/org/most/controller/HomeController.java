package org.most.controller;

import java.io.IOException;
import java.util.Hashtable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.home.cmd.HomeCmd;
import org.most.home.cmd.HomeCommand;


public class HomeController extends Controller {
	private static final long serialVersionUID = 1L;
	static Hashtable<String, HomeCommand> cmdMapper = new Hashtable<String, HomeCommand>();
	static {
		cmdMapper.put("/home.action", new HomeCmd());
	}
	@Override
	public void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = (String)req.getAttribute("path");
		HomeCommand cmd = cmdMapper.get(path);
		ModelAndView mav = cmd.action(req, resp);
		if(mav != null) {
			mav.forward(req, resp);
		} else {
			return;
		}
	}
}
