package com.spring.green2209S_09.vo;

import lombok.Data;

public @Data class CartVO {
	private int member_cart_idx;
	private int member_idx;
	private int product_idx;
	private String product_name;
	private int product_price;
	private int product_sale_price;
	private int product_point;
	private int product_vat;
	private String product_size;
	private String product_color;
	private int product_count;
	
	
	private int product_images_idx;
	private String product_fSName;
	private String product_fOName;
	private int product_fileSize;
	private String create_date;
	private String product_file_delete_check;
}
