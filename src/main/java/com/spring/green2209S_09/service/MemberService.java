package com.spring.green2209S_09.service;

import com.spring.green2209S_09.vo.MemberVO;

public interface MemberService {

	public MemberVO get_mooneyes_member_check(String member_mid);

	public MemberVO get_mooneyes_member_emailCheck(String member_email);

	public void set_mooneyes_member_join(MemberVO vo);

	public void set_member_visit_update(MemberVO vo);

	public void set_kakao_Member_InputOk(MemberVO vo);

	public MemberVO get_member_nameEmail_Check(String member_name, String member_email);

	public void set_member_userDelCheck(String member_mid);

	public int set_member_refund_update(MemberVO vo);

	public void set_member_update(MemberVO vo);
	
	public void set_member_pwd_update(MemberVO vo);

	public void set_member_email_certification(MemberVO vo);

	
}
