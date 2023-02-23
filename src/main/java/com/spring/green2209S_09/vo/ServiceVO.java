package com.spring.green2209S_09.vo;

import lombok.Data;

public @Data class ServiceVO {
	private int service_idx;
	private int member_idx;
	private String member_name;
	private String service_title;
	private String service_content;
	private String service_category;
	private String service_pwd;
	private String service_date;
	private String service_ip;
	private String service_answer_sw;
}
