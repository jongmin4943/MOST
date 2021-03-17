package org.most.ost.cmd;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.most.comment.model.CommentDao;
import org.most.comment.model.CommentDto;
import org.most.controller.ModelAndView;
import org.most.likedOST.model.LikedOstDto;
import org.most.ost.model.OstDao;
import org.most.ost.model.OstDto;

import api.server.NaverAPIreader;

public class ListMovieCmd implements OstCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		String title = req.getParameter("title");
		String album = req.getParameter("album");
		
        JSONObject jObj = NaverAPIreader.searchMovie(title, album);

        String imgUrl = "https://movie.naver.com/movie/bi/mi/photoViewPopup.nhn?movieCode="+jObj.get("link").toString().substring(jObj.get("link").toString().indexOf("code=", 1)+5, jObj.get("link").toString().length());

        Document imgLoc = Jsoup.connect(imgUrl).get();
        
        Element imgTag = imgLoc.body().getElementById("targetImage");
        String imgSrc = null;
        if(imgTag != null) {
        	String imgTagStr = imgTag.toString();
        	String sizeSetting = " width=\"50%\"";
        	imgSrc = imgTagStr.substring(0, imgTagStr.length()-1)+sizeSetting+">";
        } else {
        	imgSrc = "<h2 style='border: 5px'>No Images of This Movie</h2>";
        }
        
        String userID = req.getParameter("userID");
		String artist = req.getParameter("artist");
		
        OstDao dao = new OstDao();
        String no = dao.selectNo(new OstDto("", title, album, artist, ""));
        
        CommentDao commentDao = new CommentDao();
        if(no != null) {
        	LikedOstDto ldto = dao.selectLikedOst(new LikedOstDto(userID, no, ""));
        	int noLikes = dao.selectLikes(no);
        	if(ldto != null) {
        		jObj.append("likeIcon", "<a href=''>❤ "+noLikes+"</a>");//꽉찬 하트
        		jObj.append("currUserStatus", "like");//꽉찬 하트
        	} else {
        		jObj.append("likeIcon", "<a href=''>🤍 "+noLikes+"</a>");//빈 하트
        		jObj.append("currUserStatus", "disLike");//빈 하트
        		commentDao.deleteAllFromOst(new CommentDto("",userID,no,"",""));
        	}
        } else {
        	jObj.append("likeIcon", "<a href=''>🤍 0</a>");//빈하트
        	jObj.append("currUserStatus", "disLike");//빈 하트
        	commentDao.deleteAllFromOst(new CommentDto("",userID,no,"",""));
        }
        jObj.append("imgSrc", imgSrc);
        jObj.append("no", no==null?"-1":no);
        out.print(jObj);
		
		return null;
	}

}
