<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
int num1 = 34;
int num2 = 20;
int num3 = 10;
%>
	<h2><a href="recibe.jsp?var1=<%= num1 %>&var2=<%= num2 %>&var3=<%= num3 %>">Enlace</a></h2>
</body>
</html>