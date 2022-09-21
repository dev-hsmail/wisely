<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>WISELY | Admin</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  
  <!-- Admin LTE CSS File -->
  <%@include file="/WEB-INF/views/admin/include/plugin1.jsp" %>
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- webapp 가 /(root) 임을 기억 -->
  <!-- Main Header -->
  <%@include file="/WEB-INF/views/admin/include/header.jsp" %>
  
  <!-- Left side column. contains the logo and sidebar -->
  <%@include file="/WEB-INF/views/admin/include/nav.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Page Header
        <small>Optional description</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">

      <div class="row">
      	<div class="col-md-12">	<!-- 부트스트랩 클래스 네임 중  md는 해상도 설정 빼도 무관 -->
      		<div class="box box-primary">
      			<div class="box-header">
      				MODIFY PRODUCT
      			</div>
      			<div class="box-body">
      				<form id="productForm" action="productModify" method="post" enctype="multipart/form-data">
      					<div class="form-group row">
      					
      						<!-- 페이징 및 검색정보 (Criteria클래스의 필드)? 원래상태의 리스트에서 필요한 정보 -->
      						<input type="hidden" name="pageNum" value="${cri.pageNum}">
      						<input type="hidden" name="amount" value="${cri.amount}">
      						<input type="hidden" name="type" value="${cri.type}">
      						<input type="hidden" name="keyword" value="${cri.keyword}">
      						
      						<label for="prdc_nm" class="col-sm-2 col-form-label">카테고리</label>
      						<div class="col-sm-3">
      							<select name="ctgr_cd_prt" id="firstCategory" class="form-control">
      								<option value="">1차 카테고리 선택</option>
      								<c:forEach items="${cateList}" var="categoryVO">
      									<option value="${categoryVO.ctgr_cd}" ${categoryVO.ctgr_cd == productVO.ctgr_cd_prt ? 'selected' : '' }>${categoryVO.ctgr_nm }</option>
      								</c:forEach>
      							</select>
      						</div>
      						<div class="col-sm-3">
      							<select name="ctgr_cd" id="secondCategory" class="form-control">
      								<option>2차 카테고리 선택</option>
      								<c:forEach items="${subCateList}" var="subCategoryVO">
      									<option value="${subCategoryVO.ctgr_cd}" ${subCategoryVO.ctgr_cd == productVO.ctgr_cd ? 'selected' : '' }>${subCategoryVO.ctgr_nm }</option>
      								</c:forEach>
      							</select>
      						</div>
      					</div>
      					
						<div class="form-group row">
							<label for="prdc_nm" class="col-sm-2 col-form-label">상품명</label>
							<div class="col-sm-4">
								<!-- 상품코드 hidden으로 숨겨놓음. -->
								<input type="hidden" id="prdc_num" name="prdc_num" value="${productVO.prdc_num}">
								<input type="text" class="form-control" id="prdc_nm" name="prdc_nm" value="${productVO.prdc_nm}">
							</div>
							<label for="prdc_prc" class="col-sm-2 col-form-label">상품가격</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="prdc_prc" name="prdc_prc" value="${productVO.prdc_prc}">
							</div>
						</div>

						<div class="form-group row">
							<label for="prdc_dsct" class="col-sm-2 col-form-label">할인율</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="prdc_dsct" name="prdc_dsct" value="${productVO.prdc_dsct}">
							</div>
							<label for="prdc_com" class="col-sm-2 col-form-label">제조사</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id=prdc_com name="prdc_com" value="${productVO.prdc_com}">
							</div>
						</div>
						
            <div class="form-group row">
							<label for="prdc_img" class="col-sm-2 col-form-label">상품이미지</label>
							<div class="col-sm-10">	<!-- name="prdc_img" 존재안하면 스프링에서 null이 된다. -->
								<input type="file" class="form-control" id="uploadFile" name="uploadFile">
								
								<!-- 날짜폴더, 상품이미지 파일명 -->
								<input type="hidden" id="prdc_img_folder" name="prdc_img_folder" value="${productVO.prdc_img_folder}">
								<input type="hidden" id="prdc_img" name="prdc_img" value="${productVO.prdc_img}">
							</div>
						</div>

						<!-- 상품이미지 보기 -->
						<div class="form-group row">
							<label for="prdc_img" class="col-sm-2 col-form-label">현재 이미지</label>
							<div class="col-sm-4">
								<img src="/admin/product/displayFile?folderName=${productVO.prdc_img_folder}&fileName=${productVO.prdc_img}" id="cur_img" width=150 height=auto>
							</div>
							<label for="prdc_img" class="col-sm-2 col-form-label">변경 이미지</label>
							<div class="col-sm-4">
								<img id="change_img" width=150 height=auto>
							</div>
						</div>

						<div class="form-group row">
							<label for="prdc_dtl" class="col-sm-2 col-form-label">상품설명</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="prdc_dtl" name="prdc_dtl" rows="3">${productVO.prdc_dtl}</textarea>
							</div>
						</div>
						
						<div class="form-group row">
							<label for="prdc_amt" class="col-sm-2 col-form-label">수량</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" id="prdc_amt" name="prdc_amt" value="${productVO.prdc_amt}">
							</div>
							<label for="prdc_buy" class="col-sm-2 col-form-label">판매여부</label>
							<div class="col-sm-4">
								<select id="prdc_buy" name="prdc_buy">
									<option value="Y" ${productVO.prdc_buy == 'Y' ? 'selected':'' }>판매가능</option>
									<option value="N" ${productVO.prdc_buy == 'N' ? 'selected':'' }>판매불가능</option>
								</select>
							</div>
						</div>
						<div class="box-footer">
		      				<div class="form-group">
		      					<ul class="uploadedList">
		      					</ul>
		      				</div>
		      				<div class="form-group row">
								<div class="col-sm-12 text-center">
									<button type="submit" class="btn btn-dark" id="btnProduct">상품수정</button>
								</div>			
							</div>
		      			</div>
					</form>
      			</div>
      		</div>
      	</div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <%@include file="/WEB-INF/views/admin/include/footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="pull-right-container">
                    <span class="label label-danger pull-right">70%</span>
                  </span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3, Bootstrap 3.3.7, AdminLTE App  -->
