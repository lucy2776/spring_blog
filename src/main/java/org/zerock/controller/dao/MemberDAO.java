package org.zerock.controller.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.zerock.controller.dto.MemberDTO;

@Service
public interface MemberDAO {

	public List<MemberDTO> list();
	public void insert(MemberDTO dto);
	public MemberDTO detail(String id);
	public void delete(String id);
//	public void update(MemberDTO dto);
	public void update(@Param("dto") MemberDTO dto);
	public boolean check_pwd(String id, String pwd);
	
	public List<MemberDTO> loginCheck(@Param("id") String id, @Param("pwd") String pwd);
	public void logout(HttpSession session);
}
