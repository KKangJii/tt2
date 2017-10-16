<%@page import="java.io.InputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>전송된 정보 출력</h3>
<%
	InputStream is = request.getInputStream();
	InputStreamReader isr = new InputStreamReader(is, "utf-8");
	BufferedReader br = new BufferedReader(isr);
	
	while(true) {
		String data = br.readLine();
		if(data == null)
			break;
		out.println(data + "<br/>");
	}
%>
</body>
</html>