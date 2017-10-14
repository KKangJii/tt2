<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function doAction(type){
		switch(type){
		case 'U':
			
		case 'D':
			"
		case 'L':
			"
		}
	}

</script>
</head>
<body>
	<h2>상세 게시판</h2>

	<table border="1" width="80%">
		<tr>
			<th>글번호</th>
			<td>${ boardVO.no }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${ boardVO.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${ boardVO.writer }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${ boardVO.content }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${ boardVO.regDate }</td>
		</tr>
	</table>
	<form action="${ pageContext.request.contextPath }/board/${ boardVO.no }" method="get">
	<input type="submit"  value="수정" />
	</form>
	<form action="${ pageContext.request.contextPath }/board/${ boardVO.no }" method="post">
	<input type="hidden" name = "_method" value="delete">
	<input type="submit" value="삭제" />
	</form>
	<input type="button" onclick="location.href='${ pageContext.request.contextPath }/board/list'" value="목록" />
</body>
</html>