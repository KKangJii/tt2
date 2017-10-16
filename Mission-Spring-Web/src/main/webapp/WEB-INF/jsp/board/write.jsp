<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>글등록 페이지</h2>
	
	<form:form commandName="boardVO" method="post" >            <!--commandName:공유영역 boardVO를 사용하겠다 라는 말 -->        			   <!-- onsubmit="checkForm()은  폼안에 내용이 비었는지 확인하라는것 --> 
	
		
		<table border="1" width="80%">
			<tr>
				<th width="25%">제목</th>
				<td><form:input type="text" path="title"/>   <!-- boardVO에 세터해주기위해 path를쓴다 path="title"이라면  setTitle 이 되겠지???ㅋ-->
				<form:errors path="title"></form:errors>   <!-- title에 대한 vailidate값을 찍어주라는 뜻임!! -->
				</td>
		</tr>
			<tr>
				<th width="25%">글쓴이</th>
				<td><form:input type="text" path="writer"/>
				<form:errors path="writer"></form:errors>
				</td>
		</tr>
			<tr>
				<th width="25%">내용</th>
				<td><form:textarea row="7" cols="40" path="content"></form:textarea>
				<form:errors path="content"></form:errors>
				</td>
		</tr>
		</table>
		<input type="submit" value="등록"/>
	
	</form:form>
</body>
</html>




