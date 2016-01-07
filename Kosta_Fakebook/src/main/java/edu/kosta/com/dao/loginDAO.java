package edu.kosta.com.dao;

import java.util.HashMap;

import edu.kosta.com.dto.Member;

public interface loginDAO {
	
	//db와 연결되어 로그인 체크를 하는 method들 이다.
	public Member emailCheck(HashMap<String, String> memberEmailAndPwd);
	public Member pwdCheck(HashMap<String, String> memberEmailAndPwd);
}
