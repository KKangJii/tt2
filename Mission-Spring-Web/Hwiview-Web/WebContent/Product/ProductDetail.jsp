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
    <link rel="shortcut icon" href="favicon.ico">

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/jquery.easy-pie-chart.css">
    <link rel="stylesheet" href="css/styles.css" title="mainStyle">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- REVOLUTION BANNER CSS SETTINGS -->
    <link rel="stylesheet" type="text/css" href="rs-plugin/css/settings.css" media="screen" />

    <script src="js/modernizr.custom.32033.js"></script>

    <!--[if IE]><script type="text/javascript" src="js/excanvas.compiled.js"></script><![endif]-->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">
<!-- font Awesome CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

<!-- Main Styles CSS -->
<link href="css/main.css" rel="stylesheet">
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="<%=request.getContextPath()%>/js/checkForm.js"></script>
<script src="/resource/Message.js"></script>
<script src="/vassets/javascripts/demos_layout.js"></script>
<link rel="stylesheet" media="screen" href="/assets/bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" media="screen" href="/vassets/stylesheets/docs_js_demos.css"/>
<script type='text/javascript'>
	function popbutton(){
		$('div.modal').modal();
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
	function close(){
		
		location.href = "<%=request.getContextPath()%>";
	}
</script>
</head>
<body>
<!-- ---------------------------------------------------------- -->



<!-- ---------------------------------------------------------- -->
 <div id="wrap" class="home">
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
								<li class="active"><a href="#">상세 제품</a></li>
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
													</c:if>
													<li class="divider"></li>
													<li><a href="#">장바구니</a></li>
												</c:when>
												<c:otherwise>
													<li><a href="<%=request.getContextPath()%>/logout.do">로그아웃</a></li>
												<li><a href="<%=request.getContextPath()%>/MyPage.do">회원
														정보</a></li>
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
		<!-- /.nav-wrapper -->
        <section id="whoWeAre">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-push-2 clearfix">
                        <div class="section-heading scrollpoint sp-effect3">
                            <h1>project hwivie<span>w</span>
                            </h1>
                            <h4>2017 Bit Academy 2차 팀 프로젝트</h4>
                            <span class="divider"></span>
                        </div>
                    </div>
                   <!--  <div class="col-md-6">
                        <div class="media scrollpoint sp-effect2">
                            <a class="pull-left" href="#">
                                <i class="media-object fa fa-star fa-4x"></i>
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">member & management</h4>
                                <p>박현영</p><p>asdfasfd</p>
                            </div>
                        </div>
                        <div class="media scrollpoint sp-effect2">
                            <a class="pull-left" href="#">
                                <i class="media-object fa fa-support fa-4x"></i>
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">attach files</h4>
                                <p>유윤승</p><p>탈주닌자</p>
                            </div>
                        </div>               
                    </div>   
                    
                    <div class="col-md-6">
                        <div class="media right scrollpoint sp-effect1">
                            <a class="pull-right" href="#">
                                <i class="media-object fa fa-send fa-4x"></i>
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">review & qna board</h4>
                                <p>박찬호, 송남석</p><p>근본없는 웹 새끼 으아아앙아아아앙</p>
                            </div>
                        </div>
                        <div class="media right scrollpoint sp-effect1">
                            <a class="pull-right" href="#">
                                <i class="media-object fa fa-slack fa-4x"></i>
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">db & dao & 이페이지</h4>
                                <p>여러분 이건 할게 못되네여</p>
                            </div>
                        </div> -->
                      
                    </div>
                </div>
            </div>
        </section>

        <section id="about">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-push-2 clearfix">
                        <div class="section-heading scrollpoint sp-effect3">
                            <h1>about room<span>e</span>
                            </h1>
                            <h4>불 켜고 끄는 것이 귀찮은 일에서도, 끄는 것을 깜빡하여 걱정하는 일에서 해방될 수 있습니다. 스마트폰으로 쉽게 켜고 끄세요.</h4>
                            <span class="divider"></span>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-12 scrollpoint sp-effect4" style="text-align : center;">                             
                               <iframe width="632" height="355" src="https://www.youtube.com/embed/HUCXWssEmdI" frameborder="0" allowfullscreen></iframe>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="media vertical scrollpoint sp-effect5">
                                    <a href="#">
                                        <i class="media-object fa fa-wifi fa-2x"></i>
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">WiFi</h4>
                                        <p>집 안은 물론 밖에서도 가능합니다. 블루투스의 한계를 뛰어넘은 진정한 스마트 스위치입니다. 언제 어디서든 집 안의 전등이 켜진 상태를 확인할 수 있습니다.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="media vertical scrollpoint sp-effect5">
                                    <a href="#">
                                        <i class="media-object fa fa-sun-o fa-2x"></i>
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">조도 센서</h4>
                                        <p>주위 환경이 밝아지면 불이 꺼지고, 어두워지면 불이 켜지게 할 수 있습니다. 애완동물이 늦은 저녁 깜깜한 곳에 있는 것이 신경쓰였다면, 더 이상 걱정할 필요가 없습니다. </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="media vertical scrollpoint sp-effect5">
                                    <a href="#">
                                        <i class="media-object fa fa-power-off fa-2x"></i>                                        
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">단축키</h4>
                                        <p>스마트폰 앱에서 단축키를 설정하면 터치 한 번에 원하는 전등만 켜고 끌 수 있습니다. 퇴근 후 소파에 앉아 TV를 볼 때는 한 번만 터치하세요. 거실 전등만 켜고 나머지 모든 전등을 끌 수 있습니다. </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="media vertical scrollpoint sp-effect5">
                                    <a href="#">
                                        <i class="media-object fa fa-toggle-on fa-2x"></i>
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">스위치간 컨트롤</h4>
                                        <p>눈 앞에 있는 스위치를 2초 동안 누르면 집 안의 모든 불이 꺼집니다. 스위치를 2번 연속 누르면, 조금 전에 켰던 전등이 꺼집니다. 화장실 불을 켜놓고 방에 돌아왔을 때, 다시 화장실을 갈 필요가 없습니다.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <section id="highlights">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators vertical">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img src="img/moving/1.gif" alt="">
                                </div>
                                <div class="item">
                                    <img src="img/moving/2.gif" alt="">
                                </div>
                                <div class="item">
                                    <img src="img/moving/3.gif" alt="">
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-6">
                        <h4>누구나 한 번쯤 겪었을 문제</h4>
                        <h5>한 번쯤은 꼭 겪어봤을 그 문제, 이제 매직 스위치로 해방될 수 있습니다.</h5><br/>
                        <ul>
                            <li>잠들기 전  불 끄고 싶을 때, 꼼짝도 하기 싫을 때</li>
                            <li>여행을 떠나 집을 비운 사이, 어두 컴컴한 집이 걱정 됄 때</li>
                            <li>실수로 전등을 켜놓고 나왔을 때</li>
                            <li>나도 모르게 잠이 들었을 때</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <section id="features">
            <div class="container">
                <div class="row">
                    <div class="col-md-5 scrollpoint sp-effect1">
                        <img src="img/moving/4.gif" class="img-responsive ipad-image img-center" alt="">
                    </div>
                    <div class="col-md-7 scrollpoint sp-effect2">
                        <h1>간편한 설치</h1>
                         <div class="media media-circle">
                            <a class="pull-left" href="#">
                                <i class="media-object fa fa-angle-right fa-2x"></i>
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">자석 방식으로 편리하게</h4>
                                <p>지금 쓰고 있는 제품을 교체할 필요도, 분해할 필요도, 배선 공사를 할 필요도 없습니다. 강력한 매직스티커 위에 붙여주세요. 그것으로 끝입니다. </p>
                            </div>
                        </div>
                        <div class="media media-circle">
                            <a class="pull-left" href="#">
                                <i class="media-object fa fa-angle-right fa-2x"></i>
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">사용 가능한 스위치 규격</h4>
                                <p>표준 규격 사이즈의 1구, 2구, 3구 스위치를 모두 지원합니다.</p>
                            </div>
                        </div>
                        <div class="media media-circle">
                            <a class="pull-left" href="#">
                                <i class="media-object fa fa-angle-right fa-2x"></i>
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">사용 불가능한 스위치 종류</h4>
                                <p>센서방식의 스위치와 스위치 사이에 공간이 없이 나란이 붙어있는 경우 사용할 수가 없습니다.</p>
                            </div>
                        </div>
                       
                    </div>
                </div>
            </div>
        </section>

        <section id="services">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-push-2 clearfix">
                        <div class="section-heading scrollpoint sp-effect3">
                            <h1>제품 구성</h1>
                            <h4></h4>
                            <span class="divider"></span>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="media media-services right scrollpoint sp-effect1">
                                    <a class="pull-right" href="#">
                                        <i class="media-object fa fa-power-off fa-2x"></i>
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">1구 스위치</h4>
                                        <p>하나의 버튼이 있는 스위치에 사용.</p>
                                    </div>
                                </div>
                                <div class="media media-services right scrollpoint sp-effect2">
                                    <a class="pull-right" href="#">
                                        <i class="media-object fa fa-power-off fa-2x"></i>
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">2구 스위치</h4>
                                        <p>두개의 버튼이 있는 스위치에 사용.</p>
                                    </div>
                                </div>
                                <div class="media media-services right scrollpoint sp-effect1">
                                    <a class="pull-right" href="#">
                                        <i class="media-object fa fa-power-off fa-2x"></i>
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">3구 스위치</h4>
                                        <p>세개의 버튼이 있는 스위치에 사용.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="media media-services scrollpoint sp-effect2">
                                    <a class="pull-left" href="#">
                                        <i class="media-object fa fa-wifi fa-2x"></i>
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">허브</h4>
                                        <p>모든 스위치를 어디서든 컨트롤 할 수 있도록 도와주는 허브입니다.</p>
                                    </div>
                                </div>
                                <div class="media media-services scrollpoint sp-effect1">
                                    <a class="pull-left" href="#">
                                        <i class="media-object fa fa-adjust fa-2x"></i>
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">roome 미니 라이트</h4>
                                        <p>10만원 이상 구매 고객에게 roome 미니 라이트를 드립니다.</p>
                                    </div>
                                </div>
                                <!-- <div class="media media-services scrollpoint sp-effect2">
                                    <a class="pull-left" href="#">
                                        <i class="media-object fa fa-shopping-cart fa-2x"></i>
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">e-commerce solutions</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nesciunt, eligendi ipsa.</p>
                                    </div>
                                </div> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="testimonials">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-push-2 clearfix">
                        <div class="section-heading scrollpoint sp-effect3">
                            <i class="fa fa-quote-left fa-4x"></i>
                            <h3>주의사항</h3>
                            <h4></h4>
                            <span class="divider"></span>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div id="testimonials-carousel" class="carousel slide scrollpoint sp-effect3" data-ride="carousel">
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <div class="item active">
                                    <p>WiFi로 집 안의 모든 스위치를 컨트롤하기 위해서는 스마트 허브(게이트웨이)가 필요합니다. 전원 컨센트에 바로 꼽아서 사용할 수 있는 형태이며, 허브 1개에 스위치 5개까지 연결하여 사용하는 것이 좋습니다.</p>
                                  <!--   <div class="row">
                                        <div class="col-md-4 col-md-push-5">
                                            <div class="author">
                                                <h5>Name dot name</h5>
                                                <p>Senior UI Developer - ScoopThemes</p>
                                            </div>
                                        </div>
                                    </div> -->
                                </div>
                                <div class="item">
                                    <p>집 안에서 사용하시는 인터넷 공유기를 예로 들면, 공유기 1대에 여러 대의 PC를 연결하여 사용하시는 것처럼 허브 1개에 여러 개의 스위치를 연결하여 사용하실 수 있습니다.</p>
                                   <!--  <div class="row">
                                        <div class="col-md-4 col-md-push-5">
                                            <div class="author">
                                                <h5>Name dot name</h5>
                                                <p>Senior UI Developer - ScoopThemes</p>
                                            </div>
                                        </div>
                                    </div> -->
                                </div>
                            </div>

                            <!-- Controls -->
                            <a class="left carousel-control" href="#testimonials-carousel" data-slide="prev">
                                <i class="fa fa-angle-left fa-3x"></i>
                            </a>
                            <a class="right carousel-control" href="#testimonials-carousel" data-slide="next">
                                <i class="fa fa-angle-right fa-3x"></i>
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <section id="buyNow">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 scrollpoint sp-effect2">
                       <!--  <img src="img/samples/macbook-bl.png" alt="" class="img-responsive macbook-image img-center"> -->
                        <img src="img/samples/roome.png" alt="" class="img-responsive macbook-image img-center">
                    </div>
                    <div class="col-md-5 scrollpoint sp-effect1">
                        <h1>Buy room<span>e</span>
                        </h1>
                        <p>스마트 홈의 첫 단추가 될 스위치 Roome 매직 스위치로 시작하세요</p>
                        <a href="<%=request.getContextPath()%>/BuyForm.do" class="btn btn-primary btn-lg">Buy now</a>
                    </div>
                </div>
            </div>
        </section>

        

        <!-- <section id="skills">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-push-2 clearfix">
                        <div class="section-heading scrollpoint sp-effect3">
                            <h3>.we got skills</h3>
                            <span class="divider"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 col-sm-6 scrollpoint sp-effect6 text-center">
                        <div class="chart" data-percent="95">
                            <span>95%</span>
                        </div>
                        <h4 class="skill-detail">html/css</h4>
                    </div>
                    <div class="col-md-3 col-sm-6 scrollpoint sp-effect6 text-center">
                        <div class="chart" data-percent="75">
                            <span>75%</span>
                        </div>
                        <h4 class="skill-detail">wordpress</h4>
                    </div>
                    <div class="col-md-3 col-sm-6 scrollpoint sp-effect6 text-center">
                        <div class="chart" data-percent="55">
                            <span>55%</span>
                        </div>
                        <h4 class="skill-detail">javascript</h4>
                    </div>
                    <div class="col-md-3 col-sm-6 scrollpoint sp-effect6 text-center">
                        <div class="chart" data-percent="35">
                            <span>35%</span>
                        </div>
                        <h4 class="skill-detail">python</h4>
                    </div>
                </div>
            </div>
        </section> -->

        <section id="portfolio">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-push-2 clearfix">
                        <div class="section-heading scrollpoint sp-effect3">
                            <h1>package</h1>
                            <!-- <h4>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore reiciendis vel reprehenderit expedita cupiditate repellat debitis! Est qui quae consectetur.</h4> -->
                            <span class="divider"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                 <div id="filters" class="button-group">
                        <button data-filter="*" class="current">all items</button>
                        <button data-filter=".web-design">1~2인 가구 추천</button>
                        <button data-filter=".print">3~4인 가구 추천</button>
                        <button data-filter=".mobile">사무실</button>
                        <button data-filter=".logo">공동구매</button>
                    </div>

                    <div id="container">
                        <div class="item col-md-3 col-sm-6 web-design">
                            <div class="details">
                                <img src="img/package/1.png" alt="" class="img-responsive">
                                <div class="info-wrapper">
                                    <span class="heart"><i class="fa fa-heart"></i>
                                    </span>
                                    <div class="info">
                                        <div class="name-tag">
                                            <h5><a href = "<%=request.getContextPath()%>/BuyForm.do">스위치 1 + 허브 1</a></h5>
                                            <span class="divider"></span>
                                            <p>1번 구성</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item col-md-3 col-sm-6 web-design">
                            <div class="details">
                                <img src="img/package/2.png" alt="" class="img-responsive">
                                <div class="info-wrapper">
                                    <span class="heart"><i class="fa fa-heart"></i>
                                    </span>
                                    <div class="info">
                                        <div class="name-tag">
                                            <h5><a href = "<%=request.getContextPath()%>/BuyForm.do">스위치 2 + 허브 1</a></h5>
                                            <span class="divider"></span>
                                            <p>2번 구성</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item col-md-3 col-sm-6 print">
                            <div class="details">
                                <img src="img/package/3.png" alt="" class="img-responsive">
                                <div class="info-wrapper">
                                    <span class="heart"><i class="fa fa-heart"></i>
                                    </span>
                                    <div class="info">
                                        <div class="name-tag">
                                            <h5><a href = "<%=request.getContextPath()%>/BuyForm.do">스위치 3 + 허브 1</a></h5>
                                            <span class="divider"></span>
                                            <p>3번 구성</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item col-md-3 col-sm-6 print">
                            <div class="details">
                                <img src="img/package/4.png" alt="" class="img-responsive">
                                <div class="info-wrapper">
                                    <span class="heart"><i class="fa fa-heart"></i>
                                    </span>
                                    <div class="info">
                                        <div class="name-tag">
                                            <h5><a href = "<%=request.getContextPath()%>/BuyForm.do">스위치 4 + 허브 1</a></h5>
                                            <span class="divider"></span>
                                            <p>4번 구성</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item col-md-3 col-sm-6 mobile">
                            <div class="details">
                                <img src="img/package/5.png" alt="" class="img-responsive">
                                <div class="info-wrapper">
                                    <span class="heart"><i class="fa fa-heart"></i>
                                    </span>
                                    <div class="info">
                                        <div class="name-tag">
                                            <h5><a href = "<%=request.getContextPath()%>/BuyForm.do">스위치 5 + 허브 1</a></h5>
                                            <span class="divider"></span>
                                            <p>5번 구성</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item col-md-3 col-sm-6 mobile">
                            <div class="details">
                                <img src="img/package/6.png" alt="" class="img-responsive">
                                <div class="info-wrapper">
                                    <span class="heart"><i class="fa fa-heart"></i>
                                    </span>
                                    <div class="info">
                                        <div class="name-tag">
                                            <h5><a href = "<%=request.getContextPath()%>/BuyForm.do">스위치 10 + 허브 2</a></h5>
                                            <span class="divider"></span>
                                            <p>6번 구성</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item col-md-3 col-sm-6 logo">
                            <div class="details">
                                <img src="img/package/7.png" alt="" class="img-responsive">
                                <div class="info-wrapper">
                                    <span class="heart"><i class="fa fa-heart"></i>
                                    </span>
                                    <div class="info">
                                        <div class="name-tag">
                                            <h5><a href = "<%=request.getContextPath()%>/BuyForm.do">스위치 20 + 허브 2</a></h5>
                                            <span class="divider"></span>
                                            <p>7번 구성</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                      
                    </div>
                </div>
            </div>
        </section>

      <!-- <section id="team">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-push-2 clearfix">
                        <div class="section-heading scrollpoint sp-effect3">
                            <h1>.Meet the team</h1>
                            <h4>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore reiciendis vel reprehenderit expedita cupiditate repellat debitis! Est qui quae consectetur.</h4>
                            <span class="divider"></span>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="row">
                            <div class="member scrollpoint sp-effect5">
                                <div class="member-image">
                                    <img src="img/samples/team/1.jpg" alt="" class="img-responsive img-center">
                                    <div class="member-details">
                                        <h4>Connect with me</h4>
                                        <ul class="social">
                                            <li><a href="#"><i class="fa fa-google-plus fa-lg"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-twitter fa-lg"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-facebook fa-lg"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-pinterest fa-lg"></i></a>
                                            </li>
                                        </ul>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta, esse molestiae voluptates</p>
                                    </div>
                                </div>
                                <div class="member-name">
                                    <h4>Sara jones</h4>
                                    <p>Art Director</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="row">
                            <div class="member scrollpoint sp-effect3">
                                <div class="member-image">
                                    <img src="img/samples/team/2.jpg" alt="" class="img-responsive img-center">
                                    <div class="member-details">
                                        <h4>Connect with me</h4>
                                        <ul class="social">
                                            <li><a href="#"><i class="fa fa-google-plus fa-lg"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-twitter fa-lg"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-facebook fa-lg"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-pinterest fa-lg"></i></a>
                                            </li>
                                        </ul>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta, esse molestiae voluptates</p>
                                    </div>
                                </div>
                                <div class="member-name member-odd">
                                    <h4>jon Doe</h4>
                                    <p>UI Developer</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="row">
                            <div class="member scrollpoint sp-effect5">
                                <div class="member-image">
                                    <img src="img/samples/team/3.jpg" alt="" class="img-responsive img-center">
                                    <div class="member-details">
                                        <h4>Connect with me</h4>
                                        <ul class="social">
                                            <li><a href="#"><i class="fa fa-google-plus fa-lg"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-twitter fa-lg"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-facebook fa-lg"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-pinterest fa-lg"></i></a>
                                            </li>
                                        </ul>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta, esse molestiae voluptates</p>
                                    </div>
                                </div>
                                <div class="member-name">
                                    <h4>Sam jones</h4>
                                    <p>Design Manager</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <div class="row">
                            <div class="member scrollpoint sp-effect3">
                                <div class="member-image">
                                    <img src="img/samples/team/4.jpg" alt="" class="img-responsive img-center">
                                    <div class="member-details">
                                        <h4>Connect with me</h4>
                                        <ul class="social">
                                            <li><a href="#"><i class="fa fa-google-plus fa-lg"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-twitter fa-lg"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-facebook fa-lg"></i></a>
                                            </li>
                                            <li><a href="#"><i class="fa fa-pinterest fa-lg"></i></a>
                                            </li>
                                        </ul>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dicta, esse molestiae voluptates</p>
                                    </div>
                                </div>
                                <div class="member-name member-odd">
                                    <h4>Sofia jones</h4>
                                    <p>IT Manager</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section> -->

       <!--  <section id="twitter">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-push-2 clearfix">
                        <div class="section-heading white scrollpoint sp-effect3">
                            <h1>.bond<span>y</span>@ twitter</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div id="carousel-twitter" class="carousel slide" data-ride="carousel">
                        Indicators
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-twitter" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-twitter" data-slide-to="1"></li>
                            <li data-target="#carousel-twitter" data-slide-to="2"></li>
                        </ol>

                        Wrapper for slides
                        <div class="carousel-inner">
                            <div class="item active">
                                <div class="row">
                                    <div class="col-md-8 col-md-push-2">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque, eos, non ad molestiae obcaecate sapiente dolorem magnam quisquam maiores voluptatem sunt cumque iure illo a dicta? <a href="https://twitter.com/scoopthemes">https://twitter.com/scoopthemes</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="row">
                                    <div class="col-md-8 col-md-push-2">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque, eos, non ad molestiae obcaecate sapiente dolorem magnam quisquam maiores voluptatem sunt cumque iure illo a dicta? <a href="https://twitter.com/scoopthemes">https://twitter.com/scoopthemes</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="row">
                                    <div class="col-md-8 col-md-push-2">
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque, eos, non ad molestiae obcaecate sapiente dolorem magnam quisquam maiores voluptatem sunt cumque iure illo a dicta? <a href="https://twitter.com/scoopthemes">https://twitter.com/scoopthemes</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="follow">
                        <a href="#" class="btn btn-empty text-center">
                            <i class="fa fa-twitter"></i> Follow
                        </a>
                    </div>
                </div>
            </div>
        </section> -->

      <!--   <section id="get-in-touch">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-push-2 clearfix">
                        <div class="section-heading scrollpoint sp-effect3">
                            <h1>.get in touch</h1>
                            <h4>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore reiciendis vel reprehenderit expedita cupiditate repellat debitis!</h4>
                            <span class="divider"></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="contact-details">
                            <div class="detail">
                                <h4>bond
                                    <span class="brandy">y</span>web agency.</h4>
                                <p>4, Some street, California, USA</p>
                            </div>
                            <div class="detail">
                                <h4>call us</h4>
                                <p>+1 234 567890</p>
                            </div>
                            <div class="detail">
                                <h4>email us</h4>
                                <p>support@Bondy.com</p>
                            </div>
                            <div class="detail">
                                <ul class="clearfix">
                                    <li><a href="#"><i class="fa fa-google-plus fa-2x"></i></a>
                                    </li>
                                    <li><a href="#"><i class="fa fa-twitter fa-2x"></i></a>
                                    </li>
                                    <li><a href="#"><i class="fa fa-facebook fa-2x"></i></a>
                                    </li>
                                    <li><a href="#"><i class="fa fa-youtube fa-2x"></i></a>
                                    </li>
                                    <li><a href="#"><i class="fa fa-pinterest fa-2x"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <form>
                            <div class="form-group has-feedback left">
                                <input type="text" class="form-control" placeholder="NAME">
                                <i class="fa fa-user form-control-feedback"></i>
                            </div>
                            <div class="form-group has-feedback left">
                                <input type="email" class="form-control" placeholder="Email">
                                <i class="fa fa-envelope-o form-control-feedback"></i>
                            </div>
                            <div class="form-group has-feedback left">
                                <textarea class="form-control" rows="7" placeholder="MESSAGE"></textarea>
                                <i class="fa fa-pencil-square-o form-control-feedback"></i>
                            </div>
                            <button class="btn btn-primary btn-lg pull-right" type="submit">SUBMIT</button>

                        </form>
                    </div>
                </div>
            </div>
        </section>
 -->
      <!--   <section id="map"></section> -->

        <footer id="site-footer">
            <div class="container">
                <div class="row">
                    <span class="divider grey"></span>
                    <h4>2017 bit academ<span class="brandy">y</span></h4>
                    <h5>by <a href="http://www.bitacademy.com/" target="_blank">3조 담배충들</a>
                    </h5>
                    <a href="#" class="scroll-top">
                        <img src="img/top.png" alt="" class="top">
                    </a>
                </div>
            </div>
        </footer>
    </div>
    <!--/wrap-->

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/stellar.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/jquery.easypiechart.min.js"></script>

    <!-- jQuery REVOLUTION Slider  -->
    <script type="text/javascript" src="rs-plugin/js/jquery.themepunch.plugins.min.js"></script>
    <script type="text/javascript" src="rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

    <script src="js/waypoints.min.js"></script>

    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASm3CwaK9qtcZEWYa-iQwHaGi3gcosAJc&sensor=false"></script>
    <script src="js/script.js"></script>

    <script>
    $(document).ready(function() {
        appMaster.preLoader();
        appMaster.smoothScroll();
        appMaster.animateScript();
        appMaster.navSpy();
        appMaster.revSlider();
        appMaster.stellar();
        appMaster.skillsChart();
        appMaster.maps();
        appMaster.isoTop();
        appMaster.canvasHack();
    });
    </script>

</body>

</html>