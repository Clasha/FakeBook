package edu.kosta.com.contoller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.kosta.com.dao.NotiDAO;
import edu.kosta.com.dto.Board;
import edu.kosta.com.dto.BoardCommand;
import edu.kosta.com.dto.LikeNoti;
import edu.kosta.com.dto.Member;
import edu.kosta.com.dto.My_FriendListCommand;
import edu.kosta.com.dto.My_MaybeFriend;
import edu.kosta.com.dto.Reply;
import edu.kosta.com.dto.ReplyNoti;
import edu.kosta.com.service.BoardService;
import edu.kosta.com.service.FriendService;
import edu.kosta.com.service.HashTagService;
import edu.kosta.com.service.MaybeFriendService;
import edu.kosta.com.service.MemberService;
import edu.kosta.com.service.ReplyService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private MaybeFriendService maybeFriendService;
	@Autowired
	private FriendService friendService;
	@Autowired
	private HashTagService hashTagService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("insertBoard")
	public ModelAndView insertBoard(Board board, HttpServletRequest request) {
		//System.out.println("<< insertBoard >> board: " + board);
		try {
			boardService.insertBoard(board, request);
			hashTagService.insertHashtag(board.getContent(), board.getBoard_num());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mav = new ModelAndView("redirect:/selectByM_num?m_num="+board.getM_num());
		return mav;
	}

	@RequestMapping(value = "selectByM_num", method = RequestMethod.GET)
	public ModelAndView selectByM_num(Member member, HttpServletRequest request) {
		int start = 1;
		int end = start + 1;
		
		List<Board> boards = boardService.selectPartOfBoard(member, start, end);
		
		//ArrayList<BoardCommand> newBorads = new ArrayList<BoardCommand>();
		for (int i = 0; i < boards.size(); i++) {
			int board_num = boards.get(i).getBoard_num();
			ArrayList<Reply> r = replyService.selectReplyByBoardNum(board_num);
			boards.get(i).setReplyList(r);
			boards.get(i).setMemberPicture(memberService.getMemberPicture(boards.get(i).getM_num() ));
			boards.get(i).setWriter_name(memberService.getMemberName(boards.get(i).getM_num()));
			System.out.println("dmdkdkdkdkdkdkdk111 :" + boards);
		}
		ModelAndView mav = new ModelAndView("main");
		
		HttpSession session = request.getSession();
		Member member2 = (Member) session.getAttribute("loginUser");
		
		maybeFriendService.dropMaybeFriends(member2);
		
		maybeFriendService.getMaybeFriendList(member2);
		ArrayList<My_MaybeFriend> my_maybeFriendList = maybeFriendService.getMaybeList_ScoreSort(member2);
		mav.addObject("my_maybeFriendList",my_maybeFriendList);
		List<ReplyNoti> noti_list = replyService.selectreplynoti(member, request);
		mav.addObject("noti_List", noti_list);
		mav.addObject("boards", boards);
		
		

		ArrayList<My_FriendListCommand> friendList=friendService.getFriendList(member2);
		mav.addObject("friendList",friendList);
		session.setAttribute("friendList",friendList);
		
		return mav;
	}

	@RequestMapping(value = "selectMoreBoard")
	public String selectMoreBoard(HttpSession session, @RequestParam("count") int count, Model model) {

		Member member = (Member) session.getAttribute("loginUser");
		int start = count + 1;
		int end = start + 1;
		List<Board> boards = boardService.selectPartOfBoard(member, start, end);

		for (int i = 0; i < boards.size(); i++) {
			int board_num = boards.get(i).getBoard_num();
			ArrayList<Reply> r = replyService.selectReplyByBoardNum(board_num);
			boards.get(i).setReplyList(r);
			boards.get(i).setMemberPicture(memberService.getMemberPicture(boards.get(i).getM_num() ));
			boards.get(i).setWriter_name(memberService.getMemberName(boards.get(i).getM_num()));
			System.out.println("dmdkdkdkdkdkdkdk222 :" + boards);
		}
		
		
		model.addAttribute("boards", boards);
		return "read_board";
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public ModelAndView detail(Integer board_num, HttpServletRequest request) {
		List<Board> detail_view = null;
		board_num = Integer.valueOf(request.getParameter("board_num"));
		try {
			detail_view = boardService.detail(board_num, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (int i = 0; i < detail_view.size(); i++) {
			board_num = detail_view.get(i).getBoard_num();
			ArrayList<Reply> r = replyService.selectReplyByBoardNum(board_num);
			detail_view.get(i).setReplyList(r);
			detail_view.get(i).setMemberPicture(memberService.getMemberPicture(detail_view.get(i).getM_num() ));
			detail_view.get(i).setWriter_name(memberService.getMemberName(detail_view.get(i).getM_num()));
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("detail", detail_view);
		return mav;
	}
	
	
	@RequestMapping(value = "searchyoyo", method = RequestMethod.GET)
	public ModelAndView selectByHashtag(Member member, HttpServletRequest request) {
		
		String hashtag = request.getParameter("hashtag");
		System.out.println("<< BoardController:selectByHashtag >> hashtag = " + hashtag);
		int start = 1;
		int end = start + 1;
		
		int boardNum = 0 ;
		 if(request.getParameter("boardNum")!=null){
	    	  boardNum =Integer.parseInt(request.getParameter("boardNum"));
	      }
		
		List<Board> boards = null;
		if(boardNum != 0){
			boards = boardService.selectBoardOne(boardNum);
		}else{
			boards = boardService.selectBoardByHash(hashtag, start, end);
		}
		
		

		for (int i = 0; i < boards.size(); i++) {
			int board_num = boards.get(i).getBoard_num();
			ArrayList<Reply> r = replyService.selectReplyByBoardNum(board_num);
			boards.get(i).setReplyList(r);
			boards.get(i).setMemberPicture(memberService.getMemberPicture(boards.get(i).getM_num() ));
			boards.get(i).setWriter_name(memberService.getMemberName(boards.get(i).getM_num()));
			
		}
		ModelAndView mav = new ModelAndView("search/hashtag");
		
		
		
		HttpSession session = request.getSession();
		Member member2 = (Member) session.getAttribute("loginUser");
		
		maybeFriendService.getMaybeFriendList(member2);
		ArrayList<My_MaybeFriend> my_maybeFriendList = maybeFriendService.getMaybeList_ScoreSort(member2);
		mav.addObject("my_maybeFriendList",my_maybeFriendList);
		
		mav.addObject("boards", boards);
		
		ArrayList<My_FriendListCommand> friendList=friendService.getFriendList(member2);
		mav.addObject("friendList",friendList);
		session.setAttribute("friendList",friendList);
		
		return mav;
	}
	
	
	@RequestMapping("deleteBoard")
	public String deleteBoard(@RequestParam("board_num") int board_num) {
		System.out.println("<< deleteBoard >> board_num: " + board_num);
		hashTagService.deleteHashTag(board_num);
		boardService.deleteBoard(board_num);		
		return "read_board";
	}
	
	@RequestMapping("updateBoard")
	public String updateBoard(@RequestParam("board_num") int board_num,
			@RequestParam("editContent") String editContent,
			@RequestParam("openLevel") int openLevel){
		System.out.println("<< updateBoard >> board_num: " + board_num + " editContent: " + editContent + " openLevel" + openLevel);
		boardService.updateBoard(board_num, editContent, openLevel);
		hashTagService.deleteHashTag(board_num);
		hashTagService.insertHashtag(editContent, board_num);
		return "read_board";
	}
	
	@RequestMapping(value="/detail2", method=RequestMethod.GET)
	public ModelAndView detail2(Integer board_num, Integer noti_num, HttpServletRequest request) {
		List<Board> detail_view = null;
		board_num = Integer.valueOf(request.getParameter("board_num"));
		noti_num = Integer.valueOf(request.getParameter("noti_num"));
		System.out.println("알림번호"+noti_num);
		try {
			detail_view = boardService.detail2(board_num, noti_num, request);
			System.out.println(detail_view.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		for (int i = 0; i < detail_view.size(); i++) {
			board_num = detail_view.get(i).getBoard_num();
			ArrayList<Reply> r = replyService.selectReplyByBoardNum(board_num);
			detail_view.get(i).setReplyList(r);
			detail_view.get(i).setMemberPicture(memberService.getMemberPicture(detail_view.get(i).getM_num() ));
			detail_view.get(i).setWriter_name(memberService.getMemberName(detail_view.get(i).getM_num()));
		}
		ModelAndView mav = new ModelAndView("detail2");
		mav.addObject("detail2", detail_view);
		HttpSession session = request.getSession();
		Member member2 = (Member) session.getAttribute("loginUser");
		System.out.println(member2);
		List<ReplyNoti> noti_list = replyService.selectreplynoti(member2, request);
		mav.addObject("noti_List", noti_list);
		

// 추가함
		ArrayList<My_FriendListCommand> friendList=friendService.getFriendList(member2);
		mav.addObject("friendList",friendList);
		session.setAttribute("friendList",friendList);
		
		
		return mav;
	}
}
