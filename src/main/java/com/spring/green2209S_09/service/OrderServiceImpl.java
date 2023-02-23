package com.spring.green2209S_09.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.green2209S_09.dao.OrderDAO;
import com.spring.green2209S_09.vo.MemberVO;
import com.spring.green2209S_09.vo.OrderVO;
import com.spring.green2209S_09.vo.Payment_inputVO;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	OrderDAO orderDAO;

	@Override
	public int set_cash_order(OrderVO vo, Payment_inputVO inputVO) {
		return orderDAO.set_cash_order(vo, inputVO);
	}

	@Override
	public void set_question(MemberVO member_vo, Payment_inputVO inputVO, String title) {
		orderDAO.set_question(member_vo,inputVO,title);
	}

	@Override
	public int set_card_order(OrderVO order_vo, Payment_inputVO inputVO) {
		return orderDAO.set_card_order(order_vo, inputVO);
	}
}
