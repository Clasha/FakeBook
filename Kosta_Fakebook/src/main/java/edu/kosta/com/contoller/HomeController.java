package edu.kosta.com.contoller;


import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.kosta.com.dto.Member;

@Controller
public class HomeController {
	
	//private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		
		if(session.getAttribute("loginUser") != null) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			model.addAttribute("member", loginUser);
			return "redirect:/selectByM_num?m_num="+loginUser.getM_num();
		} else {
			return "index";		
		}
	}
	
	@RequestMapping("main")
	public String home(HttpSession session, Model model) {
		//logger.info("Welcome home!");
		if(session.getAttribute("loginUser") != null) {
			Member loginUser = (Member) session.getAttribute("loginUser");
			model.addAttribute("member", loginUser);
			return "redirect:/selectByM_num?m_num="+loginUser.getM_num();
		} else {
			return "index";
		}		
	}
		
}
