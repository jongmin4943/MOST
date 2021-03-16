package org.most.ost.cmd;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.most.controller.ModelAndView;
import org.most.likedOST.model.LikedOstDto;
import org.most.ost.model.OstDao;
import org.most.ost.model.OstDto;

public class ListLikeCmd implements OstCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		/**
		 * list[] = select no, title, artist, album from ostList
		 * 	 foreach comaprison to cur(title, artist, album)
		 * 		* if cur(title, artist, album) =| get that no ==> add the cur to likedOst only
		 * 		* else: add cur to ostList and likedOst
		 * */
		String title = req.getParameter("title");
		String artist = req.getParameter("artist");
		String album = req.getParameter("album");
		OstDao dao = new OstDao();
		String userID = req.getParameter("userID");
		
		String no = dao.selectNo(new OstDto("", title, album, artist, ""));
		JSONObject jObj = new JSONObject();
		
		if(no != null) {
			LikedOstDto ldto = dao.selectLikedOst(new LikedOstDto(userID, no, ""));
			int likesLeft = dao.selectLikes(no);
        	if(ldto != null) {
        		dao.deletLikedOst(ldto);
        		if(likesLeft-1 == 0) {
        			dao.delete(no);
        			jObj.append("likeIcon", "<a href=''>🤍 0</a>");
        		} else {
        			jObj.append("likeIcon", "<a href=''>🤍 "+(likesLeft-1)+"</a>");
        		}
        	} else {
        		dao.insertLikedOst(new LikedOstDto(userID,no,""));
        		jObj.append("likeIcon", "<a href=''>❤ "+(likesLeft+1)+"</a>");
        	}
		} else {
			String imgSrc = req.getParameter("imgSrc");
			OstDto oDto = new OstDto("0", title, album, artist, imgSrc);
			no = dao.insert(oDto);
			dao.insertLikedOst(new LikedOstDto(userID,no,""));	//need to add this shit	
			jObj.append("likeIcon", "<a href=''>❤ 1</a>");
		}//end if

		out.print(jObj);
		return null;
	}

}
