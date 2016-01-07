package edu.kosta.com.dto;

import java.sql.Date;

public class Reply {
//	reply_num NUMBER(13) NOT NULL, /* 댓글번호 */
//	board_num NUMBER(13), /* 글번호 */
//	m_num NUMBER(10), /* 댓글작성자 */
//	parent_reply NUMBER(13), /* 부모댓글번호 */
//	r_date DATE /* 시간 */
//	r_content VARCHAR2(1000) /* 댓글내용 */
	private int reply_num;
	private int board_num;
	private int m_num;
	private int parent_reply;
	private Date r_date;
	private String r_content;
	
	private String r_name;
	private String r_picture;
	
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getParent_reply() {
		return parent_reply;
	}
	public void setParent_reply(int parent_reply) {
		this.parent_reply = parent_reply;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	
//	===============================================================
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getR_picture() {
		return r_picture;
	}
	public void setR_picture(String r_picture) {
		this.r_picture = r_picture;
	}
	@Override
	public String toString() {
		return "Reply [reply_num=" + reply_num + ", board_num=" + board_num + ", m_num=" + m_num + ", parent_reply="
				+ parent_reply + ", r_date=" + r_date + ", r_content=" + r_content + ", r_name=" + r_name
				+ ", r_picture=" + r_picture + "]";
	}
	
	
	
	
}
