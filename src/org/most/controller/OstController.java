package org.most.controller;

import java.io.IOException;
import java.util.Hashtable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.ost.cmd.CommentCmd;
import org.most.ost.cmd.CommentDeleCmd;
import org.most.ost.cmd.CommentModiCmd;
import org.most.ost.cmd.ListCmd;
import org.most.ost.cmd.ListLikeCmd;
import org.most.ost.cmd.ListMovieCmd;
import org.most.ost.cmd.MyListCmd;
import org.most.ost.cmd.OstCommand;

public class OstController extends Controller {
	private static final long serialVersionUID = 1L;
	static Hashtable<String, OstCommand> cmdMapper = new Hashtable<String, OstCommand>();
	static {
		cmdMapper.put("/list.action", new ListCmd());
		cmdMapper.put("/listMovie.action", new ListMovieCmd());
		cmdMapper.put("/listLike.action", new ListLikeCmd());
		cmdMapper.put("/modal.action", new MyListCmd());
		cmdMapper.put("/comment.action", new CommentCmd());
		cmdMapper.put("/commentModi.action", new CommentModiCmd());
		cmdMapper.put("/commentDele.action", new CommentDeleCmd());
	}
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = (String)request.getAttribute("path");
		OstCommand cmd = cmdMapper.get(path);
		ModelAndView mav = cmd.action(request, response);
		if(mav != null) {
			mav.forward(request, response);
		} else {
			return;
		}
	}
}
