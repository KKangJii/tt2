 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge; charset=URF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>후기 게시판 이다옹~~</title>

    <!-- Google+ Authorship -->
    <link rel="author" href="https://plus.google.com/+scoopthemes">
    <link rel="publisher" href="https://plus.google.com/+scoopthemes">


    <!-- Canonical -->
    <link rel="canonical" href=""><!-- http://scoopthemes.com/templates/portfolio-1-column -->


    <!-- Open Graph -->
    <meta property="og:title" content="Scoop Themes">
    <meta property="og:site_name" content="Scoop Themes">
    <meta property="og:type" content="website">
    <meta property="og:description" content="Portfolio One Column Bootstrap Template">
    <meta property="og:image" content="">
    <meta property="og:url" content="">

    <!-- Bootstrap Core CSS -->
    <link href="<%= request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Basic CSS -->
    <link href="<%= request.getContextPath() %>/css/style.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<style>
	.container {
		clear:both;
		text-align : left;
		float : center;
		display : inline-block;
		/* border : 1px solid lightgray; */
		
	}
</style>
<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
      <!-- 홈버튼 -->          <a class="navbar-brand" href="<%= request.getContextPath() %>">Hwi View</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">상세 제품</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/List.do">After..</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/qnaList.do">C/S</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12">
            <br/>
            <br/>
            <br/>
                <h1 class="page-header">After..
                    <small>제품 구매후 후기들..</small>
                </h1>
            </div>
        </div>
        <!-- /.row -->
		
        <!-- Project One -->
		<c:forEach items="${ requestScope.list }" var="review" varStatus="loop">
			<div id="mod"
				<c:if test="${ loop.count mod 2 eq 0 }">class="even"</c:if>>
				<div class="row">
	
					<div class="col-md-5">
						<h3>${ review.title }</h3>
						<h4>${ review.writer }</h4>
						<p>${ review.content }</p>
						<h5>${ review.reg_date }</h5>
						<a class="btn btn-primary" href="#">Read More <span
							class="glyphicon glyphicon-chevron-right"></span></a>
					</div>
				</div>
			</div>
			<hr>
		</c:forEach>
		<!-- /.row -->
		<br/>
		<br/>
		<br/>
		<input type="button" value = "후기 등록" onclick="doWrite()" style="float : center;"/>

        <hr>

        <!-- Pagination -->
        <div class="row text-center">
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
        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
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

    <!-- jQuery 1.11.0 -->
    <script src="<%= request.getContextPath() %>/js/jquery-1.11.0.js"></script>
	
    <!-- Bootstrap Core JavaScript -->
    <script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
	
</body>

</html>
