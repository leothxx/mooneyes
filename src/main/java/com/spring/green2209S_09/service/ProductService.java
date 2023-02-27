package com.spring.green2209S_09.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.green2209S_09.vo.MainCategoryVO;
import com.spring.green2209S_09.vo.Main_Sub_CategoryVO;
import com.spring.green2209S_09.vo.MiniCategoryVO;
import com.spring.green2209S_09.vo.ProductAllVO;
import com.spring.green2209S_09.vo.ProductUploadVO;
import com.spring.green2209S_09.vo.SubCategoryVO;
import com.spring.green2209S_09.vo.WishListVO;

public interface ProductService {

	public ArrayList<MainCategoryVO> get_main_category();

	public ArrayList<SubCategoryVO> get_sub_category(int mainCategory);

	public ArrayList<MiniCategoryVO> get_mini_category(int subCategory);

	public void set_product_input(MultipartHttpServletRequest file, ProductUploadVO vo);

	public ArrayList<ProductAllVO> get_best_product();

	public ArrayList<ProductAllVO> get_new_product();

	public ProductAllVO get_product_search(String product_idx);

	public ArrayList<Main_Sub_CategoryVO> get_main_sub_category();

	public ArrayList<ProductAllVO> get_product_all(int startIndexNo, int pageSize);

	public ArrayList<ProductAllVO> get_product_main_search(int startIndexNo, int pageSize, String category_main);

	public MainCategoryVO get_what_main_category(String category_main);

	public SubCategoryVO get_what_sub_category(String category_sub);
	
	public MiniCategoryVO get_what_mini_category(String category_mini);
	
	public ArrayList<ProductAllVO> get_product_sub_search(int startIndexNo, int pageSize, String string);
	
	public ArrayList<ProductAllVO> get_product_mini_search(int startIndexNo, int pageSize, String string);

	public ArrayList<WishListVO> get_wish_list(int member_idx, int startIndexNo, int pageSize);

	public int set_wishList(int member_idx, ProductAllVO productVO, String product_size, String product_color);

	public int set_wishlist_update(int product_wishlist_idx, String size, String color);

	public int set_wishlist_delete(int product_wishlist_idx);

	public WishListVO get_wishlist_search(int product_wishlist_idx);

	public ArrayList<ProductAllVO> get_product_search_text(int startIndexNo, int pageSize, String searchString);


}
