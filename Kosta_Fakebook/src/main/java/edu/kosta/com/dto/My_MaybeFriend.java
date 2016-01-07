package edu.kosta.com.dto;

import java.sql.Date;
import java.util.Arrays;

public class My_MaybeFriend {
	
	private String job_desc;
	private Date school_into;
	private Date school_out;
	private int m_num;
	private String email;
	private String password;
	private String name;
	private Date birthday;
	private int type;
	private int yellow_card;
	private String picture;
	private String school;
	private String born;
	private String job;
	private String job_addr;
	private String job_position;
	private String school_desc;
	private String highschool;
	private Date highschool_into;
	private Date highschool_out;
	private String highschool_desc;
	private String highschoolmajor;
	private int maybe_friendId;
	private String[] together_friendIds;
	private String[] together_friendNames;
	private int score;
	private String[] resons;
	
	public My_MaybeFriend() {
	}
	public String getJob_desc() {
		return job_desc;
	}
	public void setJob_desc(String job_desc) {
		this.job_desc = job_desc;
	}
	public Date getSchool_into() {
		return school_into;
	}
	public void setSchool_into(Date school_into) {
		this.school_into = school_into;
	}
	public Date getSchool_out() {
		return school_out;
	}
	public void setSchool_out(Date school_out) {
		this.school_out = school_out;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getYellow_card() {
		return yellow_card;
	}
	public void setYellow_card(int yellow_card) {
		this.yellow_card = yellow_card;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getBorn() {
		return born;
	}
	public void setBorn(String born) {
		this.born = born;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getJob_addr() {
		return job_addr;
	}
	public void setJob_addr(String job_addr) {
		this.job_addr = job_addr;
	}
	public String getJob_position() {
		return job_position;
	}
	public void setJob_position(String job_position) {
		this.job_position = job_position;
	}
	public String getSchool_desc() {
		return school_desc;
	}
	public void setSchool_desc(String school_desc) {
		this.school_desc = school_desc;
	}
	public String getHighschool() {
		return highschool;
	}
	public void setHighschool(String highschool) {
		this.highschool = highschool;
	}
	public Date getHighschool_into() {
		return highschool_into;
	}
	public void setHighschool_into(Date highschool_into) {
		this.highschool_into = highschool_into;
	}
	public Date getHighschool_out() {
		return highschool_out;
	}
	public void setHighschool_out(Date highschool_out) {
		this.highschool_out = highschool_out;
	}
	public String getHighschool_desc() {
		return highschool_desc;
	}
	public void setHighschool_desc(String highschool_desc) {
		this.highschool_desc = highschool_desc;
	}
	public String getHighschoolmajor() {
		return highschoolmajor;
	}
	public void setHighschoolmajor(String highschoolmajor) {
		this.highschoolmajor = highschoolmajor;
	}
	public int getMaybe_friendId() {
		return maybe_friendId;
	}
	public void setMaybe_friendId(int maybe_friendId) {
		this.maybe_friendId = maybe_friendId;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	
	
	public String[] getResons() {
		return resons;
	}
	public void setResons(String[] resons) {
		this.resons = resons;
	}
	public String[] getTogether_friendIds() {
		return together_friendIds;
	}
	public void setTogether_friendIds(String[] together_friendIds) {
		this.together_friendIds = together_friendIds;
	}
	public String[] getTogether_friendNames() {
		return together_friendNames;
	}
	public void setTogether_friendNames(String[] together_friendNames) {
		this.together_friendNames = together_friendNames;
	}
	@Override
	public String toString() {
		return "My_MaybeFriend [job_desc=" + job_desc + ", school_into=" + school_into + ", school_out=" + school_out
				+ ", m_num=" + m_num + ", email=" + email + ", password=" + password + ", name=" + name + ", birthday="
				+ birthday + ", type=" + type + ", yellow_card=" + yellow_card + ", picture=" + picture + ", school="
				+ school + ", born=" + born + ", job=" + job + ", job_addr=" + job_addr + ", job_position="
				+ job_position + ", school_desc=" + school_desc + ", highschool=" + highschool + ", highschool_into="
				+ highschool_into + ", highschool_out=" + highschool_out + ", highschool_desc=" + highschool_desc
				+ ", highschoolmajor=" + highschoolmajor + ", maybe_friendId=" + maybe_friendId
				+ ", together_friendIds=" + Arrays.toString(together_friendIds) + ", together_friendNames="
				+ Arrays.toString(together_friendNames) + ", score=" + score + ", resons=" + Arrays.toString(resons)
				+ "]";
	}
	
	
	
	

	
	
}
