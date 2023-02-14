package com.spring.green2209S_09;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.spring.green2209S_09.service.ProductService;
import com.spring.green2209S_09.vo.MainCategoryVO;
import com.spring.green2209S_09.vo.Main_Sub_CategoryVO;
import com.spring.green2209S_09.vo.ProductAllVO;

@Controller
public class HomeController {
	@Autowired
	ProductService productService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = {"/","s"}, method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		ArrayList<ProductAllVO> product_vos = productService.get_best_product();
		model.addAttribute("product_vos",product_vos);
		ArrayList<ProductAllVO> new_vos = productService.get_new_product();
		model.addAttribute("new_vos",new_vos);
		
		ArrayList<MainCategoryVO> main_category_vos = productService.get_main_category();
		session.setAttribute("main_category_vos", main_category_vos);
		
		ArrayList<Main_Sub_CategoryVO> main_sub_category_vos = productService.get_main_sub_category();
		session.setAttribute("main_sub_category_vos", main_sub_category_vos);
		session.setAttribute("menu", "menu");
		return "main";
	}
	
	@RequestMapping("/imageUpload")
	public void imageUploadGet(MultipartFile upload,
			HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String oFileName = upload.getOriginalFilename();
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		oFileName = sdf.format(date) + "_" + oFileName;
		
		byte[] bytes = upload.getBytes();
		
		// ckeditor에서 올린(전송) 파일을, 서버 파일시스템에 실제로 저장할 경로를 결정한다.
		String realPath = request.getSession().getServletContext().getRealPath("/resources/data/ckeditor/");
		OutputStream os = new FileOutputStream(new File(realPath + oFileName));
		os.write(bytes);
		
		// 서버 파일시스템에 저장되어 있는 파일을 브라우저 편집 화면에 보여주기 위한 작업
		PrintWriter out = response.getWriter();
		String fileUrl = request.getContextPath() + "/data/ckeditor/" + oFileName;
		out.println("{\"originalFilename\":\""+oFileName+"\",\"uploaded\":1,\"url\":\""+fileUrl+"\"}");
    
		out.flush();
		os.close();
	}
	
}
