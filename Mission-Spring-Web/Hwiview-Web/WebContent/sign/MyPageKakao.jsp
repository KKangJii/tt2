<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<!-- For Google -->
<link rel="author" href="https://plus.google.com/+Scoopthemes">
<link rel="publisher" href="https://plus.google.com/+Scoopthemes">
<!-- for Twitter -->
<meta name="twitter:card" content="photo">
<meta name="twitter:site" content="">
<meta name="twitter:title" content="">
<meta name="twitter:description" content="">
<meta name="twitter:image" content="">
<meta name="twitter:url" content="">
<!-- for Facebook OpenGraph -->
<meta property="og:title" content="" />
<meta property="og:type" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:description" content="" />

<!-- Canonical -->
<link rel="canonical" href="">

<title>Full Slider Layout - Scoop Themes Template</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<!-- font Awesome CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<!-- Main Styles CSS -->
<link href="css/main.css" rel="stylesheet">
<link rel="shortcut icon" href="favicon.ico">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/styles.css" title="mainStyle">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="<%=request.getContextPath()%>/js/checkForm.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.form-control{
	display:inline;
	width: 25%;
}
</style>
<script type='text/javascript'>
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('e9ccdda95dc52241c09a850d8d9b9f48');
	function loginWithKakao() {
		// 로그인 창을 띄웁니다.
		Kakao.Auth.login({
			success : function(authObj) {
				alert(JSON.stringify(authObj));
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
	};
	function checkForm() {
		var f = document.lform;
		if (isNull(f.id, '아이디를 입력해주세요')) {
			f.id.focus();
			return false;
		}
		if (isNull(f.password, '비밀번호를 입력해주세요')) {
			f.password.focus();
			return false;
		}
		return true;
	}
	function addFavorite(){
		try{
		window.external.AddFavorite('http://localhost:8000/Hwiview-Web','휘뷰');
		}catch(e){
			alert("현재 사용중인 브라우저에서는 즐겨찾기 기능을 사용할수 없습니다\n"
				+ "크롬에서는 ctrl+d키를 눌러주세요");
		}
		
	}
	
	function selectEvent(selectObj) {
		document.getElementById('email_domain').value = selectObj.value;
		
	}
	jQuery().ready(function() {
		$('#back').click(function(){
			location.href = "/Hwiview-Web/";
		});
		$('#idcheck').click(function(){
			$.ajax({
				url : "sign/confirm.jsp",
				type : "post",
				data : "id=" + $('#signid').val(),
				success : function(data){
					if($.trim(data) == "NO"){
						alert("이미 사용중인 아이디입니다!");
					}else if($('#signid').val() == ""){
						alert("아이디를 입력해주세요");
					}else{
						alert("사용 가능한 아이디입니다!");
					}
				}
			});
		});
	});
	
	function doDelete(){
		if(confirm("정말 삭제하시겠습니까??") == true){
			if(confirm("진짜????") == true){
				if(confirm("진짜삭제합니다????") == true){
					location.href = "<%=request.getContextPath()%>/delete.do";
				}else{
					location.href = "/Hwiview-Web/"
				}
			}else{
				location.href = "/Hwiview-Web/"
			}
		}else{
			location.href = "/Hwiview-Web/"
		}
	}
</script>
</head>

<body>

	<div id="wrapper">

		<div class="nav-wrapper">
			<div class="container">

				<nav class="navbar navbar-default navbar-inverse" role="navigation">
					<div class="container-fluid">
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed"
								data-toggle="collapse"
								data-target="#bs-example-navbar-collapse-1">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<a class="navbar-brand" href="<%=request.getContextPath()%>">Hwi
								View</a>
						</div>

						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse"
							id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li class="active"><a href="<%=request.getContextPath()%>/ProductDetail.do">상세 제품</a></li>
								<li><a href="<%=request.getContextPath()%>/List.do">review</a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown">C/S <span class="caret"></span></a>
									<ul class="dropdown-menu" role="menu">
										<li><a href="<%=request.getContextPath()%>/qnaList.do">Q & A</a></li>
										<li class="divider"></li>
										<li><a href="<%=request.getContextPath()%>/map.do">오시는 길</a></li>
										<li class="divider"></li>
										<li><a href="#">1:1문의(구현중)</a></li>
									</ul></li>
							</ul>
							<ul class="nav navbar-nav navbar-right">
								<li><a href="#" onclick="addFavorite()">BookMark</a></li>
								<c:choose>
									<c:when test="${ empty param.name and empty userVO and empty kakao}">
									
										<li><a href="#" class="dropdown-toggle"
											onclick = "popbutton()">Login</a></li>
										<li><div class="modal fade" id="layerpop">
												<div class="modal-dialog">
													<div class="modal-content">
														<form accept-charset="UTF-8" role="form" method="post"
															name="lform" onsubmit="return checkForm()"
															action="<%=request.getContextPath()%>/login.do">
															<legend>Login</legend>
															<div class="form-group">
																<label for="username-email">이메일 or 아이디</label> <input
																	name="id" id="id" placeholder="E-mail or Username"
																	type="text" class="form-control" />
															</div>
															<div class="form-group">
																<label for="password">비밀번호</label> <input
																	name="password" id="password" placeholder="Password"
																	type="password" class="form-control" />
															</div>
															<div class="form-group">
																<input type="submit"
																	class="btn btn-default btn-login-submit btn-block m-t-md"
																	value="Login" /> 
																	<a id="kakao-login-btn"></a>
															</div>
															<span class='text-center'><a
																href="/bbs/index.php?mid=index&act=dispMemberFindAccount"
																class="text-sm">비밀번호 찾기</a></span>
															<hr />
															<div class="form-group">
																<a href="<%=request.getContextPath()%>/SignUp.do"
																	class="btn btn-default btn-block m-t-md"> 회원가입</a>

															</div>
														</form>
													</div>
												</div>
											</div></li>
									</c:when>
									<c:otherwise>
										<li class="dropdown">
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown">
											<c:if test="${ not empty param.name }">
													[${ param.name }]님
											</c:if>
											<c:if test="${ not empty userVO.id }">
													[${ userVO.id }]님
											</c:if>
											<c:if test="${ not empty kakao }">
												[${ kakao }]님
											</c:if>
										 <span class="caret"></span>
										</a>
											<ul class="dropdown-menu" role="menu">
											<c:choose>
												<c:when test="${ not empty kakao }">
													<li><a href="<%=request.getContextPath()%>/logout.do">로그아웃</a></li>
													<c:if test="${ not empty kakaoVO }">
														<li><a href="<%=request.getContextPath()%>/MyPageKakao.do">회원
														정보</a></li>
												<li><a href="<%=request.getContextPath()%>/BuyList.do?id=${ kakaoVO.id }">구매내역</a></li>
													</c:if>
													<li class="divider"></li>
													<li><a href="#">장바구니</a></li>
												</c:when>
												<c:otherwise>
													<li><a href="<%=request.getContextPath()%>/logout.do">로그아웃</a></li>
												<li><a href="<%=request.getContextPath()%>/MyPage.do">회원
														정보</a></li>
												<li><a href="<%=request.getContextPath()%>/BuyList.do?id=${ userVO.id }">구매내역</a></li>
												<li class="divider"></li>
												<li><a href="#">장바구니</a></li>
												</c:otherwise>
											</c:choose> 
											</ul></li>
											<c:if test="${ empty kakaoVO and empty userVO.id }">
									<li><a href="#" class="dropdown-toggle"
											onclick = "popbutton()">회원 확인</a></li>
										<li><div class="modal fade" id="layerpop">
												<div class="modal-dialog">
													<div class="modal-content">
														<form accept-charset="UTF-8" role="form" method="post"
															name="lform" onsubmit="return checkForm()"
															action="<%=request.getContextPath()%>/SearchkakaoInfo.do">
															<legend>회원 확인</legend>
															<div class="form-group">
																<label for="username-email">아이디</label> <input
																	name="id" id="id" placeholder="Id"
																	type="text" class="form-control" />
															</div>
															<div class="form-group">
																<label for="password">이름</label>
																<input type = "hidden" name = "kakaoName" value = "${ kakao }"/>${ kakao }
															</div>
															<div class="form-group">
																<input type="submit"
																	class="btn btn-default btn-login-submit btn-block m-t-md"
																	value="회원 확인" /> 
															</div>
															<hr />
															<div class="form-group">
																<a href="<%=request.getContextPath()%>/Insertkakao.do"
																	class="btn btn-default btn-block m-t-md"> 회원 정보 추가</a>

															</div>
														</form>
													</div>
												</div>
											</div></li>
								</c:if>
									</c:otherwise>
								</c:choose>
								
							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.container-fluid -->
				</nav>


			</div>
			<!-- /.container -->
		</div>
		<div id="mainCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#mainCarousel" data-slide-to="0" class="active"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img
						src="http://placehold.it/1920x450/777/fff&amp;text=My+Page"
						alt="...">
					<div class="carousel-caption">
						<h3>내 정보</h3>
					</div>
				</div>
				
			</div>
		<div align="center">
			<br />
			<br />
			<br />
			<br />
			<h2>${ kakao }님 회원정보</h2>
			<br />
			<br />

			<form action="<%= request.getContextPath() %>/UpdateKakao.do" method="post" name="check">
				<table style="width: 50%;">
					<tr>
						<th>아이디</th>
						<td>${ mykakaoVO.id }
						</td>
					</tr>

					<tr>
						<th>이름</th>
						<td>${ kakao }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${ mykakaoVO.email_id } @ ${ mykakaoVO.email_domain }</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${ mykakaoVO.tel1 } - ${ mykakaoVO.tel2 } - ${ mykakaoVO.tel3 }</td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>${ mykakaoVO.post }</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${ mykakaoVO.basic_addr }</td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td>${ mykakaoVO.detail_addr }</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td>${ mykakaoVO.reg_date }</td>
					</tr>

				</table>
				<br /> <br /> 
				<input type="submit" class="btn btn-primary btn-lg" value="수정" />
				<input type="button" id = "back" class="btn btn-primary btn-lg" value="HOME" />
			</form>
		</div>
		<br/>
		<br/>
		<br/>
		<footer id="site-footer">
				<div class="container">
					<div class="row">
						<span class="divider grey"></span>
						<h4>
							2017 bit academ<span class="brandy">y</span>
						</h4>
						<h5>
							by <a href="http://www.bitacademy.com/" target="_blank">3조
								담배충들</a>
						</h5>
						<a href="#" class="scroll-top"> <img
							src="<%=request.getContextPath()%>/img/top.png" alt=""
							class="top">
						</a>
					</div>
				</div>
			</footer>


	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>

	<!-- Bootstrap JavaScript -->
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
		
		<script>
	//<![CDATA[
	// 사용할 앱의 JavaScript 키를 설정해 주세요.
	Kakao.init('e9ccdda95dc52241c09a850d8d9b9f48');
	Kakao.Auth.createLoginButton({
		container : '#kakao-login-btn',
		success : function(authObj) {
			// 로그인 성공시, API를 호출합니다.
			Kakao.API.request({
				url : '/v1/user/me',
				success : function(res) {
					alert(res.properties.nickname+"님 환영합니다.");
					location.href = "<%=request.getContextPath()%>?name="+res.properties.nickname;
				},
				fail : function(error) {
					alert(JSON.stringify(error));
				}
			});
		},
		fail : function(err) {
			alert(JSON.stringify(err));
		}
	});
	//]]>

	//]]>

	</script>

	
</body>

</html>