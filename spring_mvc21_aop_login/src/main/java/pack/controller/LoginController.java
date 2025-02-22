package pack.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pack.model.SawonDto;
import pack.model.SawonInter;

@Controller
public class LoginController {
	@Autowired
	@Qualifier("sawonImpl")
	private SawonInter inter;
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String goLogin(){
		return "login";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String submitLogin(HttpSession session, @RequestParam("no") String no, @RequestParam("name") String name){
		SawonDto dto = inter.getLoginInfo(no);
		
		if(dto != null){
			String reName = dto.getSawon_name();			
			if(reName.equals(name)){
				session.setAttribute("name", reName);
			}
		}
		return "redirect:/sawon";
	}
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String goLogout(HttpSession session){
		session.setAttribute("name", null);
		return "redirect:index.jsp";
	}
	
}
























