package org.zerock.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.controller.dto.MemberDTO;
import org.zerock.controller.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@Log4j
public class MemberController {

	@Autowired
	MemberService service;
	
	
	@RequestMapping("/list.do")
	public String list(HttpServletRequest request, Model model) {
		List<MemberDTO> list = service.list();
		model.addAttribute("items", list);

		HttpSession session = request.getSession();
		System.out.println("세션값확인 : " + session.getAttribute("list"));
		
		return "member/list";
	}
	
	@RequestMapping("/sign.up")
	public String signUp() {
		
		return "member/insert";
	}
	
	// ajax
	@PostMapping(value = "/insert.do")
	public ResponseEntity<String> insert(@RequestBody HashMap<String, String> map) {
		HttpHeaders header = new HttpHeaders();
		header.add("Content-Type", "application/json; charset=UTF-8");
		
		MemberDTO dto = new MemberDTO();

		dto.setId(map.get("id"));
		dto.setName(map.get("name"));
		dto.setPwd(map.get("pwd"));
		dto.setEmail(map.get("email"));

		System.out.println(dto);
		
		service.insert(dto);
	
		return new ResponseEntity<String>("가입완료", header, HttpStatus.OK);
//		return "forward:/member/list.do";
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam String id, Model model) {
		model.addAttribute("dto", service.detail(id));
		
		return "member/detail";
	}
	
	@PostMapping(value = "/update.do")
	public String update(@ModelAttribute @Param("dto") MemberDTO dto, Model model) {
		service.update(dto);
		System.out.println(dto);
		
		boolean rs = service.check_pwd(dto.getId(), dto.getPwd());
		
		if (rs) {
			service.update(dto);
			
			return "forward:/member/list.do";
		}else {
			MemberDTO dto1 = service.detail(dto.getId());
			
			dto.setJoindate(dto1.getJoindate());
			model.addAttribute("dto",dto1);
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			
			return "forward:/member/detail.do";
		}
	}
	
	@GetMapping(value = "/delete.do")
	public String delete(@RequestParam String id, String pwd, Model model) {
		service.delete(id);
		
		return "forward:/member/list.do";

//		boolean rs = service.check_pwd(id, pwd);
//		
//		if(rs) {
//			service.delete(id);
//			
//			return "forward:/member/list.do";
//		}
//		else {
//			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
//			model.addAttribute("dto", service.detail(id));
//			
//			return "forward:/member/detail";
//		}
	}
	
	@RequestMapping("/sign.in")
	public String signIn() {
		
		return "member/login";
	}
	
	@ResponseBody
	@RequestMapping("login.do")
	public List<MemberDTO> loginCheck(@RequestBody HashMap<String, String> dto,
										HttpServletRequest request) {
		String id = dto.get("id");
		String pwd = dto.get("pwd");
		
		System.out.println(id);
		System.out.println(pwd);
		
		List<MemberDTO> list = service.loginCheck(id, pwd);
		System.out.println(list);
		
		if(!(list.isEmpty())) {
			HttpSession session = request.getSession();
			session.setAttribute("list", list);
			session.setMaxInactiveInterval(3600);
			System.out.println("세션완료");
		}
		return list;
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "forward:/member/list.do";
	}
	
	
}
