package com.spring.green2209S_09.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.green2209S_09.vo.MainCategoryVO;
import com.spring.green2209S_09.vo.Main_Sub_CategoryVO;
import com.spring.green2209S_09.vo.MiniCategoryVO;
import com.spring.green2209S_09.vo.ProductAllVO;
import com.spring.green2209S_09.vo.ProductImageVO;
import com.spring.green2209S_09.vo.ProductUploadVO;
import com.spring.green2209S_09.vo.SubCategoryVO;
import com.spring.green2209S_09.vo.WishListVO;

public interface ProductDAO {

	public ArrayList<MainCategoryVO> get_main_category();

	public ArrayList<SubCategoryVO> get_sub_category(@Param("mainCategory") int mainCategory);

	public ArrayList<MiniCategoryVO> get_mini_category(@Param("subCategory") int subCategory);

	public void set_product_input(@Param("vo") ProductUploadVO vo);

	public int get_product_idx_search(@Param("product_name") String product_name);

	public void set_product_images_input(@Param("vo") ProductImageVO image_vo);

	public ArrayList<ProductAllVO> get_best_product();

	public ArrayList<ProductAllVO> get_new_product();

	public ProductAllVO get_product_search(@Param("product_idx") String product_idx);

	public ArrayList<Main_Sub_CategoryVO> get_main_sub_category();

	public ArrayList<ProductAllVO> get_product_all(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize);

	public int totRecCnt(@Param("part") String part, @Param("searchString") String searchString);

	public ArrayList<ProductAllVO> get_product_main_search(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize, @Param("category_main") String category_main);

	public MainCategoryVO get_what_main_category(@Param("category_main") String category_main);

	public ArrayList<ProductAllVO> get_product_sub_search(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize, @Param("category_sub") String category_sub);
	
	public ArrayList<ProductAllVO> get_product_mini_search(@Param("startIndexNo") int startIndexNo,@Param("pageSize") int pageSize, @Param("category_mini") String category_mini);

	public SubCategoryVO get_what_sub_category(@Param("category_sub") String category_sub);
	
	public MiniCategoryVO get_what_mini_category(@Param("category_mini") String category_mini);

	public ArrayList<WishListVO> get_wish_list(@Param("member_idx") int member_idx);
	
	
}
