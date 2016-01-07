package edu.kosta.com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import edu.kosta.com.dto.FriendNoti;
import edu.kosta.com.dto.LikeNoti;
import edu.kosta.com.dto.Notification;
import edu.kosta.com.dto.ReplyNoti;

public interface NotiDAO {
	
	void insertFriendNoti(HashMap<String, Object> hashmap);
	int countFriendNoti(HashMap<String, Object> hashmap);
	List<FriendNoti> selectFriendNoti(HashMap<String, Object> hashmap);
	void readNoti(int noti_num);
	List<Notification> selectNoti(HashMap<String, Object> hashmap);
	
	ArrayList<Integer> getRecentlyNoti(HashMap<String, Object> hashmap);
	
	
	void deleteFrinedRequested(HashMap<String, Object> hashmap); //模备 夸没 柯 模备 昏力
	void deleteFrinedRequest(HashMap<String, Object> hashmap);//郴啊 扒 模备 模备秒家
	void requestFriendAcceptUpdate(HashMap<String, Object> hashmap);  //模备 铰倡矫
	
	List<ReplyNoti> selectReplyNoti(HashMap<String, Object> hashmap);
	void commentNoti(HashMap<String, Object> hashmap);
	void readupdate(int noti_num);
	void insertLikeNoti(HashMap<String, Object> hashmap);
	List<LikeNoti> getLikeNotis(int m_num);
	ArrayList<Integer> getRecentlyNoti2(HashMap<String, Object> hashmap);
}
