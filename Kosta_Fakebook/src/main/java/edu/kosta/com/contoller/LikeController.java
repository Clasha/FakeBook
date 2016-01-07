package edu.kosta.com.contoller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kosta.com.dao.BLikeDAO;
import edu.kosta.com.dto.Member;

@Controller
public class LikeController {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("boardLike")
	public String boardLike(@RequestParam("board_num")int board_num, HttpSession session) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int m_num = loginUser.getM_num();		
		//System.out.println("<< boardLike >> board_num : " + board_num + " m_num: " + m_num);
		
		BLikeDAO dao = sqlSession.getMapper(BLikeDAO.class);
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("board_num", board_num);
		hashmap.put("m_num", m_num);
		dao.boardLike(hashmap);
		
		return "read_board";
	}
	
	@RequestMapping("boardLikeCancel")
	public String boardLikeCancel(@RequestParam("board_num")int board_num, HttpSession session) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		int m_num = loginUser.getM_num();
		//System.out.println("<< boardLikeCancel >> board_num : " + board_num + " m_num: " + m_num);
		
		BLikeDAO dao = sqlSession.getMapper(BLikeDAO.class);
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("board_num", board_num);
		hashmap.put("m_num", m_num);
		dao.boardLikeCancel(hashmap);
		
		return "read_board";
	}
}
