package edu.kosta.com.contoller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.kosta.com.dto.Board;
import edu.kosta.com.dto.Member;
import edu.kosta.com.dto.My_Profile_FriendListCommand;
import edu.kosta.com.dto.Reply;
import edu.kosta.com.dto.ReplyNoti;
import edu.kosta.com.service.BoardService;
import edu.kosta.com.service.FriendService;
import edu.kosta.com.service.MemberService;
import edu.kosta.com.service.ReplyService;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private FriendService friendService;

	
	@RequestMapping("memberInsert")
	public ModelAndView insertMember(@ModelAttribute("member") Member member, HttpServletRequest request) {
		logger.info("member insert");
		memberService.insertMember(member, request);
		ModelAndView mav = new ModelAndView("joinComplete");
		return mav;
	}

	@RequestMapping(value="/profile")
	public ModelAndView profileInfo(HttpServletRequest request) {
		
		int start = 1;
		int end = start + 1;
		int reply_start = 1;
		int reply_end = reply_start+1;
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("loginUser");
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("email", member.getEmail());
		
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
		
		
		
		List<Member> myProfileDTO = memberService.myProfile(request);
		ArrayList<Board> myPictureDTO = boardService.selectMyPictureBoardNum(request, reply_start, reply_end);
		List<Board> boards = boardService.selectTimeLine(request);
		
		for (int i = 0; i < boards.size(); i++) {
			int board_num = boards.get(i).getBoard_num();
			ArrayList<Reply> r = replyService.selectReplyByBoardNum(board_num);
			boards.get(i).setReplyList(r);
			boards.get(i).setMemberPicture(memberService.getMemberPicture(boards.get(i).getM_num() ));
			boards.get(i).setWriter_name(memberService.getMemberName(boards.get(i).getM_num()));
			
		}
		
		ArrayList<My_Profile_FriendListCommand> my_profile_friendList = new ArrayList<My_Profile_FriendListCommand>();
		ArrayList<My_Profile_FriendListCommand> friend_profile_togetherList = new ArrayList<My_Profile_FriendListCommand>();
		ArrayList<Member> no_togetherFriends = new ArrayList<Member>();

		boolean flag = false;
		int count = 0;
		if(num==member.getM_num()){
			my_profile_friendList=friendService.getMyProfileFriendList(member); 
		}else{
			flag=friendService.isRealFriend(request);
			if(!flag){
	            count = friendService.isfriendRequestCehck(request);
	         }
			friend_profile_togetherList = friendService.getProfileTogetherFriendList(request);
			no_togetherFriends =  friendService.getTogether_removeFriend(friend_profile_togetherList,num,member.getM_num());
		}

		ModelAndView mav = new ModelAndView();

		if(num == member.getM_num()){
			mav.addObject("my_profile_friendList",my_profile_friendList);
		}

		System.out.println( "num : " + num);
		
		if(num != member.getM_num()  ){
			mav.addObject("friend_profile_togetherList",friend_profile_togetherList);
			mav.addObject("no_togetherFriends",no_togetherFriends);
		}
        if(count == 1){
           mav.addObject("requestingFriend",true);
        }
				
		mav.addObject("flag",flag);
		mav.addObject("myProfile", myProfileDTO);
		mav.addObject("boards", boards);
		mav.addObject("mypicture",myPictureDTO);
		List<ReplyNoti> noti_list = replyService.selectreplynoti(member, request);
		mav.addObject("noti_List", noti_list);//추가
		mav.setViewName("/profile/profile");
		
		return mav;
	}
	

	@RequestMapping(value="/friendList")
	public ModelAndView friendList(HttpServletRequest request) {

		List<Member> myProfileDTO = memberService.myProfile(request);
		List<Member> myFriendListDTO = memberService.myFriendList(request);

		ModelAndView mav = new ModelAndView();
		mav.addObject("myProfile", myProfileDTO);
		mav.addObject("myFriendList", myFriendListDTO);
		mav.setViewName("/profile/friendList");
		
		return mav;
	}
	
	
	@RequestMapping(value="/memberOut")
	public String memberOut(@RequestParam("m_num")int m_num, HttpSession session) {
		System.out.println("<< MemberController-memberOut >> m_num=" + m_num);
		session.invalidate();
		memberService.memberOut(m_num);
		return "index";
	}

	@RequestMapping("memberPictureUpload")
	public void memberPictureUpload(HttpServletRequest request, @RequestParam("m_num")int m_num, HttpSession session) throws Exception {
		System.out.println("<< MemberController-memberPictureUpload >> m_num=" + m_num);
		memberService.memberPictureUpload(request, m_num, session);
	}
}
