package edu.kosta.com.dto;

import java.sql.Date;

public class LikeNoti {
	private int noti_num; 
	private int m_num;
	private int board_num;
	//--------------------
	private int read;
	private Date noti_date;
	private String name;
	
	//=========================================
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
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
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
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "LikeNoti [noti_num=" + noti_num + ", m_num=" + m_num + ", board_num=" + board_num + ", read=" + read
				+ ", noti_date=" + noti_date + "]";
	}	
}
