package com.spring.green2209S_09.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.green2209S_09.vo.CartVO;

public interface CartDAO {

	public ArrayList<CartVO> get_member_cart_list(@Param("member_idx") int member_idx);

	public int get_member_cart_count(@Param("member_idx") int member_idx);

	public CartVO get_cart_search(@Param("member_cart_idx") int member_cart_idx);
	
}
