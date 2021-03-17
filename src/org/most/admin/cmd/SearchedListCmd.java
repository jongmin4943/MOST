package org.most.admin.cmd;

import java.io.IOException;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;
import org.most.temp.StrIntClass;
import org.most.user.model.UserDao;

public class SearchedListCmd implements AdminCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		if(req.getMethod().equals("GET")) {
			String p = req.getParameter("p")==null?"1":req.getParameter("p");
			String keyword = req.getParameter("keyword");
			UserDao uDao = new UserDao();
			int page = 1;
			try {
				page = Integer.parseInt(p);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
			//Map<String, Object> searchMap = new Hashtable<String, Object>();
			//searchMap.put("keyword", keyword);
			//searchMap.put("p", p);
			StrIntClass sic = new StrIntClass(keyword,page);
			List<Object> list = uDao.selectSearchedCurrPage(sic);
			int cnt = uDao.selectSearchedCount(keyword);
			req.setAttribute("total", cnt);
			cnt = (int)Math.ceil(cnt/(double)10);
			req.setAttribute("list", list);
			req.setAttribute("cnt", cnt);
			mav.setViewName("/WEB-INF/views/admin/searchedList.jsp");
		}
		return mav;
	}

}
