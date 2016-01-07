package edu.kosta.com.contoller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.junit.runner.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kosta.com.dao.MemberDAO;
import edu.kosta.com.dto.Member;
import edu.kosta.com.dto.My_FriendListCommand;
import edu.kosta.com.dto.SearchMemberCommand;
import edu.kosta.com.service.FriendService;

@Controller
public class SearchController {

	@Autowired
	SqlSession sqlSession;
	@Autowired
	private FriendService friendService;
	/*@RequestParam("keyword") String keyword, */
	@RequestMapping("searchMembers")
	   public String searchMember(
	HttpSession session, Model model,HttpServletRequest request) throws UnsupportedEncodingException {
	     String keyword = request.getParameter("keyword");
		System.out.println("INFO : FakeBook - 사용자 검색 요청, keyword = " + keyword);
	     
	      
	      int boardNum = 0 ;
	      if(request.getParameter("boardNum")!=null){
	    	  boardNum =Integer.parseInt(request.getParameter("boardNum"));
	      }
	      
	      if(boardNum != 0){
	    	  System.out.println("들어오냐? boardNum : "+boardNum);
	    	  return "redirect:/searchyoyo?boardNum="+boardNum;
	      }
	      
	      if(keyword.contains("#")){  //수정 - 용문 그냥 검색시 오류나서 수정
	         keyword = keyword.substring(1);
	         System.out.println("keyword: " + keyword);
	         keyword = URLEncoder.encode(keyword, "UTF-8");
	         return "redirect:/searchyoyo?hashtag="+keyword;
	      } else {
	         MemberDAO memberDAO = sqlSession.getMapper(MemberDAO.class);
	         HashMap<String, Object> hashMap = new HashMap<String, Object>();
	         if(session.getAttribute("loginUser")!=null) {
	            Member loginUser = (Member) session.getAttribute("loginUser");
	            hashMap.put("m_num1", loginUser.getM_num());
	         }      
	         hashMap.put("keyword", keyword);
	         List<SearchMemberCommand> searchList = memberDAO.searchMembers(hashMap);
	         System.out.println("======= searchList ======="); System.out.println

	(searchList);
	         model.addAttribute("searchList", searchList);
	         return "search/searchMembers";
	      }
	   }
}
