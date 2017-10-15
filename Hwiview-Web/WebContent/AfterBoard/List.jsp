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
a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: silver;
	text-decoration: none;
}

div#content {
	display: inline-block;
	width: 200px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.date {
	width: 50px;
	height: 40px;
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
	            location.href = "<%=request.getContextPath()%>/detail.do?no=" + boardNo;
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
				<img src="<%=request.getContextPath()%>/img/iloveimg_com.png"
					alt="...">
			</div>
		</div>

	</div>

	<div class="container">

		<div>
			<!-- Page Heading -->
			<div class="row" align="center">
				<div class="col-lg-12">
					<h1 class="page-header">
						After.. <small>제품 구매후 후기들..</small>
					</h1>
				</div>
			</div>
			<!-- /.row -->
			<!-- Project One -->
			<section id="blog">
				<div class="container">
					<div class="row">
						<div class="col-md-9">
							<div class="article">
								<div class="row">
									<div class="col-md-12">
										<div class="col-sm-1 col-xs-2">
											<!-- <div class="row">  -->
											<!-- <div class="date">
                                                <span></span>
                                            </div> -->
											<!-- </div> -->
										</div>
										<c:forEach items="${ listpaging }" var="review"
											varStatus="loop">
											<div align="center">
												<div class="col-sm-11 col-xs-10"
													<c:if test="${ loop.count mod 2 eq 0 }">class="even"</c:if>>
													<div class="date">
														<span>${ review.reg_date }</span>
													</div>
													<div class="preview">
														<c:forEach items="${ requestScope.fileList }" var="file">
															<c:if test="${review.board_no == file.board_no}">
																<img src="/Hwiview-Web/upload/${ file.file_save_name }"
																	style="width: 80px; height: 100px; margin : 20px;" />
															</c:if>
														</c:forEach>
													</div>
													<h3>
														${ review.title }</a>
													</h3>
													<div class="article-details">
														<div class="author">
															<i class="fa fa-user"></i>${ review.writer }</a>
														</div>
													</div>
													<div id=content>
														내&nbsp;&nbsp;용&nbsp;&nbsp;:&nbsp;&nbsp; <br />
														<%pageContext.setAttribute("newLineChar", "\n");%>
														<a href="javascript:doAction('${ review.board_no }')">
														${fn:replace(review.content, newLineChar, "<br/>")} </a>
													</div>
												</div>
														<hr style = "border : dotted 1px #ccc;width : 100%;"/>
												<br/>
											</div>
										</c:forEach>
									</div>
									<div align="center">
									<input type="button" value="후기 등록" onclick="doWrite()"
										class="btn btn-primary btn-lg"
										style="float: center; width: 25%;" />
									</div>
								</div>
							</div>
							<div class="row">
								<div class="pagination-wrapper col-md-12 clearfix">
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
								</div>
							</div>
						</div>

					</div>
				</div>
			</section>



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
			<!-- /.row -->
		</div>

		<!-- Pagination -->
		<!-- <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                    <li>
                        <a href="#">&laquo;</a>
                    </li>
                    <li class="active">
                        <a href="#">1</a>
                    </li>
                    <li>
                        <a href="#">2</a>
                    </li>
                    <li>
                        <a href="#">3</a>
                    </li>
                    <li>
                        <a href="#">4</a>
                    </li>
                    <li>
                        <a href="#">5</a>
                    </li>
                    <li>
                        <a href="#">6</a>
                    </li>
                    <li>
                        <a href="#">&raquo;</a>
                    </li>
                </ul>
            </div>
        </div> -->

		<!-- s:page navigation -->
		<%--  <c:set var="currentPage">1</c:set>
        <c:set var="totalPage">2312</c:set>
        <c:set var="pageBlock">5</c:set>
        
        <fmt:parseNumber var="currentBlock" integerOnly="true" value="${currentPage/pageBlock}" />
        <fmt:parseNumber var="lastBlock" integerOnly="true" value="${currentPage/pageBlock}" />
        <c:set var="startNum" value="${currentBlock*pageBlock+1 }" />
        <c:set var="endNum" value="${currentBlock*pageBlock+pageBlock+1 }" />
        <c:if test="${endNyn < totalPage }"><c:set var="endBum" value="${totalPage}"/></c:if>
        
        <c:if test="${currentBlock != 0 }">[맨처음][이전] | </c:if>
        <c:forEach var="index" begin="${startNum}" end="${endNum}" varStatus="status">
        	<c:choose>
        		<c:when test="${index == currentPage}">[${ index }]</c:when>
        		<c:otherwise>${index}</c:otherwise>
        	</c:choose>
        	<c:if test="${!status.last }"> | </c:if>
        </c:forEach>
        <c:if test="${currentBlock != lastBlock }"> | [이후][맨끝]</c:if> --%>
		<!-- e:page navigation -->



		<!-- /.section -->

		<!-- /.container -->


		<!-- /#wrapper -->
		<!-- jQuery -->

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
		
		
		function doWrite(){
			 <c:choose>
	         <c:when test="${ not empty userVO or not empty kakao}">
				location.href = "<%=request.getContextPath()%>/writeForm.do";
	         </c:when>
	         <c:otherwise>
	            if(confirm("로그인 후 사용가능합니다.")) {
	               location.href = "<%=request.getContextPath()%>";
				}
				</c:otherwise>
				</c:choose>
			}
		</script>
</body>

</html>
