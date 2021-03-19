package org.most.likedOST.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.most.ost.model.OstUserDto;

public class LikedOstDao {
	private SqlSession mybatis;
	public LikedOstDao() {
		String url = "org/most/mybatis/mybatis-config.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(url);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			mybatis = sqlSessionFactory.openSession(true);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void insert(LikedOstDto dto) {
		mybatis.insert("LikedOstMapper.insertLikedOst",dto);
	}
	public void delete(LikedOstDto dto) {
		mybatis.insert("LikedOstMapper.deleteLikedOst",dto);
	}
	public void deleteAll(String userID) {
		mybatis.delete("LikedOstMapper.deleteAll",userID);
	}
	public String selectUserOst(String userID) {
		return mybatis.selectOne("LikedOstMapper.selectUserOst", userID);
	}
	public List<OstUserDto> selectUsersLikes(String userID){
		return mybatis.selectList("LikedOstMapper.selectUsersChoice", userID);
	}
}
