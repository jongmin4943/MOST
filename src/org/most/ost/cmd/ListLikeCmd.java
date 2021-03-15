package org.most.ost.cmd;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;
import org.most.ost.model.OstDao;
import org.most.ost.model.OstDto;

public class ListLikeCmd implements OstCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String title = req.getParameter("title");
		String artist = req.getParameter("artist");
		String album = req.getParameter("album");
		OstDao dao = new OstDao();
		dao.insert(new OstDto("0", title, artist, album));
		
		
		return null;
	}

}