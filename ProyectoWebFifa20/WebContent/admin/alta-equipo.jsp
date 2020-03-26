<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="fifa20.*"%>
<%@ page import="java.util.*"%>

<%
	BDController controladorBD = new BDController();
	ArrayList<Liga> ligas = controladorBD.dameLigas();
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
					<h2>Alta Equipo</h2>
					<form action="operaciones.jsp" method="POST">
						<div class="row gtr-50">
							<label class="">Nombre del Equipo <input type="text"
								name="nombreEquipo" required="required" placeholder="Nombre"
								style="width: 450px" maxlength="20" />
							</label> <label>Seleccione una Liga
							
							
							</br>
								<select name="codLiga" class="p-2" id="ligasEquipos">
									<%
									for (Liga liga : ligas) { 
											%>
									<option value="<%=liga.getCod_liga()%>"><%=liga.getNombre_liga()%></option>
									<%
												}
											%>
							</select>

							</label>   
							<input name="opt" value="altaEquipo" style="visibility: hidden;" />

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
						Error al añadir el Equipo.
						<%
							} else if (error.equalsIgnoreCase("equipo_existe")) {
						%>
						El Equipo ya esiste.
						<%
							}else if(error.equalsIgnoreCase("campos_erroneos")){
						%>
						El nombre no puede estar vacío.
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
						Equipo añadido correctamente.
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
 $("#ligasEquipos").select2({
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