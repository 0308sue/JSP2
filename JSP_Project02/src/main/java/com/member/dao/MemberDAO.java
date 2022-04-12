package com.member.dao;

import java.util.ArrayList;

import com.member.dto.MemberDTO;

public interface MemberDAO {
	//�߰� 
	public void memberInsert(MemberDTO dto);
	//��������
	public ArrayList<MemberDTO> memberList();
	//����
	public void memberUpdate(MemberDTO dto);
	//����
	public void memberdelete(String userid);
	//�󼼺���
	public MemberDTO findByID(String userid);
	//���̵� �ߺ� üũ
	public String idCheck(String userid);
	//�α��� üũ
	public int loginCheck(String userid,String pwd);
	//ȸ����
	public int getCount();
}
