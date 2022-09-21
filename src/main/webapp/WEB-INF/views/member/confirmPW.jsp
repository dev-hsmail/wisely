<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

    
    <!-- Custom styles for this template -->
    <link href="pricing.css" rel="stylesheet">
    
    <script>
    	
    	if ('${msg}' == "noPW") {
			alert("비밀번호를 확인하세요.");
		}
    
    </script>
    
  </head>
  <body>
    
<%@include file="/WEB-INF/views/include/header.jsp" %>

<div class="container">
  <h3>비밀번호 재확인</h3>
  <div class="mb-3 text-center">
  <!-- /member/join 절대주소. -->
  <!-- 		   join 상대주소. -->
	  <form id="confirmPWForm" action="confirmPW" method="post">
		  <div class="form-group row">
		    <label for="mb_id" class="col-sm-2 col-form-label">이메일</label>
		    <div class="col-sm-5">
		      <input type="text" class="form-control" id="mb_eml" name="mb_eml" value="${sessionScope.loginStatus.mb_eml}" readonly>
		    </div>		    
		  </div>
		  <div class="form-group row">
		    <label for="mb_pw" class="col-sm-2 col-form-label">비밀번호</label>
		    <div class="col-sm-5">
		      <input type="password" class="form-control" id="mb_pw" name="mb_pw" placeholder="비밀번호를 8~15자 이내로 입력">
		    </div>
		  </div>
		  <div class="form-group row">
			<div class="col-sm-9 text-center">
			  <button type="submit" class="btn btn-dark" id="btnconfirmPW">확인</button>
			  <button type="button" class="btn btn-dark" id="btnCancel">취소</button>
			</div>
		  </div>
	 </form>
  </div>


  <!--  footer.jsp -->
  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<%@include file="/WEB-INF/views/include/common.jsp" %>

	<!-- <script type="text/javascript" src="/js/member/join.js"></script> -->
	
	<script>

		/* 로그인 */
		// html문서와 내용을 브라우저가 읽고 난 이후에 동작되는 특징
		$(document).ready(function(){

			let confirmPWForm = $("#confirmPWForm");

			// 로그인 정보전송	<button type="submit" id="btnJoin"></button> 클릭하면, 전송이벤트가 동작된다. <form>태그의 이벤트 설정으로
			$("#confirmPWForm").on("submit", function(){
				
				// 유효성 검사작업 해야 함.
				if($("#mb_pw").val() == "") {
					alert("비밀번호를 입력하세요");
					$("#mb_pw").focus();
					return false;
				}
				return true;
			});

		});
	</script>
  </body>
</html>
    