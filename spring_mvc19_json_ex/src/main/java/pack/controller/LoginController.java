package pack.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ServerProperties.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.model.DaoInter;

@Controller
public class LoginController {
	@Autowired
	private DaoInter inter;
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login(){
		return "/login";
	}
	
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public ModelAndView loginProcess(@RequestParam("sawon_no")String sawon_no, @RequestParam("sawon_name")String sawon_name, HttpSession session){
		ModelAndView modelAndView = new ModelAndView();
		Map<String, String> map = new HashMap();
		map.put("sawon_no", sawon_no);
		map.put("sawon_name", sawon_name);
		
		int count = inter.login(map);
		
		if(count > 0){
			session.setAttribute("sawon_name", sawon_name);
			modelAndView.setViewName("redirect:index.jsp");
		}else{
			modelAndView.addObject("log", "아이디 및 비밀번호를 다시 확인해주세요.");
			modelAndView.setViewName("login");
		}
		return modelAndView;
	}
	
	// 로그아웃
    @RequestMapping("logout")
    public String logout(HttpSession session) {
        session.removeAttribute("sawon_name");
        return "redirect:index.jsp";
    }
}
