package com.spring.green2209S_09.dao;

import org.apache.ibatis.annotations.Param;

import com.spring.green2209S_09.vo.MemberVO;
import com.spring.green2209S_09.vo.OrderVO;
import com.spring.green2209S_09.vo.Payment_inputVO;

public interface OrderDAO {

	public int set_cash_order(@Param("vo") OrderVO vo,@Param("inputVO") Payment_inputVO inputVO);

	public void set_question(@Param("member_vo") MemberVO member_vo,@Param("inputVO") Payment_inputVO inputVO,@Param("title") String title);
	
}
