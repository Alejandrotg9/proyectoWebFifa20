<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="fifa20.*"%>
<%@ page import="java.util.*"%>

<%
	BDController bdController = new BDController();
	ArrayList<Liga> ligas = bdController.dameLigas();
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
					<h2>Baja Liga</h2>
					<form class="d-inline-block" action="operaciones.jsp" method="POST" style="width: 300px;">
						<div class="row gtr-50">
			
							<label>Seleccione una Liga <select name="codLiga"
								class="p-2" id="ligas">
									<%
												for (Liga liga : ligas) {
											%>
									<option value="<%=liga.getCod_liga()%>"><%=liga.getNombre_liga()%></option>
									<%
												}
											%>
							</select>
							</label>
								<input name="opt" value="bajaLiga" style="visibility: hidden;" />		
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
						Error al eliminar la Liga.
						<%
							} else if (error.equalsIgnoreCase("liga_no_existe")) {
						%>
						No exsiste liga con ese código.
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
						Liga eliminada correctamente.
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
 $("#ligas").select2({
  templateResult: formatOptions
 });
});
 
function formatOptions (state) {
  if (!state.id) { return state.text; }
   var $state = $(
   '<span><img width="40" sytle="display: inline-block;" src="../images/ligas/' + state.element.value.toLowerCase() + '.png" /> ' + state.text + '</span>'
  );
  return $state;
}
</script>