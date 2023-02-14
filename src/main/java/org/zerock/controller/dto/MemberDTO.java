package org.zerock.controller.dto;

import java.sql.Date;

import org.springframework.stereotype.Repository;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Repository
public class MemberDTO {
	private String id;
	private String name;
	private String pwd;
	private String email;
	private Date joindate;
}
