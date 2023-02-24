package com.spring.green2209S_09.vo;

import lombok.Data;

public @Data class Service_answerVO {
	private int service_answer_idx;
	private int service_idx;
	private int member_idx;
	private String service_answer_name;
	private String service_answer_title;
	private String service_answer_content;
	private String service_answer_date;
}
