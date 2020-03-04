<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="fifa20.*"%>
<%@ page import="java.util.*"%>
<%
	BDController bdController = new BDController();
	ArrayList<Equipo> equipos = bdController.dameEquipos();
%>

<!-- INCLUYO LA CABECERA -->
<jsp:include page="includes/header.jsp" />

<!-- Main -->
<section class="wrapper style1">
	<div class="container">
		<div id="content">

			<!-- Content -->

			<article>
				<header>
					<h2>Equipos</h2>
				</header>

				<div class="table-wrapper">
					<table class="alt">
						<thead>
							<tr>
								<th>Nombre</th>
								<th width='195' colspan="3"></th>
								<th colspan="19">Plantilla</th>

							</tr>
						</thead>
						<%
							for (Equipo equipo : equipos) {
						%>
						<tbody>

							<tr>
								<td width='60' rowspan="2"><a
									href="equipo.jsp?codEquipo= <%=equipo.getCodigo_equipo()%>"><img
										width="60" title="<%=equipo.getNombre_equipo()%>"
										src="images/equipos/<%=equipo.getCodigo_equipo()%>.png" /></a></td>
								<td width='300' colspan="3"
									style="padding-left: 15px; font-size: 1.3rem; color: brown;"><strong><a
										href="equipo.jsp?codEquipo= <%=equipo.getCodigo_equipo()%>">
											<%=equipo.getNombre_equipo()%></a></strong></td>
								<%
									for (Jugador jugador : bdController.dameJugadoresEquipo(equipo.getCodigo_equipo())) {
								%>
								<td rowspan="2" width='60' style="text-align: center;"><a
									href="jugador.jsp?codJugador= <%=jugador.getCodigo_jugador()%>"><img
										width="65" title="<%=jugador.getNombre_jugador()%>"
										src="images/jugadores/<%=jugador.getCodigo_jugador()%>.png" /></a></td>
								<%
									}
								%>
							</tr>
							<tr>

								<td width='30' style="text-align: center; padding: 5px;"><a
									href="liga.jsp?codLiga= <%=equipo.getLiga().getCod_liga()%>"><img
										width="45" title="<%=equipo.getLiga().getNombre_liga()%>"
										src="images/ligas/<%=equipo.getLiga().getCod_liga()%>.png" /></a></td>
								<td width='30' style="text-align: center; padding: 5px;"><img
									width="45" title="<%=equipo.getLiga().getPais()%>"
									src="images/paises/<%=equipo.getLiga().getPais()%>.png" /></td>
								<td width='30' style="text-align: left; padding: 5px;"></td>
							</tr>


						</tbody>
						<%
							}
						%>
					</table>
				</div>


			</article>

		</div>
	</div>
</section>
<!-- INCLUYO EL FOOTER -->
<jsp:include page="includes/footer.jsp" />