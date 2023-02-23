package com.spring.green2209S_09.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.green2209S_09.dao.MemberDAO;
import com.spring.green2209S_09.vo.AddressVO;
import com.spring.green2209S_09.vo.CartVO;
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

	@Override
	public void set_member_cart(CartVO vo) {
		memberDAO.set_member_cart(vo);
	}

	@Override
	public void set_member_address_input(int member_idx, String member_name, String postcode, String roadAddress, String detailAddress,
			String extraAddress) {
		memberDAO.set_member_address_input(member_idx, member_name, postcode, roadAddress, detailAddress, extraAddress);
	}

	@Override
	public void set_member_address_normal_reset(MemberVO vo) {
		memberDAO.set_member_address_normal_reset(vo);
	}

	@Override
	public ArrayList<AddressVO> get_mooneyes_member_address(int member_idx) {
		return memberDAO.get_mooneyes_member_address(member_idx);
	}

	@Override
	public int set_mooneyes_member_address_input(AddressVO address_vo) {
		return memberDAO.set_mooneyes_member_address_input(address_vo);
	}

	@Override
	public void set_member_address_update(int member_idx, String address) {
		memberDAO.set_member_address_update(member_idx, address);
	}

	@Override
	public int set_member_address_normal_set(int member_address_idx) {
		return memberDAO.set_member_address_normal_set(member_address_idx);
	}

	@Override
	public AddressVO get_mooneyes_address_search(int member_address_idx) {
		return memberDAO.get_mooneyes_address_search(member_address_idx);
	}

	@Override
	public int get_mooneyes_address_update(AddressVO vo) {
		return memberDAO.get_mooneyes_address_update(vo);
	}

	@Override
	public void set_member_point_update(int member_idx, int order_point) {
		memberDAO.set_member_point_update(member_idx, order_point);
	}
}
