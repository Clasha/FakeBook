package edu.kosta.com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.kosta.com.dto.Notice;


public interface NoticeDAO {
	public void insertNotice(Map map); 
	public List<Notice> getNoticeList(HashMap map); 
	public Notice getNotice(int notice_num); 
	
	public int updateNotice(Notice dto); 
	public void deleteNotice(int num);
	
	public void updateNotice_HIT(int notice_num); 
	public int getNoticeCount(); 
	

}
