package edu.kosta.com.contoller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.kosta.com.dao.MemberDAO;
import edu.kosta.com.dao.NotiDAO;
import edu.kosta.com.dto.FriendNoti;
import edu.kosta.com.dto.LikeNoti;
import edu.kosta.com.dto.Member;
import edu.kosta.com.dto.My_FriendListCommand;
import edu.kosta.com.dto.My_MaybeFriend;
import edu.kosta.com.dto.Notification;
import edu.kosta.com.dto.SearchMemberCommand;
import edu.kosta.com.service.FriendService;
import edu.kosta.com.service.MaybeFriendService;

@Controller
public class NotificationController {

	private static final Logger logger = LoggerFactory.getLogger(NotificationController.class);
	
	@Autowired
	SqlSession sqlSession;
	@Autowired
	private MaybeFriendService maybeFriendService;
	@Autowired
	private FriendService friendService;
	
	
	@RequestMapping("insertFriendNoti")
	public String insertFriendNoti(HttpSession session, 
									@RequestParam("m_num") int m_num) {
		logger.info("<<insertFriendNoti>> m_num: " + m_num);
		
		NotiDAO notiDAO = sqlSession.getMapper(NotiDAO.class);
		Member loginUser = (Member) session.getAttribute("loginUser");
		System.out.println("로그인 유저는 test test  : "+loginUser.getName());
		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("m_num", m_num); 
		hashmap.put("f_num", loginUser.getM_num()); 
		notiDAO.insertFriendNoti(hashmap);
		return "search/searchMembers";
	}
	
	@RequestMapping("countFriendNoti")
	public String countFriendNoti(HttpSession session, Model model) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		logger.info("<<countFriendNoti>> m_num: " + loginUser.getM_num());
		
		NotiDAO notiDAO = sqlSession.getMapper(NotiDAO.class);
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("m_num", loginUser.getM_num());
		int count = notiDAO.countFriendNoti(hashmap);
		model.addAttribute("count", count);
		return "search/searchMembers";
	}
	
	/* 로직?
	FriendNoti: noti_num, m_num, f_num, accept
	SearchMemberCommand: name, m_num, isFriend, picture, friendshipConfirm		
	f_num으로 멤버 정보를 가져와야 함..
	f_num으로 이메일을 검색해서 그 이메일로 searchMember
	String email = Memberdao.selectEmailByNum(f_num);*/
	@RequestMapping("selectFriendNoti")
	public String selectFriendNoti(HttpSession session, Model model) {			
		Member loginUser = (Member) session.getAttribute("loginUser");
		logger.info("<<selectFriendNoti>> m_num: " + loginUser.getM_num());
		
		NotiDAO notiDAO = sqlSession.getMapper(NotiDAO.class);
		HashMap<String, Object> hashmap = new HashMap<String, Object>();		
		hashmap.put("m_num", loginUser.getM_num());
		List<FriendNoti> f_notiList = notiDAO.selectFriendNoti(hashmap);
		List<Notification> notiList = notiDAO.selectNoti(hashmap);
		
		List<SearchMemberCommand> searchList = new ArrayList<SearchMemberCommand>();
		

		for (int i = 0; i < f_notiList.size(); i++) {
			
			FriendNoti f_noti = f_notiList.get(i);
			
			MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
			String email = memberDAO.selectEmailByNum(f_noti.getF_num());
			hashmap.put("keyword", email);
			
			List<SearchMemberCommand> temp = memberDAO.searchMembers(hashmap);
			
			for (int j = 0; j < notiList.size(); j++) {
				
				Notification noti = notiList.get(j);
				if(noti.getNoti_num()==f_noti.getNoti_num()) {					
					searchList.add(temp.get(0));
					System.out.println("친구요청  " + f_noti);
					System.out.println("	" + noti);
					System.out.println("	" + temp.get(0));
				}
			}
			
		}// f_notiList 반복 끝
		for (SearchMemberCommand s : searchList) {
			System.out.println(s);
		}
		for (FriendNoti f : f_notiList) {
			System.out.println(f);
		}
		model.addAttribute("f_notiList", f_notiList);
		model.addAttribute("searchList", searchList);

		//HttpSession session = request.getSession();
		Member member2 = (Member) session.getAttribute("loginUser");
		
		maybeFriendService.getMaybeFriendList(member2);
		ArrayList<My_MaybeFriend> my_maybeFriendList = maybeFriendService.getMaybeList_ScoreSort(member2);
		model.addAttribute("my_maybeFriendList",my_maybeFriendList);
		
		ArrayList<My_FriendListCommand> friendList=friendService.getFriendList(member2);
		model.addAttribute("friendList",friendList);
		session.setAttribute("friendList",friendList);

		
		return "notification/notiView";
	}
	
	@RequestMapping("readNoti")
	public String readNoti(HttpSession session, @RequestParam("noti_num") int noti_num) {
		System.out.println("<< NotificationController readNoti >> noti_num : " + noti_num);
		NotiDAO notiDAO = sqlSession.getMapper(NotiDAO.class);
		notiDAO.readNoti(noti_num);
		return "notification/notiView";
	}
	
	@RequestMapping("insertLikeNoti")
	public void insertLikeNoti(HttpSession session, @RequestParam("board_num") int board_num) {
		System.out.println("<< NotificationController : insertNoti >> board_num=" + board_num);
		
		NotiDAO notiDAO = sqlSession.getMapper(NotiDAO.class);
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("m_num", loginUser.getM_num());
		hashmap.put("board_num", board_num); 		
		notiDAO.insertLikeNoti(hashmap);
	}
	
	@RequestMapping("getLikeNotis")
	public ModelAndView getLikeNotis(@RequestParam("m_num")int m_num) {		
		System.out.println("<< NotificationController : getLikeNotis >> m_num=" + m_num);
		ModelAndView mav = new ModelAndView("notification/likeNotis");
		NotiDAO notiDAO = sqlSession.getMapper(NotiDAO.class);
		List<LikeNoti> likeNotis = notiDAO.getLikeNotis(m_num);
		mav.addObject("likeNotis", likeNotis);
		return mav;
	}
	
	
}
