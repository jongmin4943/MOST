package org.most.notice.model;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class NoticeDao {
	private SqlSession mybatis; //mybatis
	public NoticeDao() {
		String url = "org/most/mybatis/mybatis-config.xml";
		try {
			InputStream inputStream = Resources.getResourceAsStream(url);
			SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			mybatis = sqlSessionFactory.openSession(true);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void insert(NoticeDto dto) {
		mybatis.insert("NoticeMapper.insertNotice", dto);
	}
	public void update(NoticeDto dto) {
		mybatis.update("NoticeMapper.updateNotice", dto);
	}
	public void delete(String no) {
		mybatis.insert("NoticeMapper.deleteNotice", no);
	}
	public List<NoticeDto> selectAll() {
		return mybatis.selectList("NoticeMapper.selectAll");
	}

	public List<NoticeDto> selectCurrPage(int p) {
		return mybatis.selectList("NoticeMapper.selectCurrPage",p);
	}

	public int selectCount() {
		return mybatis.selectOne("NoticeMapper.selectCount");
	}
	
	public NoticeDto selectOne(String no) {
		return mybatis.selectOne("NoticeMapper.selectNotice", no);
	}
	
	public void updateNoticeHit(String no) {
		mybatis.update("NoticeMapper.updateNoticeHit", no);
	}

	public int selectLastestNotice() {
		return mybatis.selectOne("NoticeMapper.selectLastestNotice");
	}

	public List<NoticeDto> selectFive() {
		return mybatis.selectList("NoticeMapper.selectFive");
	}
}
