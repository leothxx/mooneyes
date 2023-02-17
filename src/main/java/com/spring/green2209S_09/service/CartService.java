package com.spring.green2209S_09.service;

import java.util.ArrayList;

import com.spring.green2209S_09.vo.CartVO;

public interface CartService {

	public ArrayList<CartVO> get_member_cart_list(int member_idx);

	public int get_member_cart_count(int member_idx);

	public CartVO get_cart_search(int member_cart_idx);

	public int set_cart_update(String member_cart_idx, String size, String color);

	public int set_cart_product_delete(String member_cart_idx);

}
