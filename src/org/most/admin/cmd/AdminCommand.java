package org.most.admin.cmd;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;

public interface AdminCommand {
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
}
