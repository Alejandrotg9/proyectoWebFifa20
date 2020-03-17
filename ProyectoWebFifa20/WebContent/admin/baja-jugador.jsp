<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="fifa20.*"%>
<%@ page import="java.util.*"%>

<%
	BDController bdController = new BDController();
	ArrayList<Jugador> jugadores = bdController.dameJugadores();
	String error = request.getParameter("error");
	String estado = request.getParameter("estado");
%>
<jsp:include page="../includes/header.jsp"></jsp:include>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
</head>
<section class="wrapper style1" style="height: 500px;">
	<div class="container-fluid">
		<div id="content">

			<!-- Content -->
			<article>
				<section class="col-6 col-12-narrower mx-auto">
					<h2>Baja Jugador</h2>
					<form class="d-inline-block" action="operaciones.jsp" method="POST">
						<div class="row gtr-50">
							<label class="">Código del jugador <input type="number"
								name="codJugador" required="required" placeholder="Código del Jugador"
								style="width: 450px" maxlength="3" />
							</label>
							<input name="opt" value="bajaJugador"
								style="visibility: hidden;" />
						</div>

						<div style="padding-top: 22px;">
							<ul class="actions">
								<li><input type="submit" class="button alt" value="Eliminar" /></li>
							</ul>
						</div>

					</form>
					<!-- Compruebo que no exista ningún error -->
					<%
						if (error != null) {
					%>
					<div class="alert alert-danger container w-25" role="alert">
						<%
							if (error.equalsIgnoreCase("opt_fallida")) {
						%>
						Error al eliminar al Jugador.
						<%} %>
	
					</div>
					<%
						}
						if (estado != null) {
					%>

					<div class="alert alert-success container w-25" role="alert">
						<%
							if (estado.equalsIgnoreCase("opt_completada")) {
						%>
						Jugador eliminado correctamente.
						<%
							}
						%>
					</div>
					<%
						}
					%>

				</section>
			</article>
		</div>
	</div>
</section>
<jsp:include page="../includes/footer.jsp"></jsp:include>