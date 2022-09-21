<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>DocMall Shopping</title>

<meta name="theme-color" content="#563d7c">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    
    <%@include file="/WEB-INF/views/include/common.jsp" %>

  </head>
  <body>
    
    <%@include file="/WEB-INF/views/include/header.jsp" %>
    
	<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
	  <h1 class="display-4">${ctgr_nm}</h1>
	</div>
	
	<div class="container">
	  
      <div class="row">
	      <c:forEach items="${productList}" var="productVO">
	        <div class="col-md-4">
	          <div class="card mb-4 shadow-sm">
	            <!-- <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg> -->
	            <!-- 상품이미지 -->
	            <a class="move" href="${productVO.prdc_num}">
					<img src="/user/product/displayFile?folderName=${productVO.prdc_img_folder}&fileName=s_${productVO.prdc_img}"
	                     alt="" class="bd-placeholder-img card-img-top" width="100%" height="225" onerror="this.onerror=null; this.src='/image/no_image.png'">
                </a>
	            <div class="card-body">
	              <p class="card-text">
	              	${productVO.prdc_nm}<br>
	              	${productVO.prdc_com}<br>
	              	<fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${productVO.prdc_prc}" currencySymbol="\\"></fmt:formatNumber>
	              	<br>
	              </p>
	              <div class="d-flex justify-content-between align-items-center">
	                <div class="btn-group">
	                  <button type="button" name="btnBuyCart" data-prdc_num="${productVO.prdc_num}" class="btn btn-sm btn-outline-secondary">Buy & Cart</button>
	                </div>
	                <small class="text-muted">9 mins</small>
	              </div>
	            </div>
	          </div>
	        </div>
          </c:forEach>
      </div>
      <div class="row">
      	<div class="col-12">
      		<nav aria-label="...">
			  <ul class="pagination">
			  
			  	<!-- 이전표시 -->
			  	<c:if test="${pageMaker.prev}">
				    <li class="page-item">
				    	<a class="page-link" href="${pageMaker.startPage - 1}">Prev</a>
				    </li>
			    </c:if>
			    
			    <!-- 페이지번호 표시. 1 2 3 4 5 ... -->
			    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">		    
				    <li class='page-item ${pageMaker.cri.pageNum == num ? "active" : ""}'>
				    	<a class="page-link" href="${num}">${num}</a>
				    </li>
			    </c:forEach>
			    <!--
			    <li class="page-item active" aria-current="page">
			    	<a class="page-link" href="${pageNum }">2</a>
			    </li> 
			     -->
			    
			    <!-- 다음표시 -->
			    <c:if test="${pageMaker.next }">
				    <li class="page-item">
				    	<a class="page-link" href="${pageMaker.endPage + 1}">Next</a>
				    </li>		    
			    </c:if>
			  </ul>
			  
			  <!-- 1)페이지 번호 클릭 시  2)상품 수정버튼 클릭 시   3)상품 삭제버튼 클릭 시 -->
			  <form id="actionForm" action="" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
					<input type="hidden" name="type" value="${pageMaker.cri.type}">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					<input type="hidden" name="ctgr_cd" value="${ctgr_cd}">
					<input type="hidden" name="ctgr_nm" value="${ctgr_nm}">
			  </form>
			</nav>
      	</div>
      </div>
	        
      <!--  footer.jsp -->
	  <%@include file="/WEB-INF/views/include/footer.jsp" %>
	  
    </div>
   	
   	<!-- Modal 대화상자 : 상품 상세보기  -->  
	<div class="modal" id="modal_productDetail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<div class="row">
	      		<div class="col-md-6">
	      			<img src="" id="modal_detail_image"
                     	 alt="" class="bd-placeholder-img card-img-top" onerror="this.onerror=null; this.src='/image/no_image.png'">
	      		</div>
	      		<div class="col-md-6">
	      			<form>
	      			  <div class="form-group row">
			            <label for="prdc_nm" class="col-form-label col-3">상품이름</label>
			            <div class="col-9">
			            	<input type="text" class="form-control" id="prdc_nm" readonly>
			            	<input type="hidden" class="form-control" id="prdc_num">
			            </div>
			          </div>
			          <div class="form-group row">
			            <label for="prdc_prc" class="col-form-label col-3">판매가격</label>
			            <div class="col-9">
			            	<input type="text" class="form-control" id="prdc_prc" readonly>
			            </div>
			          </div>
			          <div class="form-group row">
			            <label for="prdc_com" class="col-form-label col-3">제조사</label>
			            <div class="col-9">
			            	<input type="text" class="form-control" id="prdc_com" readonly>
			            </div>
			          </div>
			          <div class="form-group row">
			            <label for="prdc_amt" class="col-form-label col-3">수량</label>
			            <div class="col-9">
			            	<input type="number" class="form-control" id="prdc_amt" min="1" value="1">
			            </div>
			          </div>
			        </form>
	      		</div>
	      	</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" name="btnModalBuy" class="btn btn-primary">BUY IT NOW</button>
	        <button type="button" name="btnModalCart" class="btn btn-primary">ADD TO CART</button>
	      </div>
	    </div>
	  </div>
	</div>
    
	<script>

		$(function(){

			$("button[name='btnBuyCart']").on("click", function(){
				
				$("#modal_productDetail").modal("show");
				
				let url = "/user/product/productDetail/" + $(this).data("prdc_num");	// data-prdc_num="" 접근할 때 data() 메소드 사용

				$.getJSON(url, function(result){

					// 모달 대화상자에서 상품상세정보 표시
					// console.log("상품상세정보" + result.prdc_num);	// result가 productVO가 된다.
					
					// 상품코드
					$("div#modal_productDetail input#prdc_num").val(result.prdc_num);
					
					// 상품이름
					$("div#modal_productDetail input#prdc_nm").val(result.prdc_nm);
					
					// 판매가격
					$("div#modal_productDetail input#prdc_prc").val(result.prdc_prc);
					
					// 제조사
					$("div#modal_productDetail input#prdc_com").val(result.prdc_com);
					
					// 상품이미지
					// /user/product/displayFile?folderName=${productVO.prdc_img_folder}&fileName=s100_${productVO.prdc_img}
					let url = "/user/product/displayFile?folderName=" + result.prdc_img_folder + "&" + "fileName=" + result.prdc_img;
					
					// console.log("이미지 파일경로: " + url);
					$("div#modal_productDetail img#modal_detail_image").attr("src", url);
				});
				
			});
			
			// 장바구니 담기. ajax
			$("button[name='btnModalCart']").on("click", function(){
				
				$.ajax({
					url: '/user/cart/cart_add',
					data: {prdc_num : $("div#modal_productDetail input#prdc_num").val() , cart_amt: $("div#modal_productDetail input#prdc_amt").val()},
					dataType: 'text',
					success: function(result){
						if (result == "success") {
							alert("장바구니에 추가되었습니다.");
							if(confirm("장바구니로 이동하시겠습니까?")) {
								location.href="/user/cart/cart_list";
							} 
						}
					}
				});
				
			});

			// 직접구매 버튼 클릭 시. non-ajax
			$("button[name='btnModalBuy']").on("click", function(){

				let prdc_num = $("div#modal_productDetail input#prdc_num").val();	// 구매상품코드
				let odr_amt = $("div#modal_productDetail input#prdc_amt").val();	// 구매수량

				let url = "/user/order/orderListInfo?prdc_num="+prdc_num+"&odr_amt="+odr_amt+"&type=direct";
				// console.log("직접구매 주소: " + url);
				location.href = url;
			});

			// actionForm 참조 : 1.페이지 번호 클릭. 2.검색버튼 클릭
			let actionForm = $("#actionForm");
			
			// 3.페이지번호 클릭
		    $("ul.pagination li a.page-link").on("click", function(e){
			  e.preventDefault();	// <a>태크의 링크기능 무력화
			  
		      let pageNum = $(this).attr("href");
		      
			  actionForm.find("input[name='pageNum']").val(pageNum);
		      
		      // pageNum 필드는 actionForm이 수동으로 작업되어 있어 추가하는것이 아니라 참조하여 값을 변경한다.

		      let url = "/user/product/productList/${ctgr_cd}/" + encodeURIComponent("${ctgr_nm}");
		      
		      actionForm.attr("method", "get");
		      actionForm.attr("action", url);
		      actionForm.submit();
			  
		      console.log("pageNum: " + pageNum);
		    });
		    
		 	
		    let searchForm = $("#searchForm");
		    
		    // 검색버튼 클릭 시 pageNum 초기화
		    $("#btnSearch").on("click", function(){

		      searchForm.find("input[name='pageNum']").val(1);
		      searchForm.submit();

		    });
			
		    // 상품이미지, 상품제목 클릭
		    $("div.container a.move").on("click", function(e){
		    	e.preventDefault();
		    	
		    	let prdc_num = $(this).attr("href");
		    	
		    	actionForm.attr("method", "get");
		    	actionForm.attr("action", "/user/product/productDetail");
		    	
				actionForm.find("input[name='prdc_num']").remove();

		    	actionForm.append("<input type='hidden' name='prdc_num' value='" + prdc_num + "'>");
		    	
		    	// 2차 카테고리 코드, 카테고리 이름 필드추가
		    	
		    	actionForm.submit();
		    });
		    
		});	// jquery ready 이벤트 끝

	</script>

  </body>
</html>
    