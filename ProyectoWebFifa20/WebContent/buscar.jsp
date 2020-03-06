<%@page import="fifa20.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%
	BDController bdController = new BDController();
	String query = request.getParameter("");
%>	
<!-- INCLUYO LA CABECERA -->
<jsp:include page="includes/header.jsp" />

<!-- Banner -->
<section >
<div id="content">
	<h2>Resultados de la Búsqueda</h2>
	</div>
</section>

<!-- INCLUYO EL FOOTER -->
<jsp:include page="includes/footer.jsp" />