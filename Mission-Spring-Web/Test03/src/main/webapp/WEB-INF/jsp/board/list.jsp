<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function doAction() {
		location.href = "${ pageContext.request.contextPath }/board/write"

	}
</script>
</head>
<body>
	<h2>전체 게시글 조회</h2>
	<table border="1" width="80%">
		<tr>
			<th width="7%">번호</th>
			<th width="30">제목</th>
			<th width="15">글쓴이</th>
			<th width="15">내용</th>
			<th width="15">날자</th>
		</tr>
		<c:forEach var="boardList" items="${ BoardList }">
			<tr>
				<td>${ boardList.no }</td>
				<td><a
					href="${ pageContext.request.contextPath }/board/detail/${ boardList.no }">${ boardList.title }</a></td>
				<td>${ boardList.writer }</td>
				<td>${ boardList.content }</td>
				<td>${ boardList.regDate }</td>
			</tr>
		</c:forEach>
	</table>
	<input type="button" onclick = "doAction()" value="글쓰기" />
</body>
</html>