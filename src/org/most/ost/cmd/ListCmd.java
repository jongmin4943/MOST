package org.most.ost.cmd;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.most.controller.ModelAndView;

import api.server.NaverAPIreader;

public class ListCmd implements OstCommand {

	@Override
	public ModelAndView action(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView();
		if(req.getMethod().equals("GET")) {
			String keyword = req.getParameter("search");
			String option = req.getParameter("option");
			// keyword 검색어
			// option 카테고리
			// 이거 두개를 가지고 list.jsp로 간다
			// list.jsp에서 가지고간 두개로 ajax검색시스템을 만들어 뿌려준다.
			String name = "";
			if(option.equals("OST")){
				name = keyword;
			} else {
				name = option+ " " + keyword;		
			}
			String encedTitle = "";
			
			try {
				encedTitle = URLEncoder.encode(name, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			String movie = "https://www.melon.com/search/song/index.htm?q="+encedTitle+"&section=&searchGnbYn=Y&kkoSpl=Y&kkoDpType=&linkOrText=T&ipath=srch_form";
			Document doc = Jsoup.connect(movie).get();
			
			Element songs = doc.body().getElementById("frm_defaultList");
			if(songs != null) {
				Elements song = songs.select("td");
				List<String> titles = new ArrayList<String>();
				List<String> artists = new ArrayList<String>();
				List<String> albums = new ArrayList<String>();
				
				int count = 0;
				
				for(Element e: song){
					if(!e.select(".fc_gray").text().trim().equals("California Dreamin' (Single Version)") && !e.select("#artistName").text().trim().substring(0, e.select("#artistName").text().trim().length()/2).equals("The Mamas & Papas") && !e.select(".fc_mgray").text().trim().equals("Zhong Qing Sen Lin ( Dian Ying Yuan Sheng Da Die ) (Original Motion Picture Soundtrack)")) {
						if(e.select(".fc_gray").text().trim() != null && !e.select(".fc_gray").text().trim().equals("")){
							titles.add(e.select(".fc_gray").text().trim());
						}
						if(e.select("#artistName").text().trim() != null && !e.select("#artistName").text().trim().equals("")){
							artists.add(e.select("#artistName").text().trim().substring(0, e.select("#artistName").text().trim().length()/2));
						}
						if(e.select(".fc_mgray").text().trim() != null && !e.select(".fc_mgray").text().trim().equals("")){
							if(count%2 == 0){
								albums.add(e.select(".fc_mgray").text().trim());
							}
						}
					}
					if(titles.size() > 50){
						break;
					}
					count++;
				}
				
				int cnt = Math.min(titles.size(), Math.min(artists.size(), albums.size()));
				List<String[]> searched = new ArrayList<String[]>();
				
				for(int i = 0; i < cnt; i++) {
					if(NaverAPIreader.movieCheck(albums.get(i), titles.get(i))){
						searched.add(new String[] {titles.get(i),artists.get(i),albums.get(i)});
					}
				}
				
				
				
				
				req.setAttribute("list", searched);
				req.setAttribute("cnt", searched.size());					
			}
			mav.setViewName("/WEB-INF/views/ost/list.jsp");
		} else {
			mav.setViewName("/WEB-INF/views/ost/list.jsp");
		}
		return mav;
	}

}
