package org.most.ost.cmd;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.most.comment.model.CommentDao;
import org.most.comment.model.CommentDto;
import org.most.controller.ModelAndView;

public class CommentModiCmd implements OstCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		String ostNum = req.getParameter("ostNum") == null?"1":req.getParameter("ostNum");
		CommentDao dao = new CommentDao();
		if(req.getMethod().equals("GET")) {
			return null;
		} else {
			String commentNo = req.getParameter("commentNo");
			String modiText = req.getParameter("modiText");
			dao.update(new CommentDto(commentNo,"",ostNum,modiText,""));
			List<Object> list = dao.selectAll(new CommentDto("","",ostNum,"",""));
			JSONArray jsArr = new JSONArray();
			for(int i = 0; i < list.size() ; i++) {
				JSONObject jsObj = new JSONObject();
				CommentDto dto = (CommentDto)list.get(i);
				jsObj.put("guestID",dto.getWriter());
				jsObj.put("content",dto.getContent());
				jsObj.put("date",dto.getDate());
				jsObj.put("commentNo",dto.getNo());
				jsArr.put(jsObj);
			}
			JSONObject sendObj = new JSONObject();
			sendObj.put("sent",jsArr);
			out.print(sendObj);
			out.close();
		}
		return null;
	}

}
