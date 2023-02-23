package com.spring.green2209S_09.service;

import com.spring.green2209S_09.vo.MemberVO;
import com.spring.green2209S_09.vo.OrderVO;
import com.spring.green2209S_09.vo.Payment_inputVO;

public interface OrderService {

	public int set_cash_order(OrderVO vo, Payment_inputVO inputVO);

	public void set_question(MemberVO member_vo, Payment_inputVO inputVO, String title);

	public int set_card_order(OrderVO order_vo, Payment_inputVO inputVO);
	
}
