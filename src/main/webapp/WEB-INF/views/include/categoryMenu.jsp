<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/">WISELY</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    <!-- 
    
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      
      	-->
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
      <!--
      
      <li class="nav-item">
        <a class="nav-link disabled">Disabled</a>
      </li>
      
      -->
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<%-- 
<nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
  	<c:forEach items="${mainCategoryList}" var="categoryVO">
  		<button class="nav-link" id="nav-home-tab" onclick="location.href='${categoryVO.ctgr_cd}'" data-toggle="tab" data-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">
			${categoryVO.ctgr_nm}
  		</button>
  	</c:forEach>
  </div>
</nav>
--%>
 
<%-- <div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">${categoryVO.ctgr_cd} 123</div>
  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">${categoryVO.ctgr_cd} 233</div>
  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">${categoryVO.ctgr_cd} 344</div>
</div> --%>


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