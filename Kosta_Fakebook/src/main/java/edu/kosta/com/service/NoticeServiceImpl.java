package edu.kosta.com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosta.com.dao.NoticeDAO;
import edu.kosta.com.dto.Notice;


@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private SqlSession sqlsession;

	@Override
	public Notice getNotice(int num) {
		NoticeDAO noticeDAO = sqlsession.getMapper(NoticeDAO.class);
		return noticeDAO.getNotice(num);
		
	}

	@Override
	public int updateNotice(Notice dto) {
		NoticeDAO noticeDAO = sqlsession.getMapper(NoticeDAO.class);
		return noticeDAO.updateNotice(dto);
	}

	@Override
	public void deleteNotice(int num) {
		NoticeDAO noticeDAO = sqlsession.getMapper(NoticeDAO.class);
		noticeDAO.deleteNotice(num);
	}

	@Override
	public void updateHit(int num) {
		NoticeDAO noticeDAO = sqlsession.getMapper(NoticeDAO.class);
		noticeDAO.updateNotice_HIT(num);
		
	}

	@Override
	public int getNoticeCount() {
		NoticeDAO noticeDAO = sqlsession.getMapper(NoticeDAO.class);
		return noticeDAO.getNoticeCount();
	}



	@Override
	public List<Notice> getNoticeList(HashMap map) {
		NoticeDAO noticeDAO = sqlsession.getMapper(NoticeDAO.class);
		System.out.println(noticeDAO);
		System.out.println(noticeDAO.getNoticeList(map).size());
		return noticeDAO.getNoticeList(map);
		
	}

	@Override
	public void insertNotice(Map map) {
		NoticeDAO noticeDAO = sqlsession.getMapper(NoticeDAO.class);
		noticeDAO.insertNotice(map); 
		
	}
	
	
}
