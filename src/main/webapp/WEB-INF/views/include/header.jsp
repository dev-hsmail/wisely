<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="d-flex flex-column flex-md-row align-items-center bg-white border-bottom shadow-sm">
  <h5 class="my-0 mr-md-auto font-weight-normal"></h5>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="/">W I S E L Y</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <ul class="navbar-nav mr-auto">
      	
      	
        <c:forEach items="${mainCategoryList}" var="categoryVO">
	      <li class="nav-item dropdown">
	      	<!-- 1차 카테고리 메뉴 -->
	        <a class="nav-link dropdown-toggle" href="${categoryVO.ctgr_cd}" role="button" data-toggle="dropdown" aria-expanded="false">
	          ${categoryVO.ctgr_nm}
	        </a>
	        
	        <!-- 2차 카테고리 메뉴 -->
	        <div class="dropdown-menu subCategory">
	          
	        </div>
	      </li>
      	</c:forEach>
        
        <li class="nav-item">
          <a class="nav-link" href="#">브랜드 스토리</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">블로그</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">고객센터</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/adLogin">관리자</a>
        </li>
        <c:if test="${sessionScope.loginStatus == null}">
	        <li class="nav-item">
	          <a class="nav-link" href="/member/login">로그인</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/member/join">회원가입</a>
	        </li>        
        </c:if>
        <c:if test="${sessionScope.loginStatus != null}">
	        <li class="nav-item">
	          <a class="nav-link" href="/member/confirmPW">수정하기</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="/member/logout">
	          	[${sessionScope.loginStatus.mb_eml}]로그아웃
	          </a>
	        </li>
        </c:if>
        <li class="nav-item">
			<a class="nav-link" href="#">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-cart3" viewBox="0 0 16 16">
					<path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
				</svg>
			</a>
        </li>
      </ul>
    </div>
  </nav>
</div>

<script>

  // $(document).ready(function(){}); 문법과 동일함.
  $(function(){

    // 1차 카테고리 클릭
    $("ul.navbar-nav li.nav-item a").on("click", function(){
      
      // ajax작업 구문 사용 시 이전에 필요한 선택자의 정보를 변수에 미리 저장해서 사용해야 한다.
      let selectedCategory = $(this);
      let url = "/user/product/subCategoryList/" + $(this).attr("href");

	    console.log("2차 카테고리: " + url);
      

      // result : 2차 카테고리 정보
      $.getJSON(url, function(result){

        // 2차 카테고리 추가작업.

        let subCategoryList = selectedCategory.next();
        subCategoryList.children().remove();  // <div>태그 안의 <a>태그 모두 제거

        let subCategoryStr = "";
        for (let i = 0; i < result.length; i++) {
        	
        	// 직접 주소작업
        	//subCategoryStr = "<a class='dropdown-item' href='/product/productList/" + result[i].ctgr_cd + "'>" + result[i].ctgr_nm + "</a>";
        	
        	// jQuery문법을 사용하여, 이벤트 적용을 통한 주소요청작업.
        	subCategoryStr += "<a class='dropdown-item' href='" + result[i].ctgr_cd + "'>" + result[i].ctgr_nm + "</a>";
		    }
        
        subCategoryList.append(subCategoryStr);
        
      });

    });

    // 2차 카테고리 클릭.
    $("ul.navbar-nav li.nav-item div.subCategory").on("click", "a", function(e){
      e.preventDefault(); //  기존 2차카테고리 a태그 링크속성을 제거해줌. <a href=""></a>, <input type="submit">. 링크와 전송기능을 제거

      let ctgr_cd = $(this).attr("href");
      let ctgr_nm = $(this).html();
      // get방식으로 특수문자 데이터가 서버로 보내질 때 문제되는 경우 : 인코딩할 것. MDN 인코딩 검색
      location.href = "/user/product/productList/" + ctgr_cd + "/" + ctgr_nm;
      
    });
    
  });

</script>