package com.member.dao;

import java.util.ArrayList;

import com.member.dto.MemberDTO;

public interface MemberDAO {
	//추가 
	public void memberInsert(MemberDTO dto);
	//전제보기
	public ArrayList<MemberDTO> memberList();
	//수정
	public void memberUpdate(MemberDTO dto);
	//삭제
	public void memberdelete(String userid);
	//상세보기
	public MemberDTO findByID(String userid);
	//아이디 중복 체크
	public String idCheck(String userid);
	//로그인 체크
	public int loginCheck(String userid,String pwd);
	//회원수
	public int getCount();
}