<%@include file="/WEB-INF/views/admin/include/plugin2.jsp" %>

<!-- 웹 에디터 적용 스크립트 -->
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script>
  $(document).ready(function(){
	  
	  // ckeditor 환경설정
    var ckeditor_config = {
		resize_enabled : false,
		enterMode : CKEDITOR.ENTER_BR,
		shiftEnterMode : CKEDITOR.ENTER_P,
		toolbarCanCollapse : true,
		removePlugins : "elementspath", 
		filebrowserUploadUrl: '/admin/product/imageUpload' //업로드 탭기능추가 속성
    }

    CKEDITOR.replace("prdc_dtl", ckeditor_config);

    console.log("버전: " + CKEDITOR.version);
    
    // 1차 카테고리 선택
    $("#firstCategory").on("change", function(){

      let firstCategoryCode = $(this).val();

      console.log("1차 카테고리 코드 : " + firstCategoryCode);

      let url = "/admin/product/subCategoryList/" + firstCategoryCode;

      $.getJSON(url, function(subCategoryList){
        /*
        console.log("첫 번째 데이터: " + subCategoryList[0].ctgr_cd);
        console.log("첫 번째 데이터: " + subCategoryList[0].ctgr_cd_prt);
        console.log("첫 번째 데이터: " + subCategoryList[0].ctgr_nm);
        */

        // 2차 카테고리 태그를 참조.
        let optionStr = "";
        let secondCategory = $("#secondCategory");

        secondCategory.find("option").remove();  // 기존 카테고리에 의하여 출력되는 요소를 제거
        secondCategory.append("<option value=''>2차 카테고리 선택</option>");

        for(let i=0; i<subCategoryList.length; i++) {
          optionStr += "<option value='" + subCategoryList[i].ctgr_cd + "'>" + subCategoryList[i].ctgr_nm + "</option>";
        }
        secondCategory.append(optionStr);
      });

    });

  });

  // 이미지 미리보기
  $("#uploadFile").on("change", function(e){

    let file = e.target.files[0];

    /*
      FileReader객체는 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 읽을 파일을 가리키는
      File 혹은 Blob객체를 이용해 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는것을 가능하게 해준다.
    */
    let reader = new FileReader();

    reader.onload = function(e) {
      $("#change_img").attr("src", e.target.result);
    }
    reader.readAsDataURL(file);
  });
  
</script>

<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
</body>
</html>