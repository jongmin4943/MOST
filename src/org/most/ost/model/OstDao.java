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
	
	public OstDto selectOne(OstDto dto) {
		return mybatis.selectOne("OstMapper.selectUser",dto.getNo());
	}
	
	public String selectLikes(OstDto dto) {
		return mybatis.selectOne("OstMapper.selectLikes",dto.getNo());
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
	
	public void delete(OstDto dto) {
		mybatis.delete("OstMapper.deleteUser", dto);
	}
	
	public void insertLikedOst(LikedOstDto dto) {
		mybatis.insert("OstMapper.insertLikedOst", dto);
	}
}
