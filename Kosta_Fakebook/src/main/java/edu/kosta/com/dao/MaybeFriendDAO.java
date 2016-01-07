package edu.kosta.com.dao;

import java.util.ArrayList;
import java.util.HashMap;

import edu.kosta.com.dto.MaybeFriend;

public interface MaybeFriendDAO {

	void insertMaybeFriend(HashMap<String, Object> id);

	MaybeFriend check(HashMap<String, Object> id);

	void updateTogetherFriend(HashMap<String, Object> id);

	ArrayList<Integer> getMaybe_list(HashMap<String, Object> id);

	MaybeFriend samePeopleCheck(HashMap<String, Object> id);

	MaybeFriend getAllList(HashMap<String, Object> hashmap);

	void updateMaybeFriend(HashMap<String, Object> hashmap);

	ArrayList<MaybeFriend> getScoreSortMaybeList(HashMap<String, Object> myInfo);
	
	void deleteMaybeFriend(HashMap<String, Object> hashmap);
	
	void dropMaybeFriends(HashMap<String, Object> hashmap); //���ε��� �˼����ִ� ģ�� ��� �ʱ�ȯ
	
	int checkMaybe(HashMap<String, Object> hashmap);

}
