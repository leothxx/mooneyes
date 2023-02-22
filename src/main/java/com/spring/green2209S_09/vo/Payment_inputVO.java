package com.spring.green2209S_09.vo;

import lombok.Data;

public @Data class Payment_inputVO {
	private String buyer_name; // 받는사람
	
	private String postcode; // 우편번호
	private String roadAddress; // 주소
	private String detailAddress; // 상세주소
	private String extraAddress; // 참고항목
	
	private String buyer_tel1; // 휴대전화 1
	private String buyer_tel2; // 휴대전화 2
	private String buyer_tel3; // 휴대전화 3
	
	private String buyer_email1; // 이메일 1
	private String buyer_email2; // 이메일 2
	
	private String delivery_msg; // 배송 메세지
	
	private String question; // 문의사항 내용
	private String question_pwd; // 문의사항 비밀번호
	
	private int buyer_point; // 사용 포인트
	
	private String addr_paymethod; // 결제 방식
	
	private String paymethod_bank_name; // 입금 은행
	private String paymethod_bank_buyer_name; // 입금자명
	
	private String cashreceipt; // 현금영수증 여부
	private String cashreceipt1; // 현금영수증 개인 및 사업자여부
	
	private String cashreceipt_personal_number1; // 현금영수증 개인 번호 1
	private String cashreceipt_personal_number2; // 현금영수증 개인 번호 2
	private String cashreceipt_personal_number3; // 현금영수증 개인 번호 3
	
	private String cashreceipt_employed_number; // 현금영수증 사업자 번호
	
	private int order_price; // 결제 금액
	private int order_tot_price; // 결제 최종금액
	private int delivery_price; // 배송비
	private int order_point; // 포인트 사용액
	private int order_tot_point; // 적립 예정 금액
	
	private String order_option; // 주문 옵션
	private String order_count; // 주문 수량
	private String product_idx; // 상품 고유번호
	
	private String member_cart_idx; // 카트 고유번호
}
