package edu.kosta.com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosta.com.dao.NotiDAO;
import edu.kosta.com.dao.ReplyDAO;
import edu.kosta.com.dto.Board;
import edu.kosta.com.dto.Member;
import edu.kosta.com.dto.Reply;
import edu.kosta.com.dto.ReplyNoti;

@Service("ReplyService")
public class ReplyService {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private MemberService memberService;
	public ArrayList<Reply> selectReplyByBoardNum(int board_num) {
		//System.out.println("test1 ");
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("board_num", board_num);
		//System.out.println(board_num+"//"+start+"//"+end);
		ArrayList<Reply> reply_list = sqlSession.getMapper(ReplyDAO.class).selectReplyByBoardNum(hashMap);
		
		for(int i=0;i<reply_list.size();i++){
			reply_list.get(i).setR_name(memberService.getMemberName(reply_list.get(i).getM_num()));
			reply_list.get(i).setR_picture(memberService.getMemberPicture(reply_list.get(i).getM_num()));
		}
		
		return reply_list;
	}

	public void insertReply(Reply reply, Board board, HttpServletRequest request) {
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("board_num", Integer.valueOf(request.getParameter("board_num")));
//		hashmap.put("board_num", board.getBoard_num());
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		hashmap.put("m_num", member.getM_num());
		hashmap.put("parent_reply", reply.getParent_reply());
		hashmap.put("r_content", request.getParameter("reply"));

		sqlSession.getMapper(ReplyDAO.class).insertReply(hashmap);
		int w_m_num = Integer.valueOf(request.getParameter("w_m_num"));
		System.out.println(w_m_num+"///"+member.getM_num());
		System.out.println(reply.getReply_num());
		if (w_m_num != member.getM_num()) {
			HashMap<String, Object> hashmap2 = new HashMap<String, Object>();
			System.out.println("\n\n"+reply.getReply_num());
			hashmap2.put("m_num", w_m_num);
			hashmap2.put("reply_num", reply.getReply_num());
			hashmap2.put("board_num", reply.getBoard_num());
			sqlSession.getMapper(NotiDAO.class).commentNoti(hashmap2);
		}
	}

	public List<ReplyNoti> selectreplynoti(Member member,HttpServletRequest request) {
		System.out.println("test1 ����");
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("m_num", member.getM_num());
		List<ReplyNoti> noti_list = sqlSession.getMapper(NotiDAO.class).selectReplyNoti(hashMap);
		return noti_list;
	}

	public void updateReply(Reply reply, Board board, HttpServletRequest request) {
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("board_num", reply.getBoard_num());
		hashmap.put("reply_num", request.getParameter("up_reply_num"));
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("loginUser");
		hashmap.put("parent_reply", reply.getParent_reply());
		hashmap.put("r_content", request.getParameter("update_reply"));
		System.out.println(reply.getBoard_num()+"///"+member.getM_num()+"///"+request.getParameter("update_reply"));
		sqlSession.getMapper(ReplyDAO.class).updatereply(hashmap);
	}

	public void deleteReply(Reply reply, Board board, HttpServletRequest request) {
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("reply_num", reply.getReply_num());
		System.out.println(reply.getReply_num());
		sqlSession.getMapper(ReplyDAO.class).deletereply(hashmap);
	}

}
