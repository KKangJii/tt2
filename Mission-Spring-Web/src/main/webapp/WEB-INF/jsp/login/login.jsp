<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<form action="${pageContext.request.contextPath}/login/login.do" method="post">
		<table border="1" width="40">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" /></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="password" /></td>				
			</tr>
		</table>
	
		<input type="submit" value="로그인">
	</form>
</body>
</html>