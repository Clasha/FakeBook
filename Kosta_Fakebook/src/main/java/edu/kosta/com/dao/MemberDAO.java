package edu.kosta.com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import edu.kosta.com.dto.Member;
import edu.kosta.com.dto.SearchMemberCommand;

public interface MemberDAO {
	void insertMember(HashMap<String, Object> hashMap);
	List<Member> myProfile(HashMap<String, Object> hashMap ); // ������ ������
	List<Member> myFriendsProfile(HashMap<String, Object> hashMap ); // �� ģ�� ������ ������
	List<Member> myFriendList(HashMap<String, Object> hashMap ); // ģ�� ��ü ���
	List<SearchMemberCommand> searchMembers(HashMap<String, Object> hashMap); // ģ�� �˻�
	String selectEmailByNum(int f_num);
	
	
	
	
	ArrayList<String> jobListAjax(HashMap<String, String> hashMap);
	void memberJobInsert(HashMap<String, String> hashmap);
	Member memberJobList(HashMap<String, String> hashmap);
	void memberJobDelete(HashMap<String, String> hashmap);
	void memberSchoolInsert(HashMap<String, String> hashmap);
	void memberSchoolDelete(HashMap<String, String> hashmap);
	void memberHighSchoolSave(HashMap<String, String> hashmap);
	void memberHighSchoolDelete(HashMap<String, String> hashmap);
	void memberBornSave(HashMap<String, String> hashmap);
	void memberBornDelete(HashMap<String, String> hashmap);
	ArrayList<Member> getAllMember(String email);
	ArrayList<String> getSchoolList(HashMap<String, String> hashMap);
	ArrayList<String> getHighSchoolList(HashMap<String, String> hashMap);
	ArrayList<String> getHighSchoolMajorList(HashMap<String, String> hashMap);
	Member getMaybe_FriendInfo(HashMap<String, Integer> hashmap);
	String getTogether_firendName(int m_num);
	Member getMemberInfo(HashMap<String, Object> hashmap);
	
	
	void memberOut(HashMap<String, Object> hashMap);
	void updatePicture(HashMap<String, Object> hashMap);
	
	String getMemberPicture(HashMap<String, Object> hash);
	String getMemberName(HashMap<String, Object> hash);
}
