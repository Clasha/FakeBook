package edu.kosta.com.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosta.com.dao.HashtagDAO;

@Service
public class HashTagService {

	@Autowired
	private SqlSession sqlSession;
	
	public void insertHashtag(String content, int board_num) {
		System.out.println("<< HashTagService : insertHasgTag >>");
		HashtagDAO hashtagDAO = sqlSession.getMapper(HashtagDAO.class);
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		hashMap.put("board_num", board_num);
		
		while(content.indexOf('#') >= 0) {
			content = content.substring(content.indexOf('#'));
			System.out.println("content : "+ content);
			if(content.indexOf(' ') > 0) {
				String hashtag = content.substring(0, content.indexOf(' '));
				content = content.substring(content.indexOf(' '));
				hashMap.put("hashtag", hashtag);
				hashtagDAO.insertHashtag(hashMap);
				System.out.println("board_num: " + board_num + "/ hashtag: " + hashtag );
			} else {
				String hashtag = content;
				content = "";
				hashMap.put("hashtag", hashtag);
				hashtagDAO.insertHashtag(hashMap);
				System.out.println("board_num: " + board_num + "/ hashtag: " + hashtag );
			}
		}
	}

	public void deleteHashTag(int board_num) {
		System.out.println("<< HashTagService : deleteHashTag >>");
		HashtagDAO hashtagDAO = sqlSession.getMapper(HashtagDAO.class);
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		hashMap.put("board_num", board_num);
		
		hashtagDAO.deleteHashtag(hashMap);
	}
}
