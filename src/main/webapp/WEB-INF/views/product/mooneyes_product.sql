CREATE TABLE mooneyes_product (
	product_idx INT NOT NULL AUTO_INCREMENT,
	category_main INT NOT NULL,
	category_sub INT NOT NULL,
	category_mini INT NOT NULL,
	product_name VARCHAR(50) NOT NULL,
	product_price INT NOT NULL,
	product_sale_price INT,
	product_stock INT NOT NULL,
	product_size VARCHAR(100) NOT NULL,
	product_color VARCHAR(100) NOT NULL,
	product_desc TEXT NOT NULL,
	product_hits INT NOT NULL DEFAULT 0,
	PRIMARY KEY (product_idx)
);

CREATE TABLE mooneyes_product_image (
	product_images_idx INT NOT NULL AUTO_INCREMENT,
    product_idx INT NOT NULL,
    product_fSName VARCHAR(300) NOT NULL,
    product_fileSize INT NOT NULL,
    create_date DATETIME NOT NULL DEFAULT now(),
    product_file_delete_check VARCHAR(1) NOT NULL DEFAULT 'N',
    PRIMARY KEY (product_images_idx, product_idx),
    FOREIGN KEY (product_idx) REFERENCES mooneyes_product (product_idx) ON DELETE CASCADE ON UPDATE CASCADE
);

use green2209_09;