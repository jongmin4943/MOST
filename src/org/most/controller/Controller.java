package org.most.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class Controller {
	public abstract void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;
}
