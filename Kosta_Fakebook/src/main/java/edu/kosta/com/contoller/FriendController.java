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
		
		hashMap.put("myid", m_num1);//나
		hashMap.put("maybe_friendId", m_num2);//친구 신청 걸사람
		//System.out.println(m_num1+"//"+m_num2);
		FriendDAO friendDAO = sqlSession.getMapper(FriendDAO.class);
		friendDAO.insertFriend(hashMap);
		
		
		//알수도잇는 친구에 등록되어있는지 체크
		//그렇다면 삭제를 해주자!
		MaybeFriendDAO maybeFriendDAO = sqlSession.getMapper(MaybeFriendDAO.class);
		hashMap.put("myid", m_num1);//나
		hashMap.put("maybe_friendId", m_num2);//친구 신청 걸사람
		MaybeFriend maybeFriend = maybeFriendDAO.check(hashMap);
		if(maybeFriend!=null){
			maybeFriendDAO.deleteMaybeFriend(hashMap);
		}else{
			System.out.println("알수도있는 친구 테이블에 등록되어있지 않는 사용자였습니다. 그냥 친구추가만하면됩니다.");
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
	     // System.out.println("친구추가에 들어왓냐?");
	      Member loginUser = (Member)session.getAttribute("loginUser");
	      int m_num1 = loginUser.getM_num();
	      HashMap<String, Object> hashMap = new HashMap<String, Object>();
	      
	      hashMap.put("myid", m_num1);//나
	      hashMap.put("maybe_friendId", m_num2);//친구 신청 걸사람
	      System.out.println(m_num1+"//"+m_num2);
	      FriendDAO friendDAO = sqlSession.getMapper(FriendDAO.class);
	      friendDAO.insertFriend(hashMap);
	      
	      //친구는 추가하고
	      //알수있는 친구 테이블에서는 빼기!!
	      if(maybe.equals("maybe")){
	   //      System.out.println("알수도있는 사용자를 테이블에서 삭제");
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
	      
	      //1.상대방이 나에게 건 친구 관계를 삭제
	      friendService.deleteFrinedRequested(my_m_num,m_num);
	      //2.상대방이 나에게 친추 걸때 생긴 friendNoti accept 1로만들자
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
	      //read count 1로 변경
	      notiDAO.deleteFrinedRequested(hashmap);
	      //friendNoti accept 1로변경
	      notiDAO.requestFriendAcceptUpdate(hashmap);
	   }
	   
	   @RequestMapping(value="deleteFrinedRequest")
	   public void deleteFrinedRequest(HttpSession session,@RequestParam("m_num") int m_num){
	      
	      Member member = (Member) session.getAttribute("loginUser");
	      HashMap<String, Object> hashmap = new HashMap<String, Object>();
	      hashmap.put("m_num1", member.getM_num());
	      hashmap.put("m_num2", m_num);
	      
	      //1.내가 건 친구관계 삭제
	      friendService.deleteFrinedRequest(hashmap);
	      
	      //2.알람삭제해야하나? 일단 read만 1로 변경
	      NotiDAO notiDAO = sqlSession.getMapper(NotiDAO.class);
	      notiDAO.deleteFrinedRequest(hashmap);
	   }
}
