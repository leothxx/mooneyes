package com.spring.green2209S_09.vo;

import lombok.Data;

public @Data class MemberVO {
	private int member_idx;
	private String member_mid;
	private String member_pwd;
	private String member_name;
	private String member_email;
	private String member_address;
	private String member_tel;
	private String member_phone;
	private String member_sms_check;
	private String member_email_check;
	private String member_birthday;
	private String member_car;
	private String member_motorcycle;
	private String member_refund_bank;
	private String member_refund_number;
	private String member_refund_name;
	private String member_certification;
	private String member_signIp;
	private String member_visitIp;
	private String member_delete_check;
	private String member_sign_date;
	private String member_visit_date;
	private int member_level;
	private int member_point;
	private String member_email_key;
}
