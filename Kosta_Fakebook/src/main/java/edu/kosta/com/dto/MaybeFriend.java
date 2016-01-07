package edu.kosta.com.dto;

public class MaybeFriend {
	/*myId NUMBER(10),  접속한사람 아이디
	maybe_friendId NUMBER(10), 알만한 친구아이디
	score number,  알만한 친구의 점수
	reson varchar2(400) 알만한친구를 아는 이유*/
	
	private int myId;
	private int maybe_friendId;
	private String together_friendId;
	private int score;
	private String reson;
	public MaybeFriend() {
	}
	public int getMyId() {
		return myId;
	}
	public void setMyId(int myId) {
		this.myId = myId;
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
	public String getReson() {
		return reson;
	}
	public void setReson(String reson) {
		this.reson = reson;
	}
	
	public String getTogether_friendId() {
		return together_friendId;
	}
	public void setTogether_friendId(String together_friendId) {
		this.together_friendId = together_friendId;
	}
	@Override
	public String toString() {
		return "MaybeFriend [myId=" + myId + ", maybe_friendId=" + maybe_friendId + ", together_friendId="
				+ together_friendId + ", score=" + score + ", reson=" + reson + "]";
	}
	
	
}
