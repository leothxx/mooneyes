package com.spring.green2209S_09.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.green2209S_09.dao.ProductDAO;
import com.spring.green2209S_09.vo.MainCategoryVO;
import com.spring.green2209S_09.vo.MiniCategoryVO;
import com.spring.green2209S_09.vo.ProductAllVO;
import com.spring.green2209S_09.vo.ProductImageVO;
import com.spring.green2209S_09.vo.ProductUploadVO;
import com.spring.green2209S_09.vo.SubCategoryVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDAO productDAO;

	@Override
	public ArrayList<MainCategoryVO> get_main_category() {
		return productDAO.get_main_category();
	}

	@Override
	public ArrayList<SubCategoryVO> get_sub_category(int mainCategory) {
		return productDAO.get_sub_category(mainCategory);
	}

	@Override
	public ArrayList<MiniCategoryVO> get_mini_category(int subCategory) {
		return productDAO.get_mini_category(subCategory);
	}

	// 파일을 저장시키고, 상품 테이블 (DB)에 자료 저장
	@Override
	public void set_product_input(MultipartHttpServletRequest mfile, ProductUploadVO vo) {
		try {
			List<MultipartFile> fileList = mfile.getFiles("product_images");
			String oFileNames = "";
			String sFileNames = "";
			int fileSizes = 0;
			
			for(MultipartFile file : fileList) {
				String oFileName = file.getOriginalFilename();
				String sFileName = saveFileName(oFileName);
				
				oFileNames += oFileName + "/";
				sFileNames += sFileName + "/";
				// 파일 업로드 메소드 호출
				writeFile(file, sFileName);
				
				fileSizes += file.getSize();
			}
			int product_sale_price = vo.getProduct_sale_price() == null ? 0 : vo.getProduct_sale_price() ;
			// 상품을 product DB에 저장
			vo.setProduct_sale_price(product_sale_price);
			productDAO.set_product_input(vo);
			
			// 위에서 저장한 product DB에 저장된 idx값을 가져오기
			int product_idx = productDAO.get_product_idx_search(vo.getProduct_name());
			
			ProductImageVO image_vo = new ProductImageVO();
			image_vo.setProduct_idx(product_idx); // idx값을 넣어준 후
			image_vo.setProduct_fOName(oFileNames);
			image_vo.setProduct_fSName(sFileNames);
			image_vo.setProduct_fileSize(fileSizes);
			// 상품의 관한 image를 product image DB에 저장
			productDAO.set_product_images_input(image_vo);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 실제로 파일을 서버에 저장한다.
	private void writeFile(MultipartFile file, String sFileName) throws IOException {
		byte[] data = file.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/product/");
		
		FileOutputStream fos = new FileOutputStream(realPath + sFileName);
		fos.write(data);
		fos.close();
	}
	
	// 실제 서버에 저장되는 파일명 중복방지를 위한 파일명설정
	private String saveFileName(String oFileName) {
		String fileName = "";
		
		Calendar cal = Calendar.getInstance();
		fileName += cal.get(Calendar.YEAR);
		fileName += cal.get(Calendar.MONTH);
		fileName += cal.get(Calendar.DATE);
		fileName += cal.get(Calendar.HOUR);
		fileName += cal.get(Calendar.MINUTE);
		fileName += cal.get(Calendar.SECOND);
		fileName += cal.get(Calendar.MILLISECOND);
		fileName += "_" + oFileName;
		
		return fileName;
	}

	@Override
	public ArrayList<ProductAllVO> get_best_product() {
		return productDAO.get_best_product();
	}

	@Override
	public ArrayList<ProductAllVO> get_new_product() {
		return productDAO.get_new_product();
	}

	@Override
	public ProductAllVO get_product_search(String product_idx) {
		return productDAO.get_product_search(product_idx);
	}
}
