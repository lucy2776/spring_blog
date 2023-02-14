package org.zerock.controller.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.controller.dao.MemberDAO;
import org.zerock.controller.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO dao;

	@Override
	public List<MemberDTO> list() {
		return dao.list();
	}
	
	@Override
	public void insert(MemberDTO dto) {
		dao.insert(dto);
	}

	@Override
	public MemberDTO detail(String id) {
		return dao.detail(id);
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
	}

	@Override
	public void update(MemberDTO dto) {
		dao.update(dto);
	}

	@Override
	public boolean check_pwd(String id, String pwd) {
		return dao.check_pwd(id, pwd);
	}

	@Override
	public List<MemberDTO> loginCheck(String id, String pwd) {
		return dao.loginCheck(id, pwd);
	}

	@Override
	public void logout(HttpSession session) {
		session.removeAttribute("id");
		session.removeAttribute("name");

		System.out.println("로그아웃 했을 경우 id값 : " + session.getAttribute("id"));
		System.out.println("로그아웃 했을 경우 name값 : " + session.getAttribute("name"));
	}

}
