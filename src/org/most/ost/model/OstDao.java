package org.most.ost.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.most.likedOST.model.LikedOstDto;

public class OstDao {
	private SqlSession mybatis;
	public OstDao() {
		String url = "org/most/mybatis/mybatis-config.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(url);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			mybatis = sqlSessionFactory.openSession(true);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Object> selectAll() {
		List<Object> list = new ArrayList<>();
		list = mybatis.selectList("OstMapper.selectAll");
		return list;
	}
	
	public String selectNo(OstDto dto) {
		return mybatis.selectOne("OstMapper.selectNo",dto);
	}
	
	public int selectLikes(String no) {
		return mybatis.selectOne("OstMapper.selectLikes",no);
	} // 해당 ost의 like 갯수가 넘어온다.
	
	public List<Object> selectUserOst(String userID) {
		List<Object> list = new ArrayList<>();
		list = mybatis.selectList("OstMapper.selectUserOst", userID);
		return list;
	} // 해당 유저가 like를 누른 ost 리스트를 뽑아온다.
	
	public String insert(OstDto dto) {
		//select no ostList order by no desc limit 0,1
		//+m
		mybatis.insert("OstMapper.insertOst",dto);
		String no = mybatis.selectOne("OstMapper.selectLastOstNo");
		return no;
	}
	
//	public void update(UserDto dto) {
//		mybatis.update("OstMapper.updateUser", dto);
//	}
	
	public void delete(String no) {
		mybatis.delete("OstMapper.deleteOst", no);
	}
	
	public void insertLikedOst(LikedOstDto dto) {
		dto.setLikedDate(selectDate());
		mybatis.insert("OstMapper.insertLikedOst", dto);
	}
	public String selectDate() {
		return mybatis.selectOne("UserMapper.selectDate");
	}
	public List<Object> selectTitAlbArt() {
		List<Object> res = mybatis.selectList("OstMapper.selectTitAlbArt");
		return res;
	}
	public void deletLikedOst(LikedOstDto dto) {
		mybatis.delete("OstMapper.deleteLikedOst", dto);
	}
	public LikedOstDto selectLikedOst(LikedOstDto dto) {
		return mybatis.selectOne("OstMapper.selectLikedOst", dto);
	}
}
