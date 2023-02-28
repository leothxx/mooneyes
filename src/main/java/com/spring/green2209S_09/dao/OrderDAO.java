package com.spring.green2209S_09.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.green2209S_09.vo.MemberVO;
import com.spring.green2209S_09.vo.OrderVO;
import com.spring.green2209S_09.vo.Payment_inputVO;

public interface OrderDAO {

	public int set_cash_order(@Param("vo") OrderVO vo,@Param("inputVO") Payment_inputVO inputVO);

	public void set_question(@Param("member_vo") MemberVO member_vo,@Param("inputVO") Payment_inputVO inputVO,@Param("title") String title);

	public int set_card_order(@Param("vo") OrderVO order_vo, @Param("inputVO") Payment_inputVO inputVO);

	public ArrayList<OrderVO> get_mooneyes_order_list(@Param("startIndexNo") int startIndexNo, @Param("pageSize") int pageSize, @Param("member_idx") int member_idx,@Param("payment") String payment);

	public OrderVO get_mooneyes_order_image_list(@Param("member_idx") int member_idx,@Param("product_idx") String product_idx, @Param("order_idx") String order_idx);

	public int get_mooneyes_order_count_N(@Param("member_idx") int member_idx);
	
	public int get_mooneyes_order_count_Y(@Param("member_idx") int member_idx);
	
	public int get_mooneyes_order_count_D(@Param("member_idx") int member_idx);
	
	public int get_mooneyes_order_count_O(@Param("member_idx") int member_idx);
	
	public int get_mooneyes_order_count_C(@Param("member_idx") int member_idx);
	
	public int get_mooneyes_order_count_E(@Param("member_idx") int member_idx);
	
	public int get_mooneyes_order_count_R(@Param("member_idx") int member_idx);

	public OrderVO get_mooneyes_order(@Param("order_idx") int order_idx);

	public int get_mooneyes_order_cancel(@Param("order_idx") int order_idx);
	
}
