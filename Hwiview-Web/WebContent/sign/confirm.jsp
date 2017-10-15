<%@page import="kr.co.bit.sign.dao.SignDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.bit.util.JDBCClose"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.bit.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String str = "";

	String id = request.getParameter("id");
	
	SignDAO dao = new SignDAO();
	
	boolean result = dao.IdCheck(id);
	
	if(result){ 
		str = "NO";
		out.print(str);
	}else{
		str = "YES";
		out.print(str);
	}
%>
