package pack.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import pack.model.MemberDto;
import pack.model.MemberInter;

@Controller
public class RestfulMemberController {
	@Autowired
	private MemberInter inter;
	
	//select = get / insert = post / update = put / delete = delete
	
	//전체데이터
	@RequestMapping(value="member", method=RequestMethod.GET)
	public ModelAndView list(){
		List<MemberDto> list = inter.getList();
		
		ModelAndView view = new ModelAndView();
		view.addObject("list", list);
		view.setViewName("list");
		return view;
	}
	
	//등록
	@RequestMapping(value="member", method=RequestMethod.POST)
	public String insert(@ModelAttribute MemberDto dto){
		inter.insert(dto);
		return "redirect:/member";
	}
	
	//수정을 위한 자료 읽기
	@RequestMapping(value="member/{no}", method=RequestMethod.GET)
	public ModelAndView getData(@PathVariable(value="no") String no){
		MemberDto dto = inter.getData(no);

		ModelAndView view = new ModelAndView();
		view.addObject("dto", dto);
		view.setViewName("updateform");
		return view;
	}
	
	//수정
	@RequestMapping(value="member/{no}", method=RequestMethod.PUT)
	public String update(@PathVariable(value="no") String no, @ModelAttribute MemberDto dto){
		dto.setNo(no);
		inter.update(dto);
		return "redirect:/member";
	}
	
	//삭제
	@RequestMapping(value="member/{no}", method=RequestMethod.DELETE)
	public String update(@PathVariable(value="no") String no){
		inter.delete(no);
		return "redirect:/member";
	}
		
	
}
































