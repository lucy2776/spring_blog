package org.zerock.controller.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.zerock.controller.dto.MemberDTO;

public interface MemberService {
	
	public List<MemberDTO> list();
	public void insert(MemberDTO dto);
	public MemberDTO detail(String id);
	public void delete(String id);
	public void update(MemberDTO dto);
	public boolean check_pwd(String id, String pwd);
	
	public List<MemberDTO> loginCheck(String id, String pwd);
	public void logout(HttpSession session);
}
