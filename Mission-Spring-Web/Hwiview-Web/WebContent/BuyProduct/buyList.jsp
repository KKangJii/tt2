<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="<%=request.getContextPath()%>/js/checkForm.js"></script>
<style>
table.type09 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
}

table.type09 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.type09 tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.type09 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
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
            var refreshToken = Kakao.Auth.getRefreshToken();
            alert(JSON.stringify(authObj));
         },
         fail : function(err) {
            alert(JSON.stringify(err));
         }
      });
   };
   
   //]]>
   
   function doAction(boardNo) {
         <c:choose>
            <c:when test="${ not empty userVO or not empty kakaoVO}">
               location.href = "<%=request.getContextPath()%>/qnadetail.do?no=" + boardNo;
            </c:when>
            <c:otherwise>
               if(confirm("로그인 후 사용가능합니다")) {
                  location.href = "<%=request.getContextPath()%>";
               }
            </c:otherwise>
         </c:choose>
      }

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
   function addFavorite() {
      try {
         window.external.AddFavorite('http://localhost:8000/Hwiview-Web',
               '휘뷰');
      } catch (e) {
         alert("현재 사용중인 브라우저에서는 즐겨찾기 기능을 사용할수 없습니다\n"
               + "크롬에서는 ctrl+d키를 눌러주세요");
      }

   }
   function toggle(){
		var check = false;
		var cnt = 0;
		var id = document.back.checkid;
		for(var i = 0; i < id.length && cnt == i; i++){
			if(id[i].checked)
				cnt++;
		}
		if(cnt != id.length){
			check = true;
		}
		for(var i = 0; i < id.length; i++){
//			hobby[i].checked = !hobby[i].checked; //if문돌릴필요없이 !써서바로댐
			id[i].checked = check;
			
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
		<!-- /header -->
	</div>
	<!-- /.nav-wrapper -->
	<br/>
	<br/>
	<br/>
	<br/>
	<div id="mainCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img
					src="<%=request.getContextPath()%>/img/shop1_190859-iloveimg-resized.jpg"
					alt="...">
			</div>
		</div>

	</div>


	<div class="container">

		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">

				<h1 class="page-header">주문 내역</h1>
			</div>
		</div>
		<!-- /.row -->

		<!-- Project One -->
		<div>

			<form action = "<%=request.getContextPath()%>/DeleteBuy.do" name = "back">
			<table width="100%" class="type09">
				<tr>
					<th>선택 </th>
					<th>수취인</th>
					<th>제품명</th>
					<th width="16%">전화번호</th>
					<th width="16%">상세주소</th>
					<th width="16%">요청사항</th>
					<th width="20%">등록일</th>
				</tr>
				<c:forEach items="${ buy }" var="buy">
					<tr>
						<td><input type="checkbox" name="checkid" value = "${ buy.id }"/>${ buy.id }</td>
						<td>${ buy.name }</td>
						<td>${ buy.product_name }</td>
						<td>${ buy.tel1 }${ buy.tel2 }${ buy.tel3 }</td>
						<td>${ buy.basic_addr }${ buy.detail_addr }</td>
						<td>${ buy.prot }</td>
						<td>${ buy.reg_date }</td>
					</tr>
				</c:forEach>
			</table>
				<div align="center">
					<input type = "button" class="btn btn-primary btn-lg" onclick = "toggle()" value = "전체선택/해제"/>
					<input type = "button" class="btn btn-primary btn-lg" id = "list" value = "HOME" onclick = "doBack()"/>
					<input type = "submit" class="btn btn-primary btn-lg" value = "구매 취소"/>
				</div>
				</form>
		</div>
		<!-- /.row -->
		<br />
		<!-- <input type="button" value = "QnA 등록" onclick="doWrite()" style="float : center;"/> -->

		<hr>

		<!-- Pagination -->
		<br /> <br />
		<div align="center">
			<ul class="pagination pagination-lg">
				<li><a href="#">&laquo;</a></li>
				<c:forEach var="i" begin="${beginPage}" end="${endPage}">
					<c:if test="${i eq pageNo}">
						<li class="active"><a href="#">${i}</a></li>
					</c:if>
					<c:if test="${i ne pageNo}">
						<li><a
							href="<%=request.getContextPath()%>/List.do?pageNo=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<li><a href="#">&raquo;</a></li>


			</ul>
			<br />

			<!-- /.section -->

			<hr>

			<footer>
				<div class="row">
					<div class="col-lg-12">
						<p>Copyright &copy; Group 3 &nbsp;&nbsp;&nbsp;2017.09</p>
					</div>
				</div>
				<!-- /.row -->
			</footer>

		</div>
		<!-- /.container -->


	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-1.11.1.min.js">
      
   </script>
	<!-- Bootstrap JavaScript -->
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

	<!-- Custom JavaScript -->
	<script src="js/custom.js"></script>

	<!-- Call functions on document ready -->
	<script>
      $(document).ready(function() {
         // Call Functions Like
         appMaster.aFunction();
         // Call anotherFunction
         appMaster.anotherFunction();
      });
      
      
      function doBack(){
         location.href = "<%=request.getContextPath()%>";
		}
	</script>

</body>

</html>