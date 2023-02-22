CREATE TABLE mooneyes_order (
	order_idx INT NOT NULL AUTO_INCREMENT,
    member_idx INT NOT NULL,
    product_idx VARCHAR(100) NOT NULL,
    order_price INT NOT NULL,
    order_tot_price INT NOT NULL,
    order_name VARCHAR(100) NOT NULL,
    order_address VARCHAR(100) NOT NULL,
    order_phone VARCHAR(50) NOT NULL,
    order_email VARCHAR(100) NOT NULL,
    delivery_msg VARCHAR(100),
    order_count VARCHAR(100) NOT NULL,
    order_option VARCHAR(200) NOT NULL,
    order_point INT,
    order_tot_point INT NOT NULL,
    order_tot_point_sw VARCHAR(1) NOT NULL DEFAULT 'N',
    addr_paymethod VARCHAR(10) NOT NULL,
    paymethod_bank_name VARCHAR(50) NOT NULL,
    paymethod_bank_buyer_name VARCHAR(50) NOT NULL,
    cashreceipt VARCHAR(1),
    cashreceipt1 VARCHAR(20),
    cashreceipt_personal_number VARCHAR(50),
    cashreceipt_employed_number VARCHAR(50),
    payment VARCHAR(1) DEFAULT 'N',
    delivery_price INT NOT NULL,
    PRIMARY KEY(order_idx, member_idx),
    FOREIGN KEY (member_idx) REFERENCES mooneyes_member (member_idx) ON DELETE CASCADE ON UPDATE CASCADE
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