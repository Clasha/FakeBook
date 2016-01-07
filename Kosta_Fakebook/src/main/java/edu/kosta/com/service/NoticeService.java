package edu.kosta.com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.kosta.com.dto.Notice;
public interface NoticeService {
	public void insertNotice(Map map); //����
	public List<Notice> getNoticeList(HashMap map); //����Ʈ
	public Notice getNotice(int num); //�б�
	
	public int updateNotice(Notice dto); //����
	public void deleteNotice(int num); //����
	
	public void updateHit(int num); //��ȸ�� ����
	public int getNoticeCount(); //���Ǽ�
	
	
	}

