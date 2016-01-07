package edu.kosta.com.dto;

public class FriendNoti {
//	noti_num NUMBER(10) NOT NULL, /* 알림번호 */
//	m_num NUMBER(10), /* 내회원번호 */
//	f_num NUMBER(10), /* 친구회원번호 */
//	accept NUMBER(1) /* 신청수락 */
	private int noti_num; 
	private int m_num;
	private int f_num;
	private int accept;
	
	//-----
	private int read;
	
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	//------
	public int getNoti_num() {
		return noti_num;
	}
	public void setNoti_num(int noti_num) {
		this.noti_num = noti_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getF_num() {
		return f_num;
	}
	public void setF_num(int f_num) {
		this.f_num = f_num;
	}
	public int getAccept() {
		return accept;
	}
	public void setAccept(int accept) {
		this.accept = accept;
	}
	@Override
	public String toString() {
		return "FriendNoti [noti_num=" + noti_num + ", m_num=" + m_num + ", f_num=" + f_num + ", accept=" + accept
				+ "]";
	}
		
}
