package com.spring.green2209S_09.vo;

import lombok.Data;

public @Data class ProductAllVO {
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
	
	private int product_images_idx;
	private String product_fSName;
	private String product_fOName;
	private int product_fileSize;
	private String create_date;
	private String product_file_delete_check;
	
	private Integer fileSize;
}
