package com.spring.green2209S_09.pagination;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.green2209S_09.dao.MemberDAO;
import com.spring.green2209S_09.dao.ProductDAO;

@Service
public class PageProcess {
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	public PageVO totRecCnt(int pag, int pageSize, String section, String part, String searchString) {
		PageVO pageVO = new PageVO();
		
		int totRecCnt = 0;
		
		if(section.equals("product") && part.equals("") && searchString.equals("")) {
			totRecCnt = productDAO.totRecCnt("","");
		}
		else if(section.equals("product") && !part.equals("") && searchString.equals("")) {
			totRecCnt = productDAO.totRecCnt(part,"");
		}
		else if(section.equals("wishList")) {
			totRecCnt = productDAO.totRecCnt2("wishList",part);
		}
		else if(section.equals("productSearch")) {
			totRecCnt = productDAO.totRecCnt2("product_search",part);
		}
		else if(section.equals("payment")) {
			totRecCnt = productDAO.totRecCnt3("payment",part, searchString);
		}
		
		
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize) + 1;
		int startIndexNo = (pag - 1) * pageSize;
		int curScrStartNo = totRecCnt - startIndexNo;
		
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage - 1) / blockSize;
		
		pageVO.setPag(pag);
		pageVO.setPageSize(pageSize);
		pageVO.setTotRecCnt(totRecCnt);
		pageVO.setTotPage(totPage);
		pageVO.setStartIndexNo(startIndexNo);
		pageVO.setCurScrStartNo(curScrStartNo);
		pageVO.setBlockSize(blockSize);
		pageVO.setCurBlock(curBlock);
		pageVO.setLastBlock(lastBlock);
		
		return pageVO;
	}
	
}
