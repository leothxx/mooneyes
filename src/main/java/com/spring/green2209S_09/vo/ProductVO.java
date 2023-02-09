package com.spring.green2209S_09.vo;

import lombok.Data;

public @Data class ProductVO {
	private int product_idx;
	private int category_main;
	private int category_sub;
	private int category_mini;
	private String product_name;
	private int product_price;
	private int product_sale_price;
	private int product_stock;
	private String product_size;
	private String product_color;
	private String product_desc;
	private int product_hits;
}
