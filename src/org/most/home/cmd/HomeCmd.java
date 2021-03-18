package org.most.home.cmd;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.most.controller.ModelAndView;
import org.most.likedOST.model.LikedOstDao;
import org.most.ost.model.OstDao;
import org.most.ost.model.OstDto;

public class HomeCmd implements HomeCommand {

	@SuppressWarnings("deprecation")
	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		List<Object> top3 = new OstDao().selectTopThree();
		List<String> topImgs = new ArrayList<String>();
		List<String> topNames = new ArrayList<String>();
		List<String> topEncodedNames = new ArrayList<String>();
		List<String> topArtists = new ArrayList<String>();
		List<Integer> topLikes = new ArrayList<Integer>();
		for(Object obj: top3){
			OstDto dto = (OstDto)obj;
			String no = new OstDao().selectNo(dto);
			int a = new OstDao().selectLikes(no);
			topLikes.add(a);
			topImgs.add(dto.getImgSrc());
			topNames.add(dto.getOstName());
			topEncodedNames.add(URLEncoder.encode(dto.getOstName()));
			topArtists.add(dto.getArtist());
		}
		req.setAttribute("top3Imgs", topImgs);
		req.setAttribute("top3Names", topNames);
		req.setAttribute("top3Artists", topArtists);
		req.setAttribute("top3Likes", topLikes);
		req.setAttribute("top3EncodedNames", topEncodedNames);
		
		List<Object> hot6 = new OstDao().selectThisWeeksHot();
		List<String> hot6Imgs = new ArrayList<String>();
		List<String> hot6Names = new ArrayList<String>();
		List<String> hot6EncodedNames = new ArrayList<String>();
		List<String> hot6Artists = new ArrayList<String>();
		List<Integer> hot6Likes = new ArrayList<Integer>();
		for(Object obj: hot6){
			OstDto dto = (OstDto)obj;
			String no = new OstDao().selectNo(dto);
			int a = new OstDao().selectLikes(no);
			hot6Likes.add(a);
			hot6Imgs.add(dto.getImgSrc());
			hot6Names.add(dto.getOstName());
			hot6EncodedNames.add(URLEncoder.encode(dto.getOstName()));
			hot6Artists.add(dto.getArtist());
		}
		String userID = (String)req.getSession().getAttribute("userID");
		String cnt = new LikedOstDao().selectUserOst(userID);
		req.setAttribute("hot6Imgs", hot6Imgs);
		req.setAttribute("hot6Names", hot6Names);
		req.setAttribute("hot6Artists", hot6Artists);
		req.setAttribute("hot6Likes", hot6Likes);
		req.setAttribute("hot6EncodedNames", hot6EncodedNames);
		req.setAttribute("cnt", cnt);
		mav.setViewName("/WEB-INF/views/home/home.jsp");
		return mav;

	}

}
