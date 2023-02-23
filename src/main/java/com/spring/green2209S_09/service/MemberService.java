package com.spring.green2209S_09.service;

import java.util.ArrayList;

import com.spring.green2209S_09.vo.AddressVO;
import com.spring.green2209S_09.vo.CartVO;
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

	public void set_member_cart(CartVO vo);

	public void set_member_address_normal_reset(MemberVO vo);

	public void set_member_address_input(int member_idx, String member_name, String postcode, String roadAddress, String detailAddress,
			String extraAddress);

	public ArrayList<AddressVO> get_mooneyes_member_address(int member_idx);

	public int set_mooneyes_member_address_input(AddressVO address_vo);

	public void set_member_address_update(int member_idx, String address);

	public int set_member_address_normal_set(int member_address_idx);

	public AddressVO get_mooneyes_address_search(int member_address_idx);

	public int get_mooneyes_address_update(AddressVO vo);

	public void set_member_point_update(int member_idx, int order_point);

	
}
