package com.spring.green2209S_09.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.green2209S_09.vo.MainCategoryVO;
import com.spring.green2209S_09.vo.MiniCategoryVO;
import com.spring.green2209S_09.vo.ProductAllVO;
import com.spring.green2209S_09.vo.ProductUploadVO;
import com.spring.green2209S_09.vo.SubCategoryVO;

public interface ProductService {

	public ArrayList<MainCategoryVO> get_main_category();

	public ArrayList<SubCategoryVO> get_sub_category(int mainCategory);

	public ArrayList<MiniCategoryVO> get_mini_category(int subCategory);

	public void set_product_input(MultipartHttpServletRequest file, ProductUploadVO vo);

	public ArrayList<ProductAllVO> get_best_product();

	public ArrayList<ProductAllVO> get_new_product();

	public ProductAllVO get_product_search(String product_idx);

}
