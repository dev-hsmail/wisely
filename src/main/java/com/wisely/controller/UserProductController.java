package com.wisely.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wisely.domain.CategoryVO;
import com.wisely.domain.ProductVO;
import com.wisely.dto.Criteria;
import com.wisely.dto.PageDTO;
import com.wisely.service.UserProductService;
import com.wisely.util.UploadFileUtils;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/user/product/*")
@Controller
public class UserProductController {

	@Setter(onMethod_ = {@Autowired})
	private UserProductService userProService;

	// bean중에 uploadPath bean객체를 찾아, 아래 변수에 주입한다.
	@Resource(name = "uploadPath")	// 자원의 주입은 @Resource(name = "bean이름")
	private String uploadPath;	
	
	// 2차 카테고리 정보 : Ajax사용
	@ResponseBody	// ajax 작업 시 해당 어노테이션 필수
	@GetMapping("/subCategoryList/{ctgr_cd}")
	public ResponseEntity<List<CategoryVO>> subCategoryList(@PathVariable("ctgr_cd") Integer ctgr_cd) {
		
		ResponseEntity<List<CategoryVO>> entity = null;
		
		entity = new ResponseEntity<List<CategoryVO>>(userProService.getSubCategoryList(ctgr_cd), HttpStatus.OK);
		
		return entity;
	}
	
	// 상품리스트, 페이징 기능 추가(검색기능 제외)
	@GetMapping("/productList/{ctgr_cd}/{ctgr_nm}")
	public String productList(@PathVariable("ctgr_cd") Integer ctgr_cd, @PathVariable("ctgr_nm") String ctgr_nm, @ModelAttribute("cri") Criteria cri, Model model) {
		
		cri.setAmount(9);	// 9개 씩 리스트 출력
		
		List<ProductVO> productList = userProService.getProductListbysubCategory(ctgr_cd, cri);
		
		for (int i = 0; i < productList.size(); i++) {
			String prdc_img_folder = productList.get(i).getPrdc_img_folder().replace("\\", "/");	
			productList.get(i).setPrdc_img_folder(prdc_img_folder);
		}
		
		// 1) 페이징쿼리에 의한 상품목록
		model.addAttribute("productList", productList);
		
		// [prev] 1 2 3 4 5 [next]
		int totalCount = userProService.getProductCountbysubCategory(ctgr_cd, cri);
		// 2) 페이지 표시
		model.addAttribute("pageMaker", new PageDTO(cri, totalCount));
		
		return "/user/product/productList";
	}
	
	// 상품목록에서 이미지 보여주기
	@ResponseBody
	@GetMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String folderName, String fileName) {
		
		log.info("폴더이름: " + folderName);
		log.info("파일이름: " + fileName);
		
		
		// 이미지를 바이트 배열 읽어오는 작업
		return UploadFileUtils.getFile(uploadPath, folderName + "\\" + fileName);
	}
	
	// 모달 대화상자에서 사용할 상품 상세정보
	@ResponseBody
	@GetMapping("/productDetail/{prdc_num}")	// < /{prdc_num} 같은 표기방식 REST api 개발방법
	public ResponseEntity<ProductVO> productDetail(@PathVariable("prdc_num") Integer prdc_num) {
		
		ResponseEntity<ProductVO> entity = null;
		
		ProductVO vo = userProService.getProductByNum(prdc_num);
		vo.setPrdc_img_folder(vo.getPrdc_img_folder().replace("\\", "/"));
		
		entity = new ResponseEntity<ProductVO>(vo, HttpStatus.OK);
		
		return entity;
		
	}
	
	// 파라미터 값을 jsp에서 사용하고자 할 때 @ModelAttribute
	// 상품상세주소. 클라이언트에서 actionForm으로 전송되어옴.
	@GetMapping("/productDetail")	// < /{prdc_num} 같은 표기방식 REST api 개발방법
	public String productDetail(@RequestParam("prdc_num") Integer prdc_num, @ModelAttribute("ctgr_cd") Integer ctgr_cd, @ModelAttribute("ctgr_nm") String ctgr_nm, @ModelAttribute("cri") Criteria cri, Model model) {
		
		ProductVO vo = userProService.getProductByNum(prdc_num);
		vo.setPrdc_img_folder(vo.getPrdc_img_folder().replace("\\", "/"));
		
		log.info("상품코드: " + prdc_num);
		log.info("검색 및 페이지정보: " + cri);
		
		log.info("카테고리 코드: " + ctgr_cd);
		log.info("카테고리 이름: " + ctgr_nm);
		
		model.addAttribute("productVO", vo);
		
		return "/user/product/productDetail";
		
	}
}
