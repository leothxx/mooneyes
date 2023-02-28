package com.spring.green2209S_09.service;

import java.util.ArrayList;

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

	@Override
	public ArrayList<OrderVO> get_mooneyes_order_list(int startIndexNo, int pageSize, int member_idx, String payment) {
		return orderDAO.get_mooneyes_order_list(startIndexNo, pageSize, member_idx, payment);
	}

	@Override
	public OrderVO get_mooneyes_order_image_list(int member_idx, String product_idx, String order_idx) {
		return orderDAO.get_mooneyes_order_image_list(member_idx, product_idx, order_idx);
	}

	@Override
	public int get_mooneyes_order_count_N(int member_idx) {
		return orderDAO.get_mooneyes_order_count_N(member_idx);
	}

	@Override
	public int get_mooneyes_order_count_Y(int member_idx) {
		return orderDAO.get_mooneyes_order_count_Y(member_idx);
	}

	@Override
	public int get_mooneyes_order_count_D(int member_idx) {
		return orderDAO.get_mooneyes_order_count_D(member_idx);
	}

	@Override
	public int get_mooneyes_order_count_O(int member_idx) {
		return orderDAO.get_mooneyes_order_count_O(member_idx);
	}

	@Override
	public int get_mooneyes_order_count_C(int member_idx) {
		return orderDAO.get_mooneyes_order_count_C(member_idx);
	}

	@Override
	public int get_mooneyes_order_count_E(int member_idx) {
		return orderDAO.get_mooneyes_order_count_E(member_idx);
	}

	@Override
	public int get_mooneyes_order_count_R(int member_idx) {
		return orderDAO.get_mooneyes_order_count_R(member_idx);
	}

	@Override
	public OrderVO get_mooneyes_order(int order_idx) {
		return orderDAO.get_mooneyes_order(order_idx);
	}

	@Override
	public int set_mooneyes_order_cancel(int order_idx) {
		return orderDAO.get_mooneyes_order_cancel(order_idx);
	}
}
