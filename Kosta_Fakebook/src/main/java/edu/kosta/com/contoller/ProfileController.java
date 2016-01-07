package edu.kosta.com.contoller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.kosta.com.dao.MemberDAO;
import edu.kosta.com.dto.Member;
import edu.kosta.com.dto.My_FriendListCommand;
import edu.kosta.com.dto.ReplyNoti;
import edu.kosta.com.service.FriendService;
import edu.kosta.com.service.MemberService;
import edu.kosta.com.service.ReplyService;

@Controller
public class ProfileController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private FriendService friendService;
	@Autowired
	private ReplyService replyService;
	@RequestMapping(value="profilePage")
	public ModelAndView profilePage(HttpServletRequest request,HttpServletResponse response){
		
		HttpSession session = request.getSession();
		Member member =(Member) session.getAttribute("loginUser");
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("email", member.getEmail());

		Member jobList = memberService.memberJobList(hashmap);
		System.out.println(jobList.toString());
		ModelAndView mav = new ModelAndView();
		
		ArrayList<My_FriendListCommand> friendList=friendService.getFriendList(member);
		mav.addObject("friendList",friendList);
		session.setAttribute("friendList",friendList);
		
		mav.addObject("jobList",jobList);
		List<ReplyNoti> noti_list = replyService.selectreplynoti(member, request);
		mav.addObject("noti_List", noti_list);//추가
		mav.setViewName("mypage/myPageMain");
		return mav;
	}
	
	@RequestMapping(value="saveJobProfile",method=RequestMethod.POST)
	public void saveJobProfile(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
	    
		HttpSession session = request.getSession();
		//�������մ� ����� ����  session ���� ��������
		Member member  = (Member) session.getAttribute("loginUser");
		System.out.println("�α����� ����� : "+member.getEmail());
		
		String job = request.getParameter("job");
	    String position = request.getParameter("jobPosition");
	    String addr  =request.getParameter("addr");
	    String desc = request.getParameter("desc");
	    System.out.println("���� �� ���� : "+job);
	    System.out.println("���� �� ��å : "+position);
	    System.out.println("������ ���� ��ġ : "+addr);
	    System.out.println("������ ���� ���� : "+desc);
	    
	    try{
	    	
	    	HashMap<String, String> hashmap = new HashMap<String, String>();
	    	hashmap.put("job", job);
	    	hashmap.put("position", position);
	    	hashmap.put("email", member.getEmail());
	    	hashmap.put("addr", addr);
	    	hashmap.put("job_desc", desc);
	    	memberService.memberJobInsert(hashmap);
	        String str="YES";
	        response.getWriter().print(str);
	      }catch(Exception e){
	         System.out.println(e+"=> �ߺ�üũ ����");
	         
	         
	         e.printStackTrace();
	      }
	}
	
	@RequestMapping(value="delJobProfile",method=RequestMethod.POST)
	public void delJobProfile(HttpServletRequest request,HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		//�������մ� ����� ����  session ���� ��������
		Member member  = (Member) session.getAttribute("loginUser");
    	
	    HashMap<String, String> hashmap = new HashMap<String, String>();
    	hashmap.put("email", member.getEmail());
    	memberService.memberJobDelete(hashmap);
    	String str="YES";
	    response.getWriter().print(str);
	}
	
	

	@RequestMapping(value="schoolInfoSave",method=RequestMethod.POST)
	public void schoolInfoSave(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
	    
		HttpSession session = request.getSession();
		//�������մ� ����� ����  session ���� ��������
		Member member  = (Member) session.getAttribute("loginUser");
		System.out.println("�α����� ����� : "+member.getEmail());
		
		String school = request.getParameter("school");
	    String school_into = request.getParameter("school_into_year_Input");
	    String school_out  =request.getParameter("school_out_year_Input");
	    String school_desc = request.getParameter("school_desc");
	    System.out.println("���� �� �б� : "+school);
	    System.out.println("���� �� ������ : "+school_into);
	    System.out.println("������ ������ : "+school_out);
	    System.out.println("������ �б� ���� : "+school_desc);
	    System.out.println("email : "+member.getEmail());
	    
	    
	    try{
	    	
	    	HashMap<String, String> hashmap = new HashMap<String, String>();
	    	hashmap.put("school", school);
	    	hashmap.put("school_into", school_into);
	    	hashmap.put("email", member.getEmail());
	    	hashmap.put("school_out", school_out);
	    	hashmap.put("school_desc", school_desc);
	    	
	    	memberService.memberSchoolInsert(hashmap);
	        String str="YES";
	        response.getWriter().print(str);
	      }catch(Exception e){
	         System.out.println(e+"=> �ߺ�üũ ����");
	         
	         
	         e.printStackTrace();
	      }
	}
	
	@RequestMapping(value="delSchoolProfile",method=RequestMethod.POST)
	public void delSchoolProfile(HttpServletRequest reqeust,HttpServletResponse response) throws IOException{
		HttpSession session = reqeust.getSession();
		//�������մ� ����� ����  session ���� ��������
		Member member  = (Member) session.getAttribute("loginUser");
    	System.out.println("�������� ���� �̸�����?"+member.getEmail());
	    HashMap<String, String> hashmap = new HashMap<String, String>();
    	hashmap.put("email", member.getEmail());
    	memberService.memberSchoolDelete(hashmap);
    	String str="YES";
    	response.getWriter().print(str);
	}
	
	
	@RequestMapping(value="highschoolInfoSave",method=RequestMethod.POST)
	public void highschoolInfoSave(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		//�������մ� ����� ����  session ���� ��������
		Member member  = (Member) session.getAttribute("loginUser");
		System.out.println("�α����� ����� : "+member.getEmail());
		String highschool = request.getParameter("highschool");
		String highschool_into_year_Input= request.getParameter("highschool_into_year_Input");
		String highschool_out_year_Input= request.getParameter("highschool_out_year_Input");
		String highschool_desc= request.getParameter("highschool_desc");
		String highschoolmajor= request.getParameter("highschoolmajor");
	    System.out.println("���� �� �б� : "+highschool);
	    System.out.println("���� �� ���г⵵ : "+highschool_into_year_Input);
	    System.out.println("������ �����⵵ : "+highschool_out_year_Input);
	    System.out.println("������ ���� : "+highschool_desc);
	    System.out.println("������ �� : "+highschoolmajor);
	    
	    try{
	    	
	    	HashMap<String, String> hashmap = new HashMap<String, String>();
	    	hashmap.put("highschool", highschool);
	    	hashmap.put("highschool_into", highschool_into_year_Input);
	    	hashmap.put("highschool_out", highschool_out_year_Input);
	    	hashmap.put("email", member.getEmail());
	    	hashmap.put("highschool_desc", highschool_desc);
	    	hashmap.put("highschoolmajor", highschoolmajor);
	    	memberService.memberHighSchoolSave(hashmap);
	        String str="YES";
	        response.getWriter().print(str);
	      }catch(Exception e){
	         System.out.println(e+"=> �ߺ�üũ ����");
	         e.printStackTrace();
	      }
	}
	
	@RequestMapping(value="delhighSchoolProfile",method=RequestMethod.POST)
	public void delhighSchoolProfile(HttpServletRequest reqeust,HttpServletResponse response) throws IOException{
		HttpSession session = reqeust.getSession();
		//�������մ� ����� ����  session ���� ��������
		Member member  = (Member) session.getAttribute("loginUser");
    	System.out.println("���н������� ���� �̸�����?"+member.getEmail());
	    HashMap<String, String> hashmap = new HashMap<String, String>();
    	hashmap.put("email", member.getEmail());
    	memberService.memberHighSchoolDelete(hashmap);
    	String str="YES";
    	response.getWriter().print(str);
	}
	
	
	@RequestMapping(value="bornInfoSave",method=RequestMethod.POST)
	public void bornInfoSave(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		//�������մ� ����� ����  session ���� ��������
		Member member  = (Member) session.getAttribute("loginUser");
		System.out.println("�α����� ����� : "+member.getEmail());
		String sample3_address= request.getParameter("sample3_address");
	    System.out.println("������ ������ : "+sample3_address);
	    try{
	    	HashMap<String, String> hashmap = new HashMap<String, String>();
	    	hashmap.put("email", member.getEmail());
	    	hashmap.put("born", sample3_address);
	    	memberService.memberBornSave(hashmap);
	        String str="YES";
	        response.getWriter().print(str);
	      }catch(Exception e){
	         System.out.println(e+"=> �ߺ�üũ ����");
	         e.printStackTrace();
	      }
	}
	

	@RequestMapping(value="delBornProfile",method=RequestMethod.POST)
	public void delBornProfile(HttpServletRequest reqeust,HttpServletResponse response) throws IOException{
		HttpSession session = reqeust.getSession();
		//�������մ� ����� ����  session ���� ��������
		Member member  = (Member) session.getAttribute("loginUser");
    	System.out.println("���н������� ���� �̸�����?"+member.getEmail());
	    HashMap<String, String> hashmap = new HashMap<String, String>();
    	hashmap.put("email", member.getEmail());
    	memberService.memberBornDelete(hashmap);
    	String str="YES";
    	response.getWriter().print(str);
	}
	
	
	//����б� �ڵ�ȭ �ϼ� �޽���
	@RequestMapping(value="autocompleteschool",method=RequestMethod.POST)
	public void autocompleteschool(HttpServletRequest request,HttpServletResponse response) throws JSONException, IOException{
		request.setCharacterEncoding("UTF-8");
	    String value = request.getParameter("value");
	   
	    JSONArray arrayObj=new JSONArray();
	    JSONObject jsonObj = null;
	    
	    ArrayList<String> resultlist=memberService.getSchoolList(value);
	   //���� �� json�Ľ�
	    for(String str : resultlist) {
	       	jsonObj = new JSONObject();
	       	jsonObj.put("data", 	URLEncoder.encode(str , "UTF-8"));
	        arrayObj.put(jsonObj);
	    }
	    
	   
	         
	    PrintWriter pw = response.getWriter();
	    pw.print(arrayObj);
	    pw.flush();
	    pw.close();
	}
	
	//���б� �ڵ�ȭ �ϼ� �޼ҵ�
	@RequestMapping(value="autocompletehighschool",method=RequestMethod.POST)
	public void autocompletehighschool(HttpServletRequest request,HttpServletResponse response) throws JSONException, IOException{
		request.setCharacterEncoding("UTF-8");
	    String value = request.getParameter("value");
	   
	    JSONArray arrayObj=new JSONArray();
	    JSONObject jsonObj = null;
	    
	    ArrayList<String> resultlist=memberService.getHighSchoolList(value);
	  
	   //���� �� json�Ľ�
	    for(String str : resultlist) {
	       	jsonObj = new JSONObject();
	       	jsonObj.put("data", 	URLEncoder.encode(str , "UTF-8"));
	        arrayObj.put(jsonObj);
	    }
	    
	   
	         
	    PrintWriter pw = response.getWriter();
	    pw.print(arrayObj);
	    pw.flush();
	    pw.close();
	}
	
	//���� ���� �ڵ�ȭ �ϼ� �޼ҵ�
	@RequestMapping(value="autocompletehighschoolmajor",method=RequestMethod.POST)
	public void autocompletehighschoolmajor(HttpServletRequest request,HttpServletResponse response) throws JSONException, IOException{
		request.setCharacterEncoding("UTF-8");
	    String value = request.getParameter("value");
	   
	    JSONArray arrayObj=new JSONArray();
	    JSONObject jsonObj = null;
	    
	    ArrayList<String> resultlist=memberService.getHighSchoolMajorList(value);
	  
	   //���� �� json�Ľ�
	    for(String str : resultlist) {
	       	jsonObj = new JSONObject();
	       	jsonObj.put("data", 	URLEncoder.encode(str , "UTF-8"));
	        arrayObj.put(jsonObj);
	    }
	    PrintWriter pw = response.getWriter();
	    pw.print(arrayObj);
	    pw.flush();
	    pw.close();
	}
	
	//���� �ڵ�ȭ �ϼ� �޼ҵ�
	@RequestMapping(value="autocomplete",method=RequestMethod.POST)
	public void autoComplete(HttpServletRequest request,HttpServletResponse response) throws JSONException, IOException{
		request.setCharacterEncoding("UTF-8");
	    String value = request.getParameter("value");
	   
	    JSONArray arrayObj=new JSONArray();
	    JSONObject jsonObj = null;
	    
	    
	    ArrayList<String> resultlist = new ArrayList<String>();
	   
		
	    HashMap<String, String> hashMap = new HashMap<String, String>();
	    System.out.println("vlaue=>"+value);
	    hashMap.put("job", value);
	    MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
	    resultlist = dao.jobListAjax(hashMap);
	    
	   //���� �� json�Ľ�
	    for(String str : resultlist) {
	       	jsonObj = new JSONObject();
	       	jsonObj.put("data", 	URLEncoder.encode(str , "UTF-8"));
	        arrayObj.put(jsonObj);
	    }
	    PrintWriter pw = response.getWriter();
	    pw.print(arrayObj);
	    pw.flush();
	    pw.close();
	}
}
