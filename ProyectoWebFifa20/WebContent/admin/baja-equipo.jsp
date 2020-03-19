<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="fifa20.*"%>
<%@ page import="java.util.*"%>

<%
	BDController bdController = new BDController();
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
					<h2>Baja Equipo</h2>
					<form class="d-inline-block" action="operaciones.jsp" method="POST">
						<div class="row gtr-50">
							<label class="">Código del equipo <input type="number"
								name="codEquipo" required="required"
								placeholder="Código del Equipo" style="width: 450px"
								maxlength="3" />
							</label> <input name="opt" value="bajaEquipo" style="visibility: hidden;" />
						</div>

						<div style="padding-top: 22px;">
							<ul class="actions">
								<li><input type="submit" class="button alt"
									value="Eliminar" /></li>
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
						Error al eliminar al Equipo.
						<%
							} else if (error.equalsIgnoreCase("equipo_no_existe")) {
						%>
						No exsiste equipo con ese código.
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
						Equipo eliminado correctamente.
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