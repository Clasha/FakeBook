package edu.kosta.com.dao;

import java.util.HashMap;

import edu.kosta.com.dto.Member;

public interface loginDAO {
	
	//db�� ����Ǿ� �α��� üũ�� �ϴ� method�� �̴�.
	public Member emailCheck(HashMap<String, String> memberEmailAndPwd);
	public Member pwdCheck(HashMap<String, String> memberEmailAndPwd);
}
