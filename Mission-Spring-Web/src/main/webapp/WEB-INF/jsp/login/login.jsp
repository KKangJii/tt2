<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>					<!--������ form���� �ٲ㺸��!! -->
<h2>�α��� ������</h2>
	<form action="${ pageContext.request.contextPath }/login/login.do"
		  method="post">
		<table border="1" width="40">
			<tr>
				<th>���̵�</th>
				<td><input type="text" name="id" /></td>
			</tr>
			<tr>
				<th>�н�����</th>
				<td><input type="password" name="password" /></td>
			</tr>
		</table> 
		<input type="submit" value="�α���" />
	</form>
</body>
</html>





