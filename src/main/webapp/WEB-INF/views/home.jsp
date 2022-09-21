<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page session="false" %> --%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>와이즐리 :: 정직한 가격의 프리미엄 생활용품</title>

	<link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/carousel/">
	<!-- Custom styles for this template -->
	<link href="/resources/css/carousel.css" rel="stylesheet">

    <!-- common.jsp -->
    <%@include file="/WEB-INF/views/include/common.jsp" %>  

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

	<script>
    	if ('${msg}' == 'logout') {
			alert("로그아웃 됨.");
		}
    </script>

  </head>
  <body>

	<main role="main">
	
	  <!-- header.jsp -->
	  <%@include file="/WEB-INF/views/include/header.jsp" %>
	
	  <div id="myCarousel" class="carousel slide" data-ride="carousel">
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>
	      <li data-target="#myCarousel" data-slide-to="3"></li>
	    </ol>
	    <div class="carousel-inner">
	      <div class="carousel-item active">
	      	<div class="container">
		      	<a href="#">
		      		<img alt="main_0_pc" src="/resources/img/main/slide/main_0_pc.png">
		      	</a>      	
	      	</div>
	      </div>
	      <div class="carousel-item">
	      	<div class="container">
		      	<a href="#">
		      		<img alt="main_1_pc" src="/resources/img/main/slide/main_1_pc.png">
		      	</a>      	
	      	</div>
	      </div>
	      <div class="carousel-item">
	      	<div class="container">
		      	<a href="#">
		      		<img alt="main_2_pc" src="/resources/img/main/slide/main_2_pc.png">
		      	</a>      	
	      	</div>
	      </div>
	      <div class="carousel-item">
	      	<div class="container">
		      	<a href="#">
		      		<img alt="main_3_pc" src="/resources/img/main/slide/main_3_pc.png">
		      	</a>      	
	      	</div>
	      </div>
	    </div>
	    <button class="carousel-control-prev" type="button" data-target="#myCarousel" data-slide="prev">
	      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	      <span class="sr-only">Previous</span>
	    </button>
	    <button class="carousel-control-next" type="button" data-target="#myCarousel" data-slide="next">
	      <span class="carousel-control-next-icon" aria-hidden="true"></span>
	      <span class="sr-only">Next</span>
	    </button>
	  </div>
	
	
	  <!-- Marketing messaging and featurettes
	  ================================================== -->
	  <!-- Wrap the rest of the page in another container to center all the content. -->
	
	  <div class="container marketing">
	
	    <!-- START THE FEATURETTES -->
	
	    <div class="row featurette">
	      <div class="col-md-6">
	        <h2 class="featurette-heading">W I S E L Y<span class="text-muted">〉</span></h2>
	        <p class="lead">독일/미국산 5중 면도날과<br>프리미엄 면도 용품</p>
	      </div>
	      <div class="col-md-6">
	        <img alt="home-wisely" src="/img/main/contents/home-wisely.png" width=500 height=auto>
	      </div>
	    </div>
	
		<!-- Three columns of text below the carousel -->
	    <div class="row row-mg-top">
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/ws/ws-blade-pro-main.png" width=auto height=200>
				<h5>면도기 스타터세트</h5>
				<p>4,900원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	      
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/ws/ws-startset-navy-pro-main.png" width=auto height=200>
				<h5>리필면도날 4개입</h5>
				<p>5,900원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	      
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/ws/ws-blade-pro-main.png" width=auto height=200>
				<h5>쉐이빙젤 150mL</h5>
				<p>2,900원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	    </div><!-- /.row -->
	
	    <hr class="featurette-divider">
	
	    <div class="row featurette">
	      <div class="col-md-6">
	        <h2 class="featurette-heading">OPENWORK<span class="text-muted">〉</span></h2>
	        <p class="lead">과학적으로 검증된 유효성분,<br>정직한 스킨케어</p>
	      </div>
	      <div class="col-md-6">
	        <img alt="home-wisely" src="/img/main/contents/home-openwork.png" width=500 height=auto>
	      </div>
	    </div>
	    
	    <!-- Three columns of text below the carousel -->
	    <div class="row row-mg-top">
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/ow/ow-booster-porecontrol-main.png" width=auto height=200>
				<h5>피부 개선 부스터 세럼 80mL</h5>
				<p>5,900원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	      
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/ow/ow-lotion-oily-main.png" width=auto height=200>
				<h5>로션 100mL</h5>
				<p>5,900원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	      
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/ow/ow-booster-porecontrol-main.png" width=auto height=200>
				<h5>클렌징폼 180mL</h5>
				<p>4,900원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	    </div><!-- /.row -->
	    
	    <hr class="featurette-divider">
	
	    <div class="row featurette">
	      <div class="col-md-6">
	        <h2 class="featurette-heading">HEADWORKS<span class="text-muted">〉</span></h2>
	        <p class="lead">고민을 해결하는<br>성분주의 두피케어</p>
	      </div>
	      <div class="col-md-6">
	        <img alt="home-wisely" src="/img/main/contents/home-headworks.png" width=500 height=auto>
	      </div>
	    </div>
	    
	    <!-- Three columns of text below the carousel -->
	    <div class="row row-mg-top">
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/hw/hw-booster-hairloss-progressive-main.png" width=auto height=200>
				<h5>탈모 케어 카페인 샴푸 500mL</h5>
				<p>5,900원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	      
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/hw/hw-shampoo-hairloss-main.png" width=auto height=200>
				<h5>탈모 고민용 부스터 100mL</h5>
				<p>4,900원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	      
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/hw/hw-booster-hairloss-progressive-main.png" width=auto height=200>
				<h5>두피 건강 개선 샴푸 500mL</h5>
				<p>5,900원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	    </div><!-- /.row -->
	    
	    <hr class="featurette-divider">
	
	    <div class="row featurette">
	      <div class="col-md-6">
	        <h2 class="featurette-heading">Habitual<span class="text-muted">〉</span></h2>
	        <p class="lead">다른 곳에서 찾아볼 수 없는<br>높은 함량과 질 좋은 원료</p>
	      </div>
	      <div class="col-md-6">
	        <img alt="home-wisely" src="/img/main/contents/home-habitual.png" width=500 height=auto>
	      </div>
	    </div>
	    
	    <!-- Three columns of text below the carousel -->
	    <div class="row row-mg-top">
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/hb/hb-calcium-main.png" width=auto height=200>
				<h5>활력충전 멀티비타민</h5>
				<p>5,800원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	      
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/hb/hb-omega3-main.png" width=auto height=200>
				<h5>혈행·눈 건강·기억력 오메가3</h5>
				<p>9,800원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	      
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/hb/hb-calcium-main.png" width=auto height=200>
				<h5>뼈·신경·근육엔 칼슘마그네슘</h5>
				<p>4,800원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	    </div><!-- /.row -->
	    
	    <hr class="featurette-divider">
	
	    <div class="row featurette">
	      <div class="col-md-6">
	        <h2 class="featurette-heading">Plover<span class="text-muted">〉</span></h2>
	        <p class="lead">기능성 칫솔과 자연유래 치약으로<br>더 건강한 덴탈케어</p>
	      </div>
	      <div class="col-md-6">
	        <img alt="home-wisely" src="/img/main/contents/home-plover.png" width=500 height=auto>
	      </div>
	    </div>
	    
	    <!-- Three columns of text below the carousel -->
	    <div class="row row-mg-top">
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/pl/pl-toothpaste-main.png" width=auto height=200>
				<h5>자연유래 성분 치약</h5>
				<p>1,900원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	      
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/pl/pl-toothbrush-plaque-4ea-mix-main.png" width=auto height=200>
				<h5>치석케어 칫솔 4개입</h5>
				<p>4,900원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	      
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/pl/pl-toothpaste-main.png" width=auto height=200>
				<h5>잇몸케어 칫솔 4개입</h5>
				<p>4,900원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	    </div><!-- /.row -->
	    
	    <hr class="featurette-divider">
	
	    <div class="row featurette">
	      <div class="col-md-6">
	        <h2 class="featurette-heading">felt<span class="text-muted">〉</span></h2>
	        <p class="lead">건강한 성분, 피부가 바로 느끼는<br>놀라운 사용감의 바디케어</p>
	      </div>
	      <div class="col-md-6">
	        <img alt="home-wisely" src="/img/main/contents/home-felt.png" width=500 height=auto>
	      </div>
	    </div>
	    
	    <!-- Three columns of text below the carousel -->
	    <div class="row row-mg-top">
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/ft/ft-bodylotion-fresh-main.png" width=auto height=200>
				<h5>프레쉬 바디워서 500mL</h5>
				<p>4,900원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	      
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/ft/ft-handwahs-fresh-main.png" width=auto height=200>
				<h5>모이스트 바디워시 500mL</h5>
				<p>4,900원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	      
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/ft/ft-bodylotion-fresh-main.png" width=auto height=200>
				<h5>프레쉬 바디로션 500mL</h5>
				<p>5,900원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	    </div><!-- /.row -->
	    
	    <hr class="featurette-divider">
	
	    <div class="row featurette">
	      <div class="col-md-6">
	        <h2 class="featurette-heading">Rizn.<span class="text-muted">〉</span></h2>
	        <p class="lead">화학흡수물질을 전혀 사용하지 않은<br>날개까지 유기농 순면 생리대</p>
	      </div>
	      <div class="col-md-6">
	        <img alt="home-wisely" src="/img/main/contents/home-rizn.png" width=500 height=auto>
	      </div>
	    </div>
	
		<!-- Three columns of text below the carousel -->
	    <div class="row row-mg-top">
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/rz/rz-sanitarypad-largemedium-main.png" width=auto height=200>
				<h5>유기농 순면 생리대 중형/대형</h5>
				<p>2,300원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	      
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/rz/rz-sanitarypad-largemedium-main.png" width=auto height=200>
				<h5>유기농 순면 생리대 중형/대형</h5>
				<p>2,300원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	      
	      <div class="col-lg-4">
			<a href="#" class="content-list-link">
				<img alt="ws-img-01" src="/img/main/contents/rz/rz-sanitarypad-largemedium-main.png" width=auto height=200>
				<h5>유기농 순면 생리대 중형/대형</h5>
				<p>2,300원</p>		
			</a>
	      </div><!-- /.col-lg-4 -->
	    </div><!-- /.row -->
	
	    <hr class="featurette-divider">
	
	    <!-- /END THE FEATURETTES -->
	
	  </div><!-- /.container -->
	
	
	  <!-- footer.jsp -->
	  <%@include file="/WEB-INF/views/include/footer.jsp" %>
	</main>

    <!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script> -->
    <!-- <script src="../assets/dist/js/bootstrap.bundle.min.js"></script> -->
  
  </body>
</html>
