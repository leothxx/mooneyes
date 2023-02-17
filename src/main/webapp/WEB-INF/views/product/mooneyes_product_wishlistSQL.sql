CREATE TABLE mooneyes_product_wishlist (
	product_wishlist_idx INT NOT NULL,
	member_idx INT NOT NULL,
	product_idx INT NOT NULL,
	product_name VARCHAR(50) NOT NULL,
	product_price INT NOT NULL,
	product_sale_price INT,
	product_size VARCHAR(100),
	product_color VARCHAR(100),
	PRIMARY KEY (product_wishlist_idx, member_idx, product_idx),
	FOREIGN KEY (member_idx) REFERENCES mooneyes_member (member_idx) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (product_idx) REFERENCES mooneyes_product (product_idx) ON DELETE CASCADE ON UPDATE CASCADE
);