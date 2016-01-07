package edu.kosta.com.dto;

import java.util.Arrays;

public class My_FriendListCommand {
	private int m_num; //친구 넘
	private String name; //친구 네임
	private String picture; //친구 사진
	private int[] togetherFriendIds; //함께아는 친구 아이디
	private String[] togetherFriendNames;  //함께 아는 친구 이름들
	private int[] recentlyNotiIds;  //최근 소식
	private String[] recentlyNotiNames;  //최근 소식 이름들
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	public String[] getTogetherFriendNames() {
		return togetherFriendNames;
	}
	public void setTogetherFriendNames(String[] togetherFriendNames) {
		this.togetherFriendNames = togetherFriendNames;
	}
	
	public int[] getTogetherFriendIds() {
		return togetherFriendIds;
	}
	public void setTogetherFriendIds(int[] togetherFriendIds) {
		this.togetherFriendIds = togetherFriendIds;
	}
	public int[] getRecentlyNotiIds() {
		return recentlyNotiIds;
	}
	public void setRecentlyNotiIds(int[] recentlyNotiIds) {
		this.recentlyNotiIds = recentlyNotiIds;
	}
	public String[] getRecentlyNotiNames() {
		return recentlyNotiNames;
	}
	public void setRecentlyNotiNames(String[] recentlyNotiNames) {
		this.recentlyNotiNames = recentlyNotiNames;
	}
	@Override
	public String toString() {
		return "My_FriendListCommand [m_num=" + m_num + ", name=" + name + ", picture=" + picture
				+ ", togetherFriendIds=" + Arrays.toString(togetherFriendIds) + ", togetherFriendNames="
				+ Arrays.toString(togetherFriendNames) + ", recentlyNotiIds=" + Arrays.toString(recentlyNotiIds)
				+ ", recentlyNotiNames=" + Arrays.toString(recentlyNotiNames) + "]";
	}
	
	
	
	
	
	
}
