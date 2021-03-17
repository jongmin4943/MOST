package org.most.comment.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class CommentDao {
	private SqlSession mybatis; //mybatis
	public CommentDao() {
		String url = "org/most/mybatis/mybatis-config.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(url);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			mybatis = sqlSessionFactory.openSession(true);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public List<Object> selectAll(CommentDto dto) {
		List<Object> list = new ArrayList<>();
		list = mybatis.selectList("CommentMapper.selectAll",dto);
		return list;
	}
	
	public CommentDto selectOne(CommentDto dto) {
		return mybatis.selectOne("CommentMapper.selectComment",dto.getNo());
	}
	
	public void insert(CommentDto dto) {
		dto.setDate(selectDate());
		mybatis.insert("CommentMapper.insertComment",dto);
	}
	public String selectDate() {
		return mybatis.selectOne("CommentMapper.selectComment");
	}
	
	public void update(CommentDto dto) {
		mybatis.update("CommentMapper.updateComment", dto);
	}
	
	public void delete(CommentDto dto) {
		mybatis.delete("CommentMapper.deleteComment", dto);
	}
	public void deleteAllFromOst(CommentDto commentDto) {
		mybatis.delete("CommentMapper.deleteAllFromOst", commentDto);
	}
	public void deleteAll(String writer) {
		mybatis.delete("CommentMapper.deleteAll", writer);
	}
}
