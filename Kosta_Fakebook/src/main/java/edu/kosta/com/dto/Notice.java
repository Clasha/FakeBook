package edu.kosta.com.dto;

import java.sql.Date;

public class Notice {
	private int notice_num;
	private Date write_date; 
	private int notice_hit;
	private String notice_contents;
	private String notice_title;
	/*private Blob notice_image;*/
	
	
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	public int getNotice_hit() {
		return notice_hit;
	}
	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}
	public String getNotice_contents() {
		return notice_contents;
	}
	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	/*public Blob getNotice_image() {
		return notice_image;
	}
	public void setNotice_image(Blob notice_image) {
		this.notice_image = notice_image;
	}
	*/
	
	
	

}
