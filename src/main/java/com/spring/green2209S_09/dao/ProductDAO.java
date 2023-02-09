package com.spring.green2209S_09.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.green2209S_09.vo.MainCategoryVO;
import com.spring.green2209S_09.vo.MiniCategoryVO;
import com.spring.green2209S_09.vo.ProductAllVO;
import com.spring.green2209S_09.vo.ProductImageVO;
import com.spring.green2209S_09.vo.ProductUploadVO;
import com.spring.green2209S_09.vo.SubCategoryVO;

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
	
}
