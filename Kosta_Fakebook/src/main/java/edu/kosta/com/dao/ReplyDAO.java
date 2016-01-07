package edu.kosta.com.dao;

import java.util.ArrayList;
import java.util.HashMap;

import edu.kosta.com.dto.Reply;

public interface ReplyDAO {

	ArrayList<Reply> selectReplyByBoardNum(HashMap<String, Object> hashMap);
	void insertReply(HashMap<String, Object> hashMap);
	void updatereply(HashMap<String, Object> hashmap);
	void deletereply(HashMap<String, Object> hashmap);
}
