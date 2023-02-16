package com.spring.green2209S_09.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.green2209S_09.dao.CartDAO;
import com.spring.green2209S_09.vo.CartVO;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	CartDAO cartDAO;

	@Override
	public ArrayList<CartVO> get_member_cart_list(int member_idx) {
		return cartDAO.get_member_cart_list(member_idx);
	}

	@Override
	public int get_member_cart_count(int member_idx) {
		return cartDAO.get_member_cart_count(member_idx);
	}

	@Override
	public CartVO get_cart_search(int member_cart_idx) {
		return cartDAO.get_cart_search(member_cart_idx);
	}
}
