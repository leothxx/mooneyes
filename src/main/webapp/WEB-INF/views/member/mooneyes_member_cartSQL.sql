CREATE TABLE mooneyes_member_cart (
	member_cart_idx INT NOT NULL AUTO_INCREMENT,
    member_idx INT NOT NULL,
    product_idx INT NOT NULL,
    product_name VARCHAR(50) NOT NULL,
    product_price INT NOT NULL,
    product_sale_price INT,
    product_point INT NOT NULL,
    product_vat INT NOT NULL,
    product_size VARCHAR(100) NOT NULL,
    product_color VARCHAR(100) NOT NULL,
    product_count INT NOT NULL,
    PRIMARY KEY (member_cart_idx, member_idx, product_idx),
    FOREIGN KEY (member_idx) REFERENCES mooneyes_member (member_idx) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (product_idx) REFERENCES mooneyes_product (product_idx) ON DELETE CASCADE ON UPDATE CASCADE
);