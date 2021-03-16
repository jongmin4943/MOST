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
import org.most.controller.ModelAndView;

import api.server.NaverAPIreader;

public class ListMovieCmd implements OstCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();
		if(req.getMethod().equals("GET")) {
			String title = req.getParameter("title");
			String album = req.getParameter("album");
			System.out.println(title + " " + album);
			
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
	        
	        jObj.append("imgSrc", imgSrc);
	        out.print(jObj);
		} else {
			
		}
		return null;
	}

}
