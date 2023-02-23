package com.spring.green2209S_09.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.green2209S_09.vo.AddressVO;
import com.spring.green2209S_09.vo.CartVO;
import com.spring.green2209S_09.vo.MemberVO;

public interface MemberDAO {

	public MemberVO get_mooneyes_member_check(@Param("member_mid") String member_mid);

	public MemberVO getmooneyes_member_emailCheck(@Param("member_email") String member_email);

	public void set_mooneyes_member_join(@Param("vo") MemberVO vo);

	public void set_member_visit_update(@Param("vo") MemberVO vo);

	public void set_kakao_member_InputOk(@Param("vo") MemberVO vo);

	public MemberVO get_member_nameEmail_Check(@Param("member_name") String member_name,@Param("member_email") String member_email);

	public void set_member_userDelCheck(@Param("member_mid") String member_mid);

	public int set_member_refund_update(@Param("vo") MemberVO vo);

	public void set_member_update(@Param("vo") MemberVO vo);
	
	public void set_member_pwd_update(@Param("vo") MemberVO vo);

	public void set_member_email_certification(@Param("vo") MemberVO vo);

	public void set_member_cart(@Param("vo") CartVO vo);

	public void set_member_address_input(@Param("member_idx") int member_idx, @Param("member_name") String member_name, @Param("postcode") String postcode,@Param("roadAddress") String roadAddress,@Param("detailAddress") String detailAddress,
			@Param("extraAddress") String extraAddress);

	public void set_member_address_normal_reset(@Param("vo") MemberVO vo);

	public ArrayList<AddressVO> get_mooneyes_member_address(@Param("member_idx") int member_idx);

	public int set_mooneyes_member_address_input(@Param("vo") AddressVO address_vo);

	public void set_member_address_update(@Param("member_idx") int member_idx, @Param("address") String address);

	public int set_member_address_normal_set(@Param("member_address_idx") int member_address_idx);

	public AddressVO get_mooneyes_address_search(@Param("member_address_idx") int member_address_idx);

	public int get_mooneyes_address_update(@Param("vo") AddressVO vo);

	public void set_member_point_update(@Param("member_idx") int member_idx,@Param("order_point") int order_point);

}
