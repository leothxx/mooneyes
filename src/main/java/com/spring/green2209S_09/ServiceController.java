package com.spring.green2209S_09;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.green2209S_09.service.MemberService;
import com.spring.green2209S_09.service.ProductService;
import com.spring.green2209S_09.service.ServiceService;
import com.spring.green2209S_09.vo.MemberVO;
import com.spring.green2209S_09.vo.ServiceVO;
import com.spring.green2209S_09.vo.Service_answerVO;

@Controller
@RequestMapping("/service")
public class ServiceController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ServiceService serviceService;
	
	// 고객센터 
	@RequestMapping(value="/service",method=RequestMethod.GET)
	public String mainGet(HttpSession session, Model model) {
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO member_vo = memberService.get_mooneyes_member_check(mid);
		ArrayList<ServiceVO> vos = serviceService.get_mooneyes_service_search(member_vo.getMember_idx());
		model.addAttribute("vos", vos);
		model.addAttribute("member_idx",member_vo.getMember_idx());
		return "service/mooneyes_service";
	}
	
	// 고객센터 문의 작성 폼
	@RequestMapping(value="/service_input",method=RequestMethod.GET)
	public String service_inputGet(HttpSession session, Model model) {
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO vo = memberService.get_mooneyes_member_check(mid);
		model.addAttribute("vo",vo);
		return "service/mooneyes_service_input";
	}
	
	// 고객센터 문의 작성 저장 처리
	@RequestMapping(value="/service_input",method=RequestMethod.POST)
	public String service_inputPost(HttpSession session, Model model, ServiceVO vo) {
		String mid = session.getAttribute("sMid") == null ? "" : (String) session.getAttribute("sMid");
		MemberVO member_vo = memberService.get_mooneyes_member_check(mid);
		
		int res = 0;
		// 고객센터 문의내용 저장 처리
		res = serviceService.set_mooneyes_service_input(vo);
		
		if(res == 1) return "redirect:/msg/service_input_ok";
		return "redirect:/msg/service_input_no";
	}
	
	// 고객센터 문의글 상세보기
	@RequestMapping(value="/service_view", method=RequestMethod.GET)
	public String service_viewGet(Model model, int service_idx) {
		ServiceVO vo = serviceService.get_mooneyes_service_view(service_idx);
		model.addAttribute("vo", vo);
		ArrayList<Service_answerVO> vos = serviceService.get_mooneyes_service_answer(service_idx);
		model.addAttribute("vos",vos);
		return "service/mooneyes_service_view";
	}
	
	// 고객센터 문의글 수정 폼
	@RequestMapping(value="/service_update", method=RequestMethod.GET)
	public String service_updateGet(Model model, int service_idx) {
		ServiceVO vo = serviceService.get_mooneyes_service_view(service_idx);
		model.addAttribute("vo", vo);
		return "service/mooneyes_service_update";
	}
	
	// 고객센터 문의글 수정 처리
	@RequestMapping(value="/service_update", method=RequestMethod.POST)
	public String service_updatePost(HttpSession session, Model model, ServiceVO vo) {
		if(vo.getService_answer_sw() == null || vo.getService_answer_sw().equals("")) {
			vo.setService_answer_sw("N");
		}
		int res = 0;
		res = serviceService.set_mooneyes_service_update(vo);
		if(res == 1) return "redirect:/msg/service_update_ok";
		return "redirect:/msg/service_update_no";
	}
	
	// 고객센터 문의글 삭제 처리
	@RequestMapping(value="/service_delete", method=RequestMethod.GET)
	public String service_deleteGet(Model model, int service_idx) {
		int res = 0;
		res = serviceService.get_mooneyes_service_delete(service_idx);
		if(res == 1) return "redirect:/msg/service_delete_ok";
		return "redirect:/msg/service_delete_no?mid="+service_idx;
	}
	
	// 고객센터 문의글 답변 등록 처리
	@RequestMapping(value="/service_answer_input", method=RequestMethod.POST)
	public String service_answer_inputPost(Model model, Service_answerVO vo) {
		int res = 0;
		res = serviceService.set_mooneyes_service_answer_input(vo);
		if(res == 1) return "redirect:/msg/service_answer_input_ok";
		return "redirect:/msg/service_answer_input_no?mid="+vo.getService_idx();
	}
	
	
	
}
