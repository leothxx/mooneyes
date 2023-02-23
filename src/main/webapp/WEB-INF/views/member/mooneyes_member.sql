show tables;

CREATE TABLE mooneyes_member (
	member_idx INT NOT NULL AUTO_INCREMENT,
	member_mid VARCHAR(50) NOT NULL,
	member_pwd VARCHAR(200) NOT NULL,
	member_name VARCHAR(50) NOT NULL,
	member_email VARCHAR(100) NOT NULL,
	member_address VARCHAR(100) NOT NULL,
	member_tel VARCHAR(20),
	member_phone VARCHAR(20) NOT NULL,
	member_sms_check VARCHAR(1) NOT NULL DEFAULT 'N',
	member_email_check VARCHAR(1) NOT NULL DEFAULT 'N',
	member_birthday VARCHAR(20),
	member_car VARCHAR(50),
	member_motorcycle VARCHAR(100),
	member_refund_bank VARCHAR(10),
	member_refund_number VARCHAR(30),
	member_refund_name VARCHAR(20),
	member_certification VARCHAR(1) NOT NULL DEFAULT 'N',
	member_signIp VARCHAR(20) NOT NULL,
	member_visitIp VARCHAR(20) NOT NULL,
	member_delete_check VARCHAR(1) NOT NULL DEFAULT 'N',
	member_sign_date DATETIME DEFAULT now(),
	member_visit_date DATETIME DEFAULT now(),
	member_level INT NOT NULL DEFAULT 0,
	member_point INT NOT NULL DEFAULT 3000,
	member_email_key VARCHAR(30) NOT NULL,
	PRIMARY KEY(member_idx)
);

CREATE TABLE mooneyes_question (
	question_idx INT NOT NULL AUTO_INCREMENT,
    member_idx INT NOT NULL,
    member_name VARCHAR(50) NOT NULL,
    question_pwd VARCHAR(200) NOT NULL,
    question_title VARCHAR(30) NOT NULL,
    question_desc TEXT NOT NULL,
    PRIMARY KEY (question_idx, member_idx),
    FOREIGN KEY (member_idx) REFERENCES mooneyes_member (member_idx) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO mooneyes_member VALUES (DEFAULT,'admin','1234','��������','28453/��� û�ֽ� ����� ����� 124/Ǫ������Ʈ 103�� 1303ȣ/(����,Ǫ������Ʈ)','shn2769@naver.com','043-271-5999','010-8417-2769','Y','Y',null,null,null,null,null,null,'Y','192.168.50.191','192.168.50.191',DEFAULT,DEFAULT,DEFAULT,4,DEFAULT,'abcd1234');