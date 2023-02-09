package com.spring.green2209S_09.vo;

import lombok.Data;

public @Data class ProductImageVO {
	private int product_images_idx;
	private int product_idx;
	private String product_fSName;
	private String product_fOName;
	private int product_fileSize;
	private String create_date;
	private String product_file_delete_check;
}
