<%@ page language="java" %>
<%@ page contentType="text/html; charset=UTF-8 " pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<% request.setCharacterEncoding ("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
session.removeAttribute("UyeID");
response.sendRedirect("AnaSayfa.jsp");

%>
</body>
</html>