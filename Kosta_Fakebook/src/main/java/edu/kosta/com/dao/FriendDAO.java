package edu.kosta.com.dao;

import java.util.ArrayList;
import java.util.HashMap;

public interface FriendDAO {

	void insertFriend(HashMap<String, Object> hashMap);
	void deleteFriend(HashMap<String, Object> hashMap);
	
	ArrayList<Integer> getMyFriendList(HashMap<String, Object> id);
	ArrayList<Integer> getFriend_FriendList(HashMap<String, Object> id);

	Integer friendCehck(HashMap<String, Object> id);
	
	ArrayList<Integer> getRequestFriendList(HashMap<String, Object> hashmap);
	
	ArrayList<Integer> getRequestedFriendList(HashMap<String, Object> hashmap);
	
	void deleteFrinedRequested(HashMap<String, Object> hashmap);
	
	void deleteFrinedRequest(HashMap<String, Object> hashmap);
	
	ArrayList<Integer> getFriendIds(HashMap<String, Object> hashmap);
	
	ArrayList<Integer> getTogetherFriendIds(HashMap<String, Object> hashmap);

	
	int getFriendCount(HashMap<String, Object> hashmap);
	
	Integer isRealFriend(HashMap<String, Object> hashmap);
	int isfriendRequestCehck(HashMap<String, Object> hashmap);
}
