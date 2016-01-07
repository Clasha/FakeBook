package edu.kosta.com.service;

import java.io.ObjectOutputStream.PutField;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import edu.kosta.com.dao.MemberDAO;
import edu.kosta.com.dto.Member;
import edu.kosta.com.utils.MyPictureFileUtils;

@Service("MemberService")
public class MemberService {
	@Autowired
	private SqlSession sqlSession;
	@Resource(name = "myPictureFileUtils")
	private MyPictureFileUtils fileUtils;
	
	public void insertMember(@ModelAttribute("member") Member member, HttpServletRequest request) {

		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("email", member.getEmail());
		hashMap.put("name", member.getName());
		hashMap.put("password", member.getPassword());
		hashMap.put("birthday", member.getBirthday());
		System.out.println(hashMap);
		sqlSession.getMapper(MemberDAO.class).insertMember(hashMap);
	}
	
	
	public List<Member> myProfile(HttpServletRequest request) {

		String num2=null; 
		
		int num=0;
		if (request.getParameter("fnum") != null) {
			num = Integer.parseInt( request.getParameter("fnum") );
		}else if(request.getParameter("num").contains(" ")){
			num2 = request.getParameter("num").trim();
		}else{
			num2=request.getParameter("num");
		}
		
		if(num2!=null){
			num = Integer.parseInt(num2);
		}
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("m_num", num);
		
		List<Member> memberDTO = sqlSession.getMapper(MemberDAO.class).myProfile(hashMap);
	
		return memberDTO;
	}
	
	// 
	public List<Member> myFriendsProfile(HttpServletRequest request) {
		
		String num2=null; 
		
		int num=0;
		if (request.getParameter("fnum") != null) {
			num = Integer.parseInt( request.getParameter("fnum") );
		}else if(request.getParameter("num").contains(" ")){
			num2 = request.getParameter("num").trim();
		}else{
			num2=request.getParameter("num");
		}
		
		if(num2!=null){
			num = Integer.parseInt(num2);
		}
		
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("m_num1", num);

		List<Member> memberFriendDTO = sqlSession.getMapper(MemberDAO.class).myFriendsProfile(hashMap);
		
		return memberFriendDTO;
	}

	
	// 
	public List<Member> myFriendList(HttpServletRequest request) {

		String num2=null; 
		
		int num=0;
		if (request.getParameter("fnum") != null) {
			num = Integer.parseInt( request.getParameter("fnum") );
		}else if(request.getParameter("num").contains(" ")){
			num2 = request.getParameter("num").trim();
		}else{
			num2=request.getParameter("num");
		}
		
		if(num2!=null){
			num = Integer.parseInt(num2);
		}

		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("m_num1", num);

		List<Member> friendListDTO = sqlSession.getMapper(MemberDAO.class).myFriendsProfile(hashMap);
		
		return friendListDTO;
	}
	
	
	
	//�빮���� memberService method START
	public void memberJobInsert(HashMap<String, String> hashmap){
		
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		dao.memberJobInsert(hashmap);
	}
	
	public Member memberJobList(HashMap<String, String> hashmap){
		System.out.println("memberService memberJobList method ����");
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		Member member = dao.memberJobList(hashmap);
		return member;
	}
	
	public void memberJobDelete(HashMap<String, String> hashmap){
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		dao.memberJobDelete(hashmap);
	}
	
	public void memberSchoolInsert(HashMap<String, String> hashmap){
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		dao.memberSchoolInsert(hashmap);
	}

	public void memberSchoolDelete(HashMap<String, String> hashmap) {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		dao.memberSchoolDelete(hashmap);
	}

	public void memberHighSchoolSave(HashMap<String, String> hashmap) {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		dao.memberHighSchoolSave(hashmap);
		
	}

	public void memberHighSchoolDelete(HashMap<String, String> hashmap) {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		dao.memberHighSchoolDelete(hashmap);
	}

	public void memberBornSave(HashMap<String, String> hashmap) {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		dao.memberBornSave(hashmap);
		
	}

	public void memberBornDelete(HashMap<String, String> hashmap) {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		dao.memberBornDelete(hashmap);
		
	}

	public ArrayList<String> getSchoolList(String value) {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		 HashMap<String, String> hashMap = new HashMap<String, String>();
		// System.out.println("vlaue=>"+value);
		  hashMap.put("school", value);
		return dao.getSchoolList(hashMap);
	}

	public ArrayList<String> getHighSchoolList(String value) {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		 HashMap<String, String> hashMap = new HashMap<String, String>();
		// System.out.println("vlaue=>"+value);
		  hashMap.put("highschool", value);
		return dao.getHighSchoolList(hashMap);
	}

	public ArrayList<String> getHighSchoolMajorList(String value) {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		 HashMap<String, String> hashMap = new HashMap<String, String>();
		 System.out.println("vlaue=>"+value);
		  hashMap.put("major", value);
		return dao.getHighSchoolMajorList(hashMap);
	}
	
	public void memberOut(int m_num) {
	      MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
	      HashMap<String, Object> hashMap = new HashMap<String, Object>();
	      hashMap.put("m_num", m_num);
	      dao.memberOut(hashMap);
	   }
	
	
	public void memberPictureUpload(HttpServletRequest request, int m_num, HttpSession session) throws Exception {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("m_num", m_num);
		
		MultipartHttpServletRequest mpRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = null;
		while (iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				/*System.out.println("------------- file start -------------");
				System.out.println("name : " + multipartFile.getName());
				System.out.println("filename : " + multipartFile.getOriginalFilename());
				System.out.println("size : " + multipartFile.getSize());
				System.out.println("-------------- file end --------------\n");*/
			}
		}

		List<Map<String, Object>> fileInfo = fileUtils.parseInsertFileInfo(hashMap, mpRequest);
		for (int i = 0, size = fileInfo.size(); i < size; i++) {
		/*	System.out.println("------------- file upload start -------------");
			System.out.println(fileInfo.get(i).get("M_NUM"));
			System.out.println(fileInfo.get(i).get("ORIGINAL_FILE_NAME"));
			System.out.println(fileInfo.get(i).get("STORED_FILE_NAME"));
			System.out.println(fileInfo.get(i).get("FILE_SIZE"));
			System.out.println(fileInfo.get(i).get("FILE_TYPE"));
			System.out.println("-------------- file upload end --------------\n");*/

			StringTokenizer tokenizer = new StringTokenizer((String) fileInfo.get(i).get("FILE_TYPE"), "/");
			if (tokenizer.hasMoreTokens()) {
				String fileType = tokenizer.nextToken();
			//	System.out.println("fileType : " + fileType);
				if (fileType.equals("image")) {
					hashMap.put("picture", fileInfo.get(i).get("STORED_FILE_NAME"));
				} 
			}
		}

		System.out.println(hashMap);
		sqlSession.getMapper(MemberDAO.class).updatePicture(hashMap);
		
		String picture = (String) hashMap.get("picture");
	      Member newLoginUser = (Member)session.getAttribute("loginUser");
	      newLoginUser.setPicture(picture);
	      session.setAttribute("loginUser", newLoginUser);
	}


	public String getMemberPicture(int m_num) {
		
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("m_num", m_num);
		
	
		return dao.getMemberPicture(hash);
	}


	public String getMemberName(int m_num) {
		
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		
		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("m_num", m_num);
		
		
		return dao.getMemberName(hash);
	}
	
	
}
