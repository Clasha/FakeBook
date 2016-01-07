package edu.kosta.com.contoller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.kosta.com.dto.Board;
import edu.kosta.com.dto.Member;
import edu.kosta.com.dto.Reply;
import edu.kosta.com.service.MemberService;
import edu.kosta.com.service.ReplyService;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	@Autowired 
	private MemberService memberService;
	@RequestMapping("replyList")
	public ModelAndView selectReplyByBoardNum(int board_num, int start, int end) {
		ModelAndView mav = new ModelAndView("read_board");
		ArrayList<Reply> reply_list = replyService.selectReplyByBoardNum(board_num);
		
				
		return mav;		
	}
	
	
	@RequestMapping(value="replyinsert", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView insertReply(Reply reply, Board board, HttpServletRequest request) {
		System.out.println("����Է�");
		try {
			replyService.insertReply(reply, board, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
	    Member member = (Member) session.getAttribute("loginUser");
	    ModelAndView mav = new ModelAndView("redirect:/selectByM_num?m_num="+member.getM_num());
		System.out.println(board);
		return mav;
	}
	
	@RequestMapping(value="/updatereply", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updatereply(Reply reply, Board board, HttpServletRequest request) {
		System.out.println("��ۼ���");
		try {
			replyService.updateReply(reply, board, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
	    Member member = (Member) session.getAttribute("loginUser");
	    ModelAndView mav = new ModelAndView("redirect:/selectByM_num?m_num="+member.getM_num());
		System.out.println(board);
		return mav;
	}
	
	@RequestMapping(value="/deletereply", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView deletereply(Reply reply, Board board, HttpServletRequest request) {
		System.out.println("��ۻ���"+ reply.getReply_num());
		try {
			replyService.deleteReply(reply, board, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
	    Member member = (Member) session.getAttribute("loginUser");
	    ModelAndView mav = new ModelAndView("redirect:/selectByM_num?m_num="+member.getM_num());
		System.out.println(board);
		return mav;
	}
}
