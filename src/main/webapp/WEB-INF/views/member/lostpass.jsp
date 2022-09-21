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
    <title>와이즐리 :: 정직한 가격의 프리미엄 생활용품</title>

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
		
		if('${msg}' == 'noEML') {
			alert("내용과 일치하는 회원정보가 없습니다.");
		}
	
	</script>
  </head>
  <body>
    
<%@include file="/WEB-INF/views/include/header.jsp" %>

<div class="container">
  <h3 style="margin: 100px 0 40px;"><span>아이디/비밀번호 찾기</span></h3>
  <div class="mb-3 text-center row">
	 <!-- 이메일 찾기 -->
	 <div class="col-sm-6">
	 	<h5>이메일 찾기</h5>
	 	<form id="searchForm" action="searchEML" method="post">
		  <div class="form-group row">
		    <label for="mb_brh" class="col-sm-4 col-form-label">생년월일</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="mb_brh" name="mb_brh" placeholder="생년월일">
		    </div>
		  </div>
		  <div class="form-group row">
		    <label for="mb_pn" class="col-sm-4 col-form-label">핸드폰 번호</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="mb_pn" name="mb_pn" placeholder="핸드폰 번호">
		    </div>
		  </div>
		  <div class="form-group row">
			  <div class="col-sm-12 text-center">
			  	<button type="submit" class="btn btn-dark" id="btnLogin">이메일 찾기</button>
			  	<button type="button" class="btn btn-dark" id="btnSearchIDPW">로그인</button>
			  </div>			
		  </div>
	 	</form>
	 </div>
	 <!-- 임시비밀번호 발급 -->
	 <div class="col-sm-6">
	 	<h5>임시비밀번호 발급</h5>
	 	<form id="loginForm" action="searchImsiPW" method="post">
		  <div class="form-group row">
		    <label for="mb_eml" class="col-sm-4 col-form-label">전자우편</label>
		    <div class="col-sm-8">
		      <input type="text" class="form-control" id="mb_eml" name="mb_eml" placeholder="E-MAIL">
		    </div>
		  </div>
		  <div class="form-group row">
			  <div class="col-sm-12 text-center">
			  	<button type="submit" class="btn btn-dark" id="btnLogin">임시 비밀번호 발급</button>
			  	<button type="button" class="btn btn-dark" id="btnSearchIDPW">로그인</button>
			  </div>			
		  </div>
	 	</form>
	 </div>
  </div>


  <!--  footer.jsp -->
  <%@include file="/WEB-INF/views/include/footer.jsp" %>
</div>

<%@include file="/WEB-INF/views/include/common.jsp" %>
   
   <!--<script type="text/javascript" src="/js/member/join.js"></script>-->

	<script>

		/* 로그인 */
	//html문서와 내용을 브라우저가 읽고 난 이후에 동작되는 특징
	$(document).ready(function(){

		

		//메일 인증코드 요청
		$("#btnAuthcode").on("click", function(){

			if($("#mb_eml").val() == "") {
				alert("메일주소를 입력하세요.");
				return;
			}

			$.ajax({
				url : '/email/send',
				type : 'get',
				dataType : 'text',
				data : {receiveMail : $("#mb_eml").val()},
				success : function(result) {
					if(result == "success"){
						alert("메일이 발송되어, 인증코드를 확인바랍니다.");
					}else{
						alert("메일발송이 실패되어, 메일주소 확인 또는 관리자에게 문의바랍니다.");
					}
				}
			});
		});

	});


	</script>

  </body>
</html>
    