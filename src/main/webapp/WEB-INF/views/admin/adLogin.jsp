<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/adLogin.css">

</head>
<body>
	<div class="main">
		<div class="container">	
			<div style="text-align:center;">
				<div class="middle">
					<div id="login">
						<div class="logo">Admin
							<div class="clearfix"></div>
						</div>
						<form id="adLoginForm" action="/admin/adminOk" method="post">
							<fieldset class="clearfix">
								<p>
									<span class="fa fa-user"></span>
									<input type="text" id="adm_id" name="adm_id" Placeholder="Username" required>
								</p>
								<!-- JS because of IE support; better: placeholder="Username" -->
								<p>
									<span class="fa fa-lock"></span>
									<input type="password" id="adm_pw" name="adm_pw" Placeholder="Password" required>
								</p>
								<!-- JS because of IE support; better: placeholder="Password" -->
								<div>
									<span style="width: 48%; text-align: left; display: inline-block;">
										<a class="small-text" href="#">Forgot password?</a>
									</span>
									<span style="width: 50%; text-align: right; display: inline-block;">
										<input type="submit" value="Sign In" id="btnAdLogin">
									</span>
								</div>
								<div>
									<span style="width: 100%; text-align: center; display: block; margin-top: 10px;">
										<a href="/" style="background-color: black; padding:5px 10px; border-radius: 3px;">HOME</a>
									</span>
								</div>
							</fieldset>
						</form>
					</div>
				</div> <!-- middle -->
			</div>
		</div> <!-- container -->
	</div>
	<script>
	
		/*
		$(document).ready(function(){
			let adLoginForm = $("#adLoginForm");
			
			$("#adLoginForm").on("submit", function(){
				alert("로그인 성공");
			});
			
			return true;
		});
		*/
		
	</script>
</body>
</html>