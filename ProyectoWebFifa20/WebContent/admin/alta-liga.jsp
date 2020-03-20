<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="fifa20.*"%>
<%@ page import="java.util.*"%>

<%
	BDController controladorBD = new BDController();
	ArrayList<Equipo> equipos = controladorBD.dameEquipos();
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
					<h2>Alta Liga</h2>
					<form action="operaciones.jsp" method="POST">
						<div class="row gtr-50">
							<label class="">Nombre de la Liga <input type="text"
								name="nombreLiga" required="required" placeholder="Nombre"
								style="width: 450px" maxlength="20" />
							</label>
							</label> <label class="">Pais <input required="required"
								type="text" name="paisLiga" placeholder="Nombre del País"
								maxlength="9" />
							</label>
							<input name="opt" value="altaLiga" style="visibility: hidden;" />

						</div>

						<div style="padding-top: 22px;">
							<ul class="actions">
								<li><input type="submit" class="button alt" value="Añadir" /></li>
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
						Error al añadir la Liga.
						<%
							} else if (error.equalsIgnoreCase("liga_existe")) {
						%>
						La liga ya existe.
						<%
							}else if(error.equalsIgnoreCase("campos_vacios")){
						%>
						Los campos no pueden estar vacíos.
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
						Liga añadida correctamente.
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