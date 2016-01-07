package edu.kosta.com.dto;

public class SearchMemberCommand {	
	private String name;
	private int m_num;
	private int isFriend;
	private String picture;
	private int friendshipConfirm;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getIsFriend() {
		return isFriend;
	}
	public void setIsFriend(int isFriend) {
		this.isFriend = isFriend;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getFriendshipConfirm() {
		return friendshipConfirm;
	}
	public void setFriendshipConfirm(int friendshipConfirm) {
		this.friendshipConfirm = friendshipConfirm;
	}
	@Override
	public String toString() {
		return "SearchMemberCommand [name=" + name + ", m_num=" + m_num + ", isFriend=" + isFriend + ", picture="
				+ picture + ", friendshipConfirm=" + friendshipConfirm + "]";
	}
	
}
