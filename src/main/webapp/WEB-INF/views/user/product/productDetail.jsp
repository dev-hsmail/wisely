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

	  /* 상품후기 별 평점 */
	  /* 별 평점 기본 스타일 */
	  #star_rvw_score a.rvw_score {
		  font-size: 22px;
		  text-decoration: none;
		  color: lightgray;
	  }

	  /* 별 평점 클릭 시 jquery의 addClass(), removeClass() 메서드를 이용하여 사용할 css선택자. */
	  #star_rvw_score a.rvw_score.on {
		  color: black;
	  }
    </style>
    
    <%@include file="/WEB-INF/views/include/common.jsp" %>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
	<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

	<script id="reviewTemplate" type="text/x-handlebars-template">
		{{#each .}}
		<div class="list-group">
			<div class="d-flex w-100 justify-content-between">
				<h6 class="mb-1">{{idfourdisplay mb_id}}</h6>
				<p>
					<small>평점: {{displayStar rvw_score}}</small>
					{{modifyview mb_id rvw_num}}
					<input type="hidden" name="rvw_score" value="{{rvw_score}}">
				</p>
			</div>
			<div class="d-flex w-100 justify-content-between">
				<p class="mb-1"><span class="rvw_content">{{rvw_content}}</span></p>
				<p>
					<small>{{prettifyDate rvw_dt_reg}}</small>
					{{deleteview mb_id rvw_num}}
				</p>
			</div>
		</div>
		<hr>
		{{/each}}
	</script>

  </head>
  <body>
    
    <%@include file="/WEB-INF/views/include/header.jsp" %>
    
	<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
	  <h1 class="display-4">${ctgr_nm}</h1>
	  <p class="lead">Quickly build an effective pricing table for your potential customers with this Bootstrap example. It’s built with default Bootstrap components and utilities with little customization.</p>
	</div>
	
	<div class="container">
	  
      <div class="row">
	      
      </div>
      <div class="row">
      	<div class="col-6">
      		<img src="/user/product/displayFile?folderName=${productVO.prdc_img_folder}&fileName=${productVO.prdc_img}"
                 alt="" class="bd-placeholder-img card-img-top" width="100%" height="225" onerror="this.onerror=null; this.src='/image/no_image.png'">
      	</div>
      	<div class="col-6">
      		<h5>${productVO.prdc_nm}</h5>
      		<p>판매가격: <fmt:formatNumber type="number" maxFractionDigits="3" value="${productVO.prdc_prc}"></fmt:formatNumber></p>
      		<p>
      			<input type="hidden" id="prdc_num" value="${productVO.prdc_num}">
      			수량: <input type="number" class="form-control w-25" id="prdc_amt" min="1" value="1">
      		</p>
		  	<button type="button" id="btnOrder" class="btn btn-primary">구매하기</button>
			<button type="button" id="btnCart" class="btn btn-primary">장바구니</button>
      	</div>
      </div>
	        
      <div class="rows">
      	<div class="col-12">
      		<div id="productDetailTab">
			  <ul>
			    <li><a href="#productDetailInfo">상세정보</a></li>
			    <li><a href="#productDetailReview">상품리뷰</a></li>
			  </ul>
			  <div id="productDetailInfo">
			    <p>${productVO.prdc_dtl}</p>
			  </div>
			  <div id="productDetailReview">
			    <div class="row">
			    	<div class="col-6">REVIEW</div>
			    	<div class="col-6">
			    		<button type="button" id="btnReview" class="btn btn-info">상품리뷰 쓰기</button>
			    	</div>
			    </div>
				
				<!-- 상품후기 출력위치 -->
				<div id="reviewListResult">
					
				</div>

				<!-- 상품후기 페이징 출력위치 -->
				<div>
					<nav aria-label="Page navigation example">
						<ul class="pagination" id="reviewPagingResult">

						</ul>
					</nav>
				</div>
			  </div>
			</div>
      	</div>
      </div>
	        
      <!--  footer.jsp -->
	  <%@include file="/WEB-INF/views/include/footer.jsp" %>
	  
    </div>
   	
   	<!-- Modal 대화상자 : 상품 상세보기  -->   

	<script>

		$(function(){

			// jquery-ui tab작업
			$("#productDetailTab").tabs();
			
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
			
			// 장바구니 담기
			$("#btnCart").on("click", function(){
				
				$.ajax({
					url: '/user/cart/cart_add',
					data: {prdc_num : $("input#prdc_num").val() , cart_amt: $("input#prdc_amt").val()},
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
			$("#btnOrder").on("click", function(){

				let prdc_num = $("#prdc_num").val();	// 구매상품코드
				let odr_amt = $("#prdc_amt").val();	// 구매수량

				let url = "/user/order/orderListInfo?prdc_num="+prdc_num+"&odr_amt="+odr_amt+"&type=direct";
				// console.log("직접구매 주소: " + url);
				location.href = url;

			});

			// actionForm 참조 : 1.페이지번호 클릭. 2.검색버튼 클릭
			let actionForm = $("#actionForm");
			
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
		    	actionForm.attr("action", "상품상세주소");
		    	
		    	actionForm.append("<input type='hidden' name='prdc_num' value='" + prdc_num + "'>");
		    	//actionForm.submit();
		    });
		    
			// 상품후기 팝업대화상자
			$("div#productDetailReview button#btnReview").on("click", function(){

				$("#reviewModal").modal('show');

			});

			// 상품후기 수정 팝업대화상자
			$("div#reviewListResult").on("click", "p a.modify", function(e){

				e.preventDefault();

				$("button#btnReview").hide();		// 쓰기, 수정, 삭제 버튼 3개 보이지 않음.
				$("button#btnReviewModify").show();	// 수정 버튼 보이게 함.

				// 수정내용 표시.
				let rvw_num = $(this).attr("href");	// 상품후기코드
				// 상품후기내용
				// $("div#reviewListResult p span.rvw_content").text();
				let rvw_content = $(this).parents("div.list-group").find("p span.rvw_content").text();

				$("textarea#rvw_content").val(rvw_content);
				$("input#rvw_num").val(rvw_num);

				// 2.별평점표시
				let rvw_score = $(this).parents("div.list-group").find("p input[name='rvw_score']").val();

				// each메소드는 선택자의 태그 수 만큼 반복된다.
				// 별 a태그 5개
				$("#star_rvw_score a").each(function(index, item){

					if(index < rvw_score) {
						$(item).addClass('on');
					}else{
						$(item).removeClass('on');
					}
				});

				$("#reviewModal").modal('show');

			});

			//상품후기 목록에서 delete 버튼 클릭
		    $("div#reviewListResult").on("click", "p a.delete", function(e){
		
		      e.preventDefault();
		
		      let rvw_num = $(this).attr("href"); // 상품후기번호
		
		      console.log("상품후기 번호: " + rvw_num);
		
		      if(!confirm('상품후기' + rvw_num + ' 번을 삭제하시겠습니까?')) return;
		    
		
		      $.ajax({
		        url: '/user/review/delete/' + rvw_num, // 주소를 경로형식을 사용한다.
		        headers: {
		            "Content-Type" : "application/json", "X-HTTP-Method-Override" : "DELETE"
		          },
		        type: 'delete',
		        dataType: 'text',
		        success : function(result) {
		          if(result == "success") {
		            alert("상품후기가 삭제됨.");
		            
		            //상품후기 목록
		            url = "/user/review/list/" + $("#prdc_num").val() + "/" + reviewPage;
		
		            getPage(url);
		
		          }
		        }
		      });
		
		    });
			
			// 평점 별 클릭 시 색상변경
			$("#star_rvw_score a.rvw_score").on("click", function(e){

				e.preventDefault();

				$(this).parent().children().removeClass("on");	// 별평점 <a>태그에 on 클래스 선택자를 제거
				$(this).addClass("on").prevAll("a").addClass("on");

			});

			// 상품후기쓰기 버튼 클릭
			$("#btnReviewWrite").on("click", function(){

				let rvw_score = 0;
				let rvw_content = $("#rvw_content").val();
				let prdc_num = $("#prdc_num").val();

				// $("#star_rvw_score a.rvw_score") 선택자가 5개로 each는 5번 반복이 일어난다.
				$("#star_rvw_score a.rvw_score").each(function(index, item){

					if($(this).attr('class') == 'rvw_score on') {
						rvw_score += 1;
					}

				});

				console.log("별 평점: " + rvw_score);

				if(rvw_score == 0) {
					alert("별 평점을 선택해주세요.");
					return;
				}
				
				if(rvw_content == "") {
					alert("상품후기를 입력하세요.");
					return;
				}
				
				// 자바스크립트 Object객체 구문
				let data = { prdc_num : prdc_num, rvw_content : rvw_content, rvw_score : rvw_score };
				
				$.ajax({
					url: '/user/review/new',
					// 컨트롤러에서 전송데이터 포맷이 json으로 설정되어 있으므로, 클라이언트에서 보내는 데이터의 MIME설정을 헤더에 추가해야 한다.
					headers: { "Content-Type" : "application/json", "X-HTTP-Method-Override" : "POST" },
					type: 'post',
					dataType: 'text',
					data: JSON.stringify(data),	/* JSON 문자열 변환 */
					success: function(result){
						if(result == "success") {
							alert("상품후기가 등록됨.");
							
							// 상품후기 목록
							reviewPage = 1;
							/* "/user/review/list/상품코드/첫번째 페이지" < 와 같은 주소를 예상하여 만듬. */
							url = "/user/review/list/" + $("#prdc_num").val() + "/" + reviewPage;

							getPage(url);

							// 상품후기 대화상자 숨김.
							$("#reviewModal").modal('hide');
							$("#star_rvw_score a.rvw_score").parent().children().removeClass("on");
							$("#rvw_content").val("");
						}
					}
				});
			});

			// 상품후기 수정버튼 클릭
			$("#btnReviewModify").on("click", function(){

				let rvw_num = $("#rvw_num").val();
				let rvw_score = 0;
				let rvw_content = $("#rvw_content").val();

				// $("#star_rvw_score a.rvw_score") 선택자가 5개로 each는 5번 반복이 일어난다.
				$("#star_rvw_score a.rvw_score").each(function(index, item){

					if($(this).attr('class') == 'rvw_score on') {
						rvw_score += 1;
					}

				});

				console.log("별 평점: " + rvw_score);

				if(rvw_score == 0) {
					alert("별 평점을 선택해주세요.");
					return;
				}

				if(rvw_content == "") {
					alert("상품후기를 입력하세요.");
					return;
				}

				// 자바스크립트 Object객체 구문
				let data = { rvw_num : rvw_num, rvw_content : rvw_content, rvw_score : rvw_score };

				$.ajax({
					url: '/user/review/modify',
					// 컨트롤러에서 전송데이터 포맷이 json으로 설정되어 있으므로, 클라이언트에서 보내는 데이터의 MIME설정을 헤더에 추가해야 한다.
					headers: { "Content-Type" : "application/json", "X-HTTP-Method-Override" : "PATCH" },
					type: 'patch',
					dataType: 'text',
					data: JSON.stringify(data),	/* JSON 문자열 변환 */
					success: function(result){
						if(result == "success") {
							alert("상품후기가 수정됨.");
							
							// 상품후기 목록
							//reviewPage = 1;
							// "/user/review/list/상품코드/첫번째 페이지" < 와 같은 주소를 예상하여 만듬.
							url = "/user/review/list/" + $("#prdc_num").val() + "/" + reviewPage;

							getPage(url);

							// 상품후기 대화상자 숨김.
							$("#reviewModal").modal('hide');
							$("#star_rvw_score a.rvw_score").parent().children().removeClass("on");
							$("#rvw_content").val("");
						}
					}
				});
			});

		});	// jquery ready 이벤트 끝

		let reviewPage = 1;
		let url = "/user/review/list/" + ${productVO.prdc_num} + "/" + reviewPage;

		console.log("상품후기요청주소: " + url);

		getPage(url);
		
		function getPage(pageInfo) {

			$.getJSON(pageInfo, function(data){
				// console.log("목록: " + data.list[0].rvw_num);
				// console.log("페이지정보: " + data.pageMaker.startPage);

				if(data.list.length > 0) {

					// 함수 : 상품후기목록
					printReviewList(data.list, $("#reviewListResult"), $("#reviewTemplate"));

					// 함수 : 페이징기능
					printReviewPaging(data.pageMaker, $("#reviewPagingResult"));
				}
			});
		}

		// 상품후기 출력하는 함수
		let printReviewList = function(reviewArrData, target, templateObj) {

			// 핸들바 코드가 존재하는 상품후기 디자인코드를 컴파일 함.
			let template = Handlebars.compile(templateObj.html());

			let html = template(reviewArrData);	// 상품후기목록 데이터 + 상품후기 url템블릿 결합된 결과소스

			target.children().remove();
			target.append(html);
		}

		// 상품후기 등록일 : 사용자정의 Helper함수. 템플릿에서 사용함.
		Handlebars.registerHelper("prettifyDate", function(timeValue) {
			
			let dateObj = new Date(timeValue);
			let year = dateObj.getFullYear();
			let month = dateObj.getMonth() + 1;
			let date = dateObj.getDate();
			let hour = dateObj.getHours();
			let minute = dateObj.getMinutes();

			return year + "/" + month + "/" + date + " " + hour + ":" + minute;
		});

		// 평점 표시하기
		Handlebars.registerHelper("displayStar", function(rating){

			let stars = "";
			switch(rating) {
				case 1:
					stars = "★☆☆☆☆";
					break;
				case 2:
					stars = "★★☆☆☆";
					break;
				case 3:
					stars = "★★★☆☆";
					break;
				case 4:
					stars = "★★★★☆";
					break;
				case 5:
					stars = "★★★★★";
					break;
			}

			return stars;
		});

		// 아이디 4글자만 보여주기
		Handlebars.registerHelper("idfourdisplay", function(userid){

			return userid.substring(0, 4) + "*****";
		});

		// 로그인 사용자와 댓글작성자가 일치할 경우 수정, 삭제버튼 표시
		Handlebars.registerHelper("modifyview", function(review_mb_id, rvw_num){

			let result = "";
			let login_mb_id = "${sessionScope.loginStatus.mb_id}";
			if(review_mb_id == login_mb_id) {
				result = "<a class='modify' href='" + rvw_num + "'>[Modify]</a>";
			}

			return new Handlebars.SafeString(result);
		});

		Handlebars.registerHelper("deleteview", function(review_mb_id, rvw_num){

			let result = "";
			let login_mb_id = "${sessionScope.loginStatus.mb_id}";
			if(review_mb_id == login_mb_id) {
				result = "<a class='delete' href='" + rvw_num + "'>[Delete]</a>";
			}

			return new Handlebars.SafeString(result);
		});

		// 상품후기 페이징 함수
		let printReviewPaging = function(pageMaker, target) {
			
			let pagingStr = "";

			// 이전표시
			if(pageMaker.prev) {
				pagingStr += "<li class='page-item'><a class='page-link' href='" + (pageMaker.startPage -1) + "'> << </a></li>";
			}

			// 페이지번호 표시
			for(let i=pageMaker.startPage; i<= pageMaker.endPage; i++) {
				let classStr = pageMaker.cri.pageNum == i ? "active'" : "";
				pagingStr += "<li class='page-item'" + classStr + "'><a class='page-link' href='" + i + "'>" + i + "</a></li>";
			}

			// 다음표시
			if(pageMaker.next) {
				pagingStr += "<li class='page-item'><a class='page-link' href='" + (pageMaker.endPage -1) + "'> >> </a></li>";
			}

			//console.log("페이지문자열: " + pagingStr);
			target.children().remove();
			target.append(pagingStr);
		}

		// 이전, 페이지번호, 다음클릭
		$("nav ul#reviewPagingResult").on("click", "li a.page-link", function(e){
			e.preventDefault();
			console.log("페이지번호 클릭");

			// 상품후기 목록
			reviewPage = $(this).attr("href");
			// "/user/review/list/상품코드/첫번째 페이지"
			url = "/user/review/list/" + $("#prdc_num").val() + "/" + reviewPage;

			getPage(url);

		});

	</script>

	<!-- 상품후기 Modal Dialog -->
	<div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">상품후기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form>
	          <div class="form-group">
	            <label for="recipient-name" class="col-form-label">상품평점:</label>
	            <p id="star_rvw_score">
	            	<a class="rvw_score" href="#">★</a>
	            	<a class="rvw_score" href="#">★</a>
	            	<a class="rvw_score" href="#">★</a>
	            	<a class="rvw_score" href="#">★</a>
	            	<a class="rvw_score" href="#">★</a>
	            </p>
	          </div>
	          <div class="form-group">
	            <label for="rvw_content" class="col-form-label">리뷰내용:</label>
	            <textarea class="form-control" id="rvw_content"></textarea>
				<input type="hidden" name="rvw_num" id="rvw_num">
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" id="btnReviewWrite" class="btn btn-primary btnReview">상품리뷰 쓰기</button>
			<button type="button" id="btnReviewModify" class="btn btn-primary btnReview">상품리뷰 수정</button>
			<button type="button" id="btnReviewDelete" class="btn btn-primary btnReview">상품리뷰 삭제</button>
	      </div>
	    </div>
	  </div>
	</div>

  </body>
</html>
    