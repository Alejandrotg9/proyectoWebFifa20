<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="fifa20.*"%>
<%@ page import="java.util.*"%>

<%
	BDController bdController = new BDController();
	ArrayList<Equipo> equipos = bdController.dameEquipos();
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
					<form class="d-inline-block mt-2" action="operaciones.jsp"
						method="POST" style="width: 300px;">
						<div class="row gtr-50" style="height: 115px;">
							<label>Seleccione un Equipo 
							<select name="codEquipo"
								class="p-2" id="equipos">
									<%
												for (Equipo equipo : equipos) {
											%>
									<option value="<%=equipo.getCodigo_equipo()%>"><%=equipo.getNombre_equipo()%></option>
									<%
												}
											%>
							</select>
							</label> <input name="opt" value="bajaEquipo" style="visibility: hidden;" />
						</div>

						<div>
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
<script>
//Menú desplegable de Baja Equipo.
$(document).ready(function(){
 $("#equipos").select2({
  templateResult: formatOptions
 });
});
 
function formatOptions (state) {
  if (!state.id) { return state.text; }
   var $state = $(
   '<span><img width="40" sytle="display: inline-block;" src="../images/equipos/' + state.element.value.toLowerCase() + '.png" /> ' + state.text + '</span>'
  );
  return $state;
}
</script>