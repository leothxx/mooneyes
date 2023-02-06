package com.spring.green2209S_09.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.green2209S_09.dao.MemberDAO;
import com.spring.green2209S_09.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;

	@Override
	public MemberVO get_mooneyes_member_check(String member_mid) {
		return memberDAO.get_mooneyes_member_check(member_mid);
	}

	@Override
	public MemberVO get_mooneyes_member_emailCheck(String member_email) {
		return memberDAO.getmooneyes_member_emailCheck(member_email);
	}

	@Override
	public void set_mooneyes_member_join(MemberVO vo) {
		memberDAO.set_mooneyes_member_join(vo);
	}

	@Override
	public void set_member_visit_update(MemberVO vo) {
		memberDAO.set_member_visit_update(vo);
	}

	@Override
	public void set_kakao_Member_InputOk(MemberVO vo) {
		memberDAO.set_kakao_member_InputOk(vo);
	}

	@Override
	public MemberVO get_member_nameEmail_Check(String member_name, String member_email) {
		return memberDAO.get_member_nameEmail_Check(member_name, member_email);
	}

	@Override
	public void set_member_userDelCheck(String member_mid) {
		memberDAO.set_member_userDelCheck(member_mid);
	}

	@Override
	public int set_member_refund_update(MemberVO vo) {
		return memberDAO.set_member_refund_update(vo);
	}

	@Override
	public void set_member_update(MemberVO vo) {
		memberDAO.set_member_update(vo);
	}

	@Override
	public void set_member_pwd_update(MemberVO vo) {
		memberDAO.set_member_pwd_update(vo);
	}

	@Override
	public void set_member_email_certification(MemberVO vo) {
		memberDAO.set_member_email_certification(vo);
	}
}
