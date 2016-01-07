package edu.kosta.com.contoller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.kosta.com.dao.loginDAO;
import edu.kosta.com.dto.Member;
import edu.kosta.com.dto.My_MaybeFriend;
import edu.kosta.com.service.MaybeFriendService;

//내가 컨트롤러다!
@Controller
public class LoginController {
	
	//sqlSession은 applicationContext.xml 에서 정의하고 있다
	@Autowired(required=false)
	public SqlSession sqlSession;
	@Autowired
	private MaybeFriendService maybeFriendService;
	
	
	@RequestMapping(value="/loginCheck",method=RequestMethod.POST)
	public ModelAndView  emailAndPwdCheck(HttpServletRequest request, HttpSession session){
		//logger.info("========================loginCheck==========================");
		//request를 이용하여 jsp페이지에서 전달되어온 email(id) 와 pwd(비밀번호)를 String에 저장
		String email = request.getParameter("email");
		String pwd = request.getParameter("password");
		
		//Mybatis 연결을 위해서 sqlSession을 이용하여 메소드가 있는 loginDAO와 매핑
		loginDAO dao = sqlSession.getMapper(loginDAO.class);
		
		//member의 email(id)와 pwd(비밀번호)를 해쉬맵에 담아서 매개변수로 던져준다.
		HashMap<String, String> memberEmailAndPwd = new HashMap<String, String>();
		memberEmailAndPwd.put("email", email);
		memberEmailAndPwd.put("password", pwd);
		
		//db에서 Member를 email로 찾아서
		//만약 null 이라면 해당 아이디가 없음
		Member member = dao.emailCheck(memberEmailAndPwd);   //member는 email확인용
		
		//ModelAndView의 래퍼런스 변수 mav 생성
		//mav에 리턴할 페이지와 담고갈것이 있으면 담고간다.
		ModelAndView mav = new ModelAndView();
		
		if(member==null){
			//아이디가 없기때문에 아이디를 찾을수 없다는 페이지로 이동
			mav.setViewName("login/notFoundEmail");   //views폴더에 notFoundEmail.jsp로 이동
			//System.out.println("존재 하지 않는 이메일  =>"+email);
		} else {
			//만약 아이디가 있다면 email이 존재  비밀번호를 확인
			//email(id)와 pwd(비밀번호)를 넘겨서 member를 찾아오는지 확인
			//찾아온다면 member에 담기게 된다.
			 Member member2 = dao.pwdCheck(memberEmailAndPwd); //member2는 비밀버호 확인용
			 
			//member가 null이 아니라면 로그인 성공
			if(member2!=null){
				//로그인 성공시 session 에 필요한 정보를 담아준다.
				//member2를 통째로 담아서 로그인한사람의 모든정보를 담았따.
				session.setAttribute("loginUser", member2);
				
				//로그인 성공시 main페이지로 이동
				//mav.setViewName("main");
				//mav.addObject("member", member2);
				
				maybeFriendService.getMaybeFriendList(member2);
				
				// maybe_table
				ArrayList<My_MaybeFriend> my_maybeFriendList = maybeFriendService.getMaybeList_ScoreSort(member2);
				mav.addObject("my_maybeFriendList",my_maybeFriendList);
				
				
				mav.setViewName("redirect:/selectByM_num?m_num="+member2.getM_num());
				
				//System.out.println("로그인 성공 email=>" + email + "  비밀번호 =>" + pwd);
			} else {
				//아이디와 비밀번호가 일치하지 않기때문에 member에 아무것도 안담기게된다. 그러기때문에 비밀번호 불일치!!
				//비밀버호만 입력하면 접속가능하게 정보를 넘긴다.
				request.setAttribute("memberInfo", member);
				mav.setViewName("login/notFoundPwd");  //views 폴더밑에 
				//System.out.println("비밀번호가 틀림 :=> " + pwd);
				
			}
		}
		return mav;
	}
	
	@RequestMapping(value="/pwdCheck",method=RequestMethod.POST)
	public ModelAndView pwdCheck(HttpServletRequest request,HttpSession session){
		
		String email=request.getParameter("email");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		HashMap<String, String> memberEmailAndPwd = new HashMap<String, String>();
		memberEmailAndPwd.put("email", email);
		memberEmailAndPwd.put("password", password);
		
		loginDAO dao = sqlSession.getMapper(loginDAO.class);
		Member member=dao.pwdCheck(memberEmailAndPwd);
		
		ModelAndView mav= new ModelAndView();
		
		if(member!=null) {
			session.setAttribute("loginUser",member);
			mav.setViewName("main");
		} else {
			Member member2 = new Member();
			member2.setEmail(email); member2.setName(name);
			request.setAttribute("memberInfo", member2);
			mav.setViewName("login/notFoundPwd");
		}
		return mav;
	}
	
	
	@RequestMapping(value="/logout")
	public ModelAndView logout (HttpSession session) {
		ModelAndView mav= new ModelAndView();
		session.invalidate();
		mav.setViewName("redirect:/");
		//System.out.println( "session delete : " + session);
		return mav;
	}
}
