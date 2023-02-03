package com.spring.green2209S_09.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.green2209S_09.vo.MemberVO;

public interface MemberDAO {

	public MemberVO get_mooneyes_member_check(@Param("member_mid") String member_mid);

	public MemberVO getmooneyes_member_emailCheck(@Param("member_email") String member_email);

	public void set_mooneyes_member_join(@Param("vo") MemberVO vo);

	public void set_member_visit_update(@Param("vo") MemberVO vo);

	public void set_kakao_member_InputOk(@Param("vo") MemberVO vo);

	public MemberVO get_member_nameEmail_Check(@Param("member_name") String member_name,@Param("member_email") String member_email);

	public void set_member_userDelCheck(@Param("member_mid") String member_mid);
	
}
