package edu.kosta.com.dto;

import java.sql.Date;

public class Notification {
//	noti_num NUMBER(10) NOT NULL, /* 알림번호 */
//	m_num NUMBER(10), /* 회원번호 */
//	read number(1) DEFAULT 0, /* 확인여부 */
//	noti_date DATE, /* 발생일자 */
//	noti_type NUMBER(1) /* 알림종류 */
	private int noti_num;
	private int m_num;
	private int read;
	private Date noti_date;
	private int noti_type;
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
	public int getRead() {
		return read;
	}
	public void setRead(int read) {
		this.read = read;
	}
	public Date getNoti_date() {
		return noti_date;
	}
	public void setNoti_date(Date noti_date) {
		this.noti_date = noti_date;
	}
	public int getNoti_type() {
		return noti_type;
	}
	public void setNoti_type(int noti_type) {
		this.noti_type = noti_type;
	}
	@Override
	public String toString() {
		return "Notification [noti_num=" + noti_num + ", m_num=" + m_num + ", read=" + read + ", noti_date=" + noti_date
				+ ", noti_type=" + noti_type + "]";
	}
	
	
}
