package edu.kosta.com.dto;

import java.util.Arrays;

public class My_Profile_FriendListCommand {
	private int m_num;
	private String name;
	private String picture;
	private int friendCount;
	private int[] togetherFriendIds;
	private String[] togetherFriendNames;
	private int[] recentlyNotiIds;
	private String[] recentlyNotiNames;
	
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
	public int[] getTogetherFriendIds() {
		return togetherFriendIds;
	}
	public void setTogetherFriendIds(int[] togetherFriendIds) {
		this.togetherFriendIds = togetherFriendIds;
	}
	public int getFriendCount() {
		return friendCount;
	}
	public void setFriendCount(int friendCount) {
		this.friendCount = friendCount;
	}
	public String[] getTogetherFriendNames() {
		return togetherFriendNames;
	}
	public void setTogetherFriendNames(String[] togetherFriendNames) {
		this.togetherFriendNames = togetherFriendNames;
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
		return "My_Profile_FriendListCommand [m_num=" + m_num + ", name=" + name + ", picture=" + picture
				+ ", togetherFriendIds=" + Arrays.toString(togetherFriendIds) + ", friendCount=" + friendCount
				+ ", togetherFriendNames=" + Arrays.toString(togetherFriendNames) + ", recentlyNotiIds="
				+ Arrays.toString(recentlyNotiIds) + ", recentlyNotiNames=" + Arrays.toString(recentlyNotiNames) + "]";
	}
	
	
	
	
}
