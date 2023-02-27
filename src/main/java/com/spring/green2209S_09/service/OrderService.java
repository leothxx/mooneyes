package com.spring.green2209S_09.service;

import java.util.ArrayList;

import com.spring.green2209S_09.vo.MemberVO;
import com.spring.green2209S_09.vo.OrderVO;
import com.spring.green2209S_09.vo.Payment_inputVO;

public interface OrderService {

	public int set_cash_order(OrderVO vo, Payment_inputVO inputVO);

	public void set_question(MemberVO member_vo, Payment_inputVO inputVO, String title);

	public int set_card_order(OrderVO order_vo, Payment_inputVO inputVO);

	public ArrayList<OrderVO> get_mooneyes_order_list(int startIndexNo, int pageSize, int member_idx, String payment);

	public OrderVO get_mooneyes_order_image_list(int member_idx, String product_idx, String order_idx);

	public int get_mooneyes_order_count_N(int member_idx);

	public int get_mooneyes_order_count_Y(int member_idx);

	public int get_mooneyes_order_count_D(int member_idx);
	
	public int get_mooneyes_order_count_O(int member_idx);
	
	public int get_mooneyes_order_count_C(int member_idx);
	
	public int get_mooneyes_order_count_E(int member_idx);
	
	public int get_mooneyes_order_count_R(int member_idx);

	public OrderVO get_mooneyes_order(int order_idx);
	
}
