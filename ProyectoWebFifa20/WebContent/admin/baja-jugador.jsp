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
<jsp:include page="../includes/admin-header.jsp"></jsp:include>

<section class="wrapper style1" style="height: 500px;">
	<div class="container-fluid">
		<div id="content">

			<!-- Content -->
			<article>
				<section class="col-6 col-12-narrower mx-auto">
					<h2>Baja Jugador</h2>
					<form class="d-inline-block mt-2" action="operaciones.jsp"
						method="POST" style="width: 350px;">
						<div class="row gtr-50">
							<label>Seleccione un Jugador <select name="codJugador"
								class="p-2" id="jugadores" style="border: 2px solid red;">
									<%
										for (Jugador jugador : jugadores) {
									%>
									<option value="<%=jugador.getCodigo_jugador()%>"><%=jugador.getNombre_jugador()%></option>
									<%
										}
									%>
							</select>
							</label>
						</div>
						<div style="padding-top: 22px;">
							<ul class="actions">
								<li><input type="submit" class="button alt"
									value="Eliminar" /></li>
							</ul>
						</div>
						<input name="opt" value="bajaJugador" style="visibility: hidden;" />
					</form>
					<!-- Compruebo que no exista ningún error -->
					<%
						if (error != null) {
					%>
					<div class="alert alert-danger container" role="alert">
						<%
							if (error.equalsIgnoreCase("opt_fallida")) {
						%>
						Error al eliminar al Jugador.
						<%
							} else if (error.equalsIgnoreCase("jugador_no_existe")) {
						%>
						No exsiste jugador con ese código.
						<%
							} else if (error.equalsIgnoreCase("codigo_mal")) {
						%>
						El código no puedo estar vacío y a de ser un número.
						<%
							}
						%>
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