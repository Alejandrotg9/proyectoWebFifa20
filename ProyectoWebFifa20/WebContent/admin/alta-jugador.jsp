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
					<h2>Alta Jugador</h2>
					<form action="operaciones.jsp" method="POST">
						<div class="row gtr-50">
							<label class="">Nombre del Jugador <input type="text"
								name="nombreJugador" required="required" placeholder="Nombre"
								style="width: 450px" maxlength="20" />
							</label> <label>Equipo 
							</br>
								<select name="codEquipo" class="p-2" id="equiposJugador">
									<%
												for (Equipo equipo : equipos) {
											%>
									<option value="<%=equipo.getCodigo_equipo()%>"><%=equipo.getNombre_equipo()%></option>
									<%
												}
											%>
							</select>
							</label> <label class="">Pierna <input required="required"
								type="text" name="piernaJugador" placeholder="Pierna"
								maxlength="9" />
							</label> <label class="">Altura <input required="required"
								type="number" name="alturaJugador" placeholder="Altura"
								maxlength="3" />
							</label> <label class="">Pais <input required="required"
								type="text" name="paisJugador" placeholder="Pais" maxlength="20" />
							</label> <input name="opt" value="altaJugador"
								style="visibility: hidden;" />

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
						Error al añadir al Jugador.
						<%
							} else if (error.equalsIgnoreCase("jugador_existe")) {
						%>
						El Jugador ya esiste.
						<%
							}else if(error.equalsIgnoreCase("numeros_mal")){
						%>
						La altura debe ser un Número.
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
						Jugador añadido correctamente.
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
//Menú desplegable de Alta Jugador.
$(document).ready(function(){
 $("#equiposJugador").select2({
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