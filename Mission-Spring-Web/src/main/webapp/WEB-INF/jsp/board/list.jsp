<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>전체 게시판</h2>
	<br/>
	
	<table width="80%" border="1">
		<tr>
			<th width="7%">번호</th>
			<th>제목</th>
			<th width="20%">글쓴이</th>
			<th width="25%">등록일</th>
		</tr>
		<c:forEach items="${ boardList }" var="board">
			<tr>
				<td>${ board.no }</td>
				<td>
					<%-- <a href="${ pageContext.request.contextPath }/board/detail.do?no=${board.no}"> --%>
					<%-- <a href="${ pageContext.request.contextPath }/board/${ board.no }/detail.do"> --%>
					<a href="${ pageContext.request.contextPath }/board/detail/${board.no}">
					<c:out value="${ board.title }" />
					</a>
				</td>
				<td><c:out value="${ board.writer }" /></td>
				<td>${ board.regDate }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>





