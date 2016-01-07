package edu.kosta.com.dto;

import java.sql.Date;
import java.util.List;

public class Board {
	private int board_num;
	private int m_num;
	private Date reg_date;
	private int open_level;
	private String content;
	private String place;
	private String picture;
	private String video;
	private int bLikeCount;
	private List<Reply> replyList;
	private int b_like;
	private String writer_name;
	private String memberPicture;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getOpen_level() {
		return open_level;
	}
	public void setOpen_level(int open_level) {
		this.open_level = open_level;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	
   public int getbLikeCount() {
      return bLikeCount;
   }
   public void setbLikeCount(int bLikeCount) {
      this.bLikeCount = bLikeCount;
   }
		   
	public List<Reply> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<Reply> replyList) {
		this.replyList = replyList;
	}
	
   public int getB_like() {
      return b_like;
   }
   public void setB_like(int b_like) {
      this.b_like = b_like;
   }
public String getWriter_name() {
	return writer_name;
}
public void setWriter_name(String writer_name) {
	this.writer_name = writer_name;
}
public String getMemberPicture() {
	return memberPicture;
}
public void setMemberPicture(String memberPicture) {
	this.memberPicture = memberPicture;
}
@Override
public String toString() {
	return "Board [board_num=" + board_num + ", m_num=" + m_num + ", reg_date=" + reg_date + ", open_level="
			+ open_level + ", content=" + content + ", place=" + place + ", picture=" + picture + ", video=" + video
			+ ", bLikeCount=" + bLikeCount + ", replyList=" + replyList + ", b_like=" + b_like + ", writer_name="
			+ writer_name + ", memberPicture=" + memberPicture + "]";
}

   
	
}
