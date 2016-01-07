package edu.kosta.com.contoller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import edu.kosta.com.dto.Notice;
import edu.kosta.com.service.NoticeService;

@Controller
public class NoticeController {
	@Resource
	private NoticeService noticeService;
	
	@RequestMapping("/notice_writeform")
	public String writeform(){
		return"/notice/writeform";
	}
	
	@RequestMapping("/notice_write")
	public String write(MultipartHttpServletRequest request){
		Map<Object,Object> map = new HashMap();
		map.put("notice_title", request.getParameter("title"));
		map.put("notice_contents", request.getParameter("content"));
		map.put("notice_image", request.getParameter("image"));
		
		noticeService.insertNotice(map);
		return "redirect:/notice_list";
	}
	
	@RequestMapping("/notice_list")
	public String list(HttpServletRequest request){
		int pg=1;
		String strPg = request.getParameter("pg"); 
		if(strPg!=null){
			pg = Integer.parseInt(strPg);			
		}
		int rowSize = 5;
		int start = (pg*rowSize)-(rowSize -1);
		int end = pg*rowSize;
		
		int total = noticeService.getNoticeCount(); 
		System.out.println("��ŸƮ : "+start +" ����:"+end);
		System.out.println("��Ż : "+total);
		
		int allPage = (int) Math.ceil(total/(double)rowSize); 
		//int totalPage = total/rowSize + (total%rowSize==0?0:1);
		System.out.println("ALL������: "+ allPage);
		
		int block = 10; //<< [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
		int fromPage = ((pg-1)/block*block)+1;  
		//((1-1)/10*10)
		int toPage = ((pg-1)/block*block)+block; 
		if(toPage> allPage){
			toPage = allPage;
		}
		
		HashMap map = new HashMap();
		
		map.put("start", start);
		map.put("end", end);
		List<Notice> list = noticeService.getNoticeList(map);
		
		request.setAttribute("list", list);
		request.setAttribute("pg",pg);
		request.setAttribute("allPage",allPage);
		request.setAttribute("block",block);
		request.setAttribute("fromPage",fromPage);
		request.setAttribute("toPage",toPage);	
		
		return "/notice/list"; //list.jsp
	}
	
	@RequestMapping("/notice_view")
	public String read(int num, int pg, Model model){
		noticeService.updateHit(num);
		Notice dto = noticeService.getNotice(num);
		System.out.println(dto);
		model.addAttribute("b", dto);
		model.addAttribute("pg", pg);
		return "/notice/view";
	}

	  @RequestMapping("/notice_updateform")
	   public ModelAndView updateform(int num,int pg){
	      System.out.println(num);
	      ModelAndView mav = new ModelAndView();
	      Notice dto = noticeService.getNotice(num);
	      mav.addObject("b", dto);
	      mav.addObject("pg", pg);
	      
	      mav.setViewName("notice/updateform");
	      return mav;
	   }
	   
	   @RequestMapping("/notice_update")
	   public ModelAndView update(Notice dto, int pg){
	      ModelAndView mav = new ModelAndView();
	      noticeService.updateNotice(dto);
	      mav.setViewName("redirect:/notice_list");
	      //notice/list?pg="+pg
	      return mav;
	   }
	
	@RequestMapping("/notice_delete")
	public String delete(int num,int pg){
		noticeService.deleteNotice(num);
		
		String res = "redirect:/notice_list?pg="+pg;
		return res;
	}
	
}