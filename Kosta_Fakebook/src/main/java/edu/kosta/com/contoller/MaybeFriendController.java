package edu.kosta.com.contoller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.kosta.com.dto.Member;
import edu.kosta.com.dto.My_FriendListCommand;
import edu.kosta.com.dto.My_MaybeFriend;
import edu.kosta.com.service.FriendService;
import edu.kosta.com.service.MaybeFriendService;

@Controller
public class MaybeFriendController {
	
	@Autowired
	private MaybeFriendService maybeFriendService;
	@Autowired
	private FriendService friendService;
	@RequestMapping(value="maybeAllFriendPage")
	public ModelAndView maybeAllFriendPage(HttpServletRequest request){
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		
		ArrayList<My_MaybeFriend> list = maybeFriendService.getMaybeList_ScoreSort(member);
		
		ArrayList<Member> memberInfo=friendService.getRequestFriendList(member);//
		
		ArrayList<Member> requestedMemberInfo = friendService.getRequestedFriendList(member);//
		
		ArrayList<My_FriendListCommand> friendList=friendService.getFriendList(member);

		
		//System.out.println(memberInfo.size());
		//System.out.println(requestedMemberInfo.size());
		ModelAndView mav = new ModelAndView();
		mav.addObject("friendList",friendList);
		session.setAttribute("friendList",friendList);
		mav.addObject("maybeList",list);
		mav.addObject("requestMemberInfo",memberInfo);
		mav.addObject("requestedMemberInfo",requestedMemberInfo);
		mav.setViewName("maybeFriend/maybeFriendAll");
		return mav;
	}
}
