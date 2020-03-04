<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="font-size: 20px;">
<%
	int var1 = Integer.parseInt(request.getParameter("var1"));
	int var2 = Integer.parseInt(request.getParameter("var2"));
	int var3 = Integer.parseInt(request.getParameter("var3"));
%>
<ul>
	<li><%= var1 %></li>
	<li><%= var2 %></li>
	<li><%= var3 %></li>
</ul>
</body>
</html>