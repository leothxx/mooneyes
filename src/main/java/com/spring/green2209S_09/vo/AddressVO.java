package com.spring.green2209S_09.vo;

import lombok.Data;

public @Data class AddressVO {
	private int member_address_idx;
	private int member_idx;
	private String member_address_name;
	private String member_address_as;
	private int member_address_postcode;
	private String member_address_roadAddress;
	private String member_address_detailAddress;
	private String member_address_extraAddress;
	private String member_address_sw;
}
