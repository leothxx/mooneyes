package com.spring.green2209S_09.vo;

import lombok.Data;

public @Data class ProductUploadVO {
	private int product_idx;
	private int category_main;
	private int category_sub;
	private int category_mini;
	private String product_name;
	private Integer product_price;
	private Integer product_sale_price;
	private Integer product_stock;
	private String product_size;
	private String product_color;
	private String product_desc;
	private int product_hits;
	
	private Integer fileSize;
}
