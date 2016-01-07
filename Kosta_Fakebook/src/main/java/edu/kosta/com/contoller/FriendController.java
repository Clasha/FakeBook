package edu.kosta.com.contoller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kosta.com.dao.FriendDAO;
import edu.kosta.com.dao.MaybeFriendDAO;
import edu.kosta.com.dao.NotiDAO;
import edu.kosta.com.dto.MaybeFriend;
import edu.kosta.com.dto.Member;
import edu.kosta.com.service.FriendService;

@Controller
public class FriendController {
	private static final Logger logger = LoggerFactory.getLogger(FriendController.class);
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	FriendService friendService;
	
	
	@RequestMapping("friendInsert")
	public String insertFriend(HttpSession session, @RequestParam("m_num") int m_num2) {
		logger.info("insertFriend: m_num2=" + m_num2);
		//System.out.println("AJAX - insertFriend... m_num2=" + m_num2);
		Member loginUser = (Member)session.getAttribute("loginUser");
		int m_num1 = loginUser.getM_num();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		
		hashMap.put("myid", m_num1);//��
		hashMap.put("maybe_friendId", m_num2);//ģ�� ��û �ɻ��
		//System.out.println(m_num1+"//"+m_num2);
		FriendDAO friendDAO = sqlSession.getMapper(FriendDAO.class);
		friendDAO.insertFriend(hashMap);
		
		
		//�˼����մ� ģ���� ��ϵǾ��ִ��� üũ
		//�׷��ٸ� ������ ������!
		MaybeFriendDAO maybeFriendDAO = sqlSession.getMapper(MaybeFriendDAO.class);
		hashMap.put("myid", m_num1);//��
		hashMap.put("maybe_friendId", m_num2);//ģ�� ��û �ɻ��
		MaybeFriend maybeFriend = maybeFriendDAO.check(hashMap);
		if(maybeFriend!=null){
			maybeFriendDAO.deleteMaybeFriend(hashMap);
		}else{
			System.out.println("�˼����ִ� ģ�� ���̺� ��ϵǾ����� �ʴ� ����ڿ����ϴ�. �׳� ģ���߰����ϸ�˴ϴ�.");
		}
		
		return "search/searchMembers";
	}
	
	
	@RequestMapping("FriendDelete")
	public String deleteFriend(HttpSession session, @RequestParam("m_num") int m_num2) {
		logger.info("deleteFriend: m_num2=" + m_num2);
		//System.out.println("AJAX - deleteFriend... m_num2=" + m_num2);
		Member loginUser = (Member)session.getAttribute("loginUser");
		int m_num1 = loginUser.getM_num();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("m_num1", m_num1);
		hashMap.put("m_num2", m_num2);
		
		FriendDAO friendDAO = sqlSession.getMapper(FriendDAO.class);
		friendDAO.deleteFriend(hashMap);
		return "search/searchMembers";
	}
	
	@RequestMapping("friendInsert_maybeout")
	   public String insertFriendMaybeOut(HttpSession session, @RequestParam("m_num") int m_num2,@RequestParam("maybe") String maybe) {
	      logger.info("insertFriend: m_num2=" + m_num2);
	     // System.out.println("ģ���߰��� ���ӳ�?");
	      Member loginUser = (Member)session.getAttribute("loginUser");
	      int m_num1 = loginUser.getM_num();
	      HashMap<String, Object> hashMap = new HashMap<String, Object>();
	      
	      hashMap.put("myid", m_num1);//��
	      hashMap.put("maybe_friendId", m_num2);//ģ�� ��û �ɻ��
	      System.out.println(m_num1+"//"+m_num2);
	      FriendDAO friendDAO = sqlSession.getMapper(FriendDAO.class);
	      friendDAO.insertFriend(hashMap);
	      
	      //ģ���� �߰��ϰ�
	      //�˼��ִ� ģ�� ���̺����� ����!!
	      if(maybe.equals("maybe")){
	   //      System.out.println("�˼����ִ� ����ڸ� ���̺��� ����");
	         MaybeFriendDAO maybeFriendDAO = sqlSession.getMapper(MaybeFriendDAO.class);
	         int count = maybeFriendDAO.checkMaybe(hashMap);
	         if(count != 0){
	            maybeFriendDAO.deleteMaybeFriend(hashMap);
	         }
	      }
	      return "search/searchMembers";
	   }
	   
	   @RequestMapping(value="deleteFrinedRequested")
	   public void deleteFrinedRequested(HttpSession session,@RequestParam("m_num") int m_num){
	      Member member =(Member) session.getAttribute("loginUser");
	      int my_m_num = member.getM_num();
	      
	      //1.������ ������ �� ģ�� ���踦 ����
	      friendService.deleteFrinedRequested(my_m_num,m_num);
	      //2.������ ������ ģ�� �ɶ� ���� friendNoti accept 1�θ�����
	      HashMap<String, Object> hashmap = new HashMap<String, Object>();
	      hashmap.put("m_num1", my_m_num);
	      hashmap.put("m_num2", m_num);
	      NotiDAO notiDAO = sqlSession.getMapper(NotiDAO.class);
	      notiDAO.deleteFrinedRequested(hashmap);
	   }
	   
	   @RequestMapping("requestFriendReadNoti")
	   public void requestFriendReadNoti(HttpSession session,@RequestParam("m_num")int m_num){
	      NotiDAO notiDAO = sqlSession.getMapper(NotiDAO.class);
	      Member member = (Member)session.getAttribute("loginUser");
	      int my_m_num = member.getM_num();
	      HashMap<String, Object> hashmap = new HashMap<String, Object>();
	      hashmap.put("m_num1", my_m_num);
	      hashmap.put("m_num2", m_num);
	      //read count 1�� ����
	      notiDAO.deleteFrinedRequested(hashmap);
	      //friendNoti accept 1�κ���
	      notiDAO.requestFriendAcceptUpdate(hashmap);
	   }
	   
	   @RequestMapping(value="deleteFrinedRequest")
	   public void deleteFrinedRequest(HttpSession session,@RequestParam("m_num") int m_num){
	      
	      Member member = (Member) session.getAttribute("loginUser");
	      HashMap<String, Object> hashmap = new HashMap<String, Object>();
	      hashmap.put("m_num1", member.getM_num());
	      hashmap.put("m_num2", m_num);
	      
	      //1.���� �� ģ������ ����
	      friendService.deleteFrinedRequest(hashmap);
	      
	      //2.�˶������ؾ��ϳ�? �ϴ� read�� 1�� ����
	      NotiDAO notiDAO = sqlSession.getMapper(NotiDAO.class);
	      notiDAO.deleteFrinedRequest(hashmap);
	   }
}
