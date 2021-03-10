package org.most.ost.cmd;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;

public interface OstCommand {
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
}
