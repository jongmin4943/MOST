package org.most.user.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class UserDao {
	private SqlSession mybatis; //mybatis
	public UserDao() {
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
		list = mybatis.selectList("UserMapper.selectAll");
		
		return list;
	}
	
	public UserDto selectOne(UserDto dto) {
		return mybatis.selectOne("UserMapper.selectUser",dto.getUserID());
	}
	
	public void insert(UserDto dto) {
		dto.setJoinedDate(selectDate());
		mybatis.insert("UserMapper.insertUser",dto);
	}
	public String selectDate() {
		return mybatis.selectOne("UserMapper.selectDate");
	}
	
	public void update(UserDto dto) {
		mybatis.update("UserMapper.updateUser", dto);
	}
	
	public void delete(UserDto dto) {
		mybatis.delete("UserMapper.deleteUser", dto);
	}

	public List<Object> selectCurrPage(int p) {
		return mybatis.selectList("UserMapper.selectCurrPage", p);
	}

	public int selectCount() {
		return mybatis.selectOne("UserMapper.selectCount");
	}
}
