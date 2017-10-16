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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e9ccdda95dc52241c09a850d8d9b9f48"></script>


<script type='text/javascript'>
$(document).ready(function() {
    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    var options = { //지도를 생성할 때 필요한 기본 옵션
       center: new daum.maps.LatLng(37.494678, 127.027796), //지도의 중심좌표.
       level: 3 //지도의 레벨(확대, 축소 정도)
    };

    var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

    // 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
    var points = [
        new daum.maps.LatLng(33.452278, 126.567803),
        new daum.maps.LatLng(33.452671, 126.574792),
        new daum.maps.LatLng(37.5480059, 127.1520376)
    ];

    // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
    var bounds = new daum.maps.LatLngBounds();    

    var i, marker;
    for (i = 0; i < points.length; i++) {
        // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
        marker =     new daum.maps.Marker({ position : points[i] });
        marker.setMap(map);
        
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(points[i]);
    }

    function setBounds() {
        // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
        // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
        map.setBounds(bounds);
    }
    
    function goHome(){
       map.points[3];
    }
    
    $('#btn01').click(function() {
       setBounds();
    });
    
    $('#btn02').click(function() {
       setMap();
    });
 });
 
 //lng : 위도, lat : 경도
function setMap(lng, lat)
{
        var position = new daum.maps.LatLng(37.494678, 127.027796);
        var zoomControl = new daum.maps.ZoomControl();
        var mapTypeControl = new daum.maps.MapTypeControl();

       

        //다음 지도를 생성합니다.

        var map = new daum.maps.Map(document.getElementById('map'), {
                  center: position,
                  level: 4,
                  //mapTypeId: daum.maps.MapTypeId.HYBRID
                  mapTypeId: daum.maps.MapTypeId.ROADMAP
        });



        //마커, 지도 위에 아이콘을 표시한다.

        var marker = new daum.maps.Marker({
                  position: position
        });



        //말풍선, 지도 위에 말풍선을 표시한다. (자신이 위치한 빌딩명이나 업체명을 넣으면 좋겠죠?)

        var infowindow = new daum.maps.InfoWindow({
                  content: '<p style="margin:7px 7px 7px 7px;font:12px/1.5 sans-serif"><strong>여기로 오시면 됩니다!</strong></p>'
        });



        //각종 컨트롤러를 지도에 붙입니다. 확대축소, 지도타입 전환하기 위한 버튼 등이 여기에 해당합니다.

        map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
        map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);



        //마커 및 말풍선을 지도에 붙입니다.
        marker.setMap(map);
        infowindow.open(map, marker);

}

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
	               location.href = "<%=request.getContextPath()%>/List.do";
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

	<div id="mainCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="http://placehold.it/1920x450/777/fff&amp;text=WEL+COME"
					alt="...">
				<div class="carousel-caption">
					<h3>오시는 길</h3>
				</div>
			</div>
		</div>

	</div>
	<br/>
	<br/>
	<br/>
	<div align="center">
	<div id="map" style="width:500px;height:400px;"></div>
	</div>
	<br/>
	<br/>
	<br/>
	<div align="center">
	 <input type="button" id = "btn02" value="위치찾기"
										class="btn btn-primary btn-lg"
										style="float: center; width: 25%;" />
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
			<!-- /.row -->
		</div>


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
	         <c:when test="${ not empty userVO or not empty kakaoVO}">
				location.href = "<%=request.getContextPath()%>/writeForm.do";
	         </c:when>
	         <c:otherwise>
	            if(confirm("로그인 후 사용가능합니다.")) {
	               location.href = "<%=request.getContextPath()%>";
			";
				}
				</c:otherwise>
				</c:choose>
			}
		</script>
</body>

</html>
