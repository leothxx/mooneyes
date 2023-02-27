package com.spring.green2209S_09.vo;

import lombok.Data;

public @Data class OrderVO {
	private int order_idx;
	private int member_idx;
	private String product_idx;
	private int order_price;
	private int order_tot_price;
	private String order_name;
	private String order_address;
	private String order_phone;
	private String order_email;
	private String delivery_msg;
	private String order_count;
	private String order_option;
	private int order_point;
	private int order_tot_point;
	private String order_tot_point_sw;
	private String addr_paymethod;
	private String paymethod_bank_name;
	private String paymethod_bank_buyer_name;
	private String cashreceipt;
	private String cashreceipt1;
	private String cashreceipt_personal_number;
	private String cashreceipt_employed_number;
	private String payment;
	private int delivery_price;
	private String order_date;
	
	private int product_images_idx;
	private String product_fSName;
	private String product_fOName;
	private int product_fileSize;
	private String create_date;
	private String product_file_delete_check;
	
	private String product_name;
}
