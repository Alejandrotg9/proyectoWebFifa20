<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="fifa20.*"%>
<%@ page import="java.util.*"%>
<%
	BDController bdController = new BDController();
	ArrayList<Jugador> jugadores = bdController
			.dameJugadoresEquipo(Integer.parseInt(request.getParameter("codEquipo")));
	Equipo equipo = bdController.dameEquipo(Integer.parseInt(request.getParameter("codEquipo")));
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
					<table>
						<tr style="border: 0px;">
						<img width="100" src="./images/equipos/<%= equipo.getCodigo_equipo()%>.png" style="margin-top: 1.5rem"/>
							<td style="background-color: white;"><h2 style="margin-bottom: -1.5rem;"><%= equipo.getNombre_equipo() %></h2></td>
						</tr>
					</table>
				</header>
				<div class="table-wrapper">
					<table class="alt">
						<thead>
							<tr>
								<th>Nombre</th>
								<th width='325' colspan="3"></th>
								<th style="text-align: center;">RAT</th>
								<th style="text-align: center;">POS</th>
								<th style="text-align: center;">CARTA</th>
								<th style="text-align: center;">PRECIO</th>
								<th style="text-align: center;">SKI</th>
								<th style="text-align: center;">WF</th>
								<th style="text-align: center;">PAC</th>
								<th style="text-align: center;">SHO</th>
								<th style="text-align: center;">PAS</th>
								<th style="text-align: center;">DRI</th>
								<th style="text-align: center;">DEF</th>
								<th style="text-align: center;">PHI</th>
								<th style="text-align: center;">ALTURA</th>
							</tr>
						</thead>
						<%
							for (Jugador jugador : jugadores) {
								Carta cartaJugador = bdController.dameCartaPorCodigoJugador(jugador.getCodigo_jugador());
								Liga ligaJugador = bdController.dameLigaPorCodigoJugador(jugador.getCodigo_jugador());
								Equipo equipoJugador = bdController.dameEquipoPorCodigoJugador(jugador.getCodigo_jugador());
						%>
						<tbody>

							<tr>
								<td width='60' rowspan="2"><a
									href="jugador.jsp?codJugador=<%=jugador.getCodigo_jugador()%>"><img
										width="80px" alt="<%=jugador.getNombre_jugador()%>"
										title="<%=jugador.getNombre_jugador()%>"
										src="images/jugadores/<%=jugador.getCodigo_jugador()%>.png" /></a></td>
								<td width='325' colspan="3" style="padding-left: 15px;"><%=jugador.getNombre_jugador()%></td>

								<td rowspan="2" width='60' style="text-align: center;"><div
										class="<%=Operaciones.ponerCssEstadisticas(cartaJugador.getRat())%>"><%=cartaJugador.getRat()%></div></td>
								<td rowspan="2" width='60' style="text-align: center;"><%=cartaJugador.getPos()%></td>
								<td rowspan="2" width='100' style="text-align: center;"><%=cartaJugador.getNombre_carta()%></td>
								<td rowspan="2" width='100' style="text-align: center;"><%=cartaJugador.getPrecio()%></td>
								<td rowspan="2" width='60' style="text-align: center;"><%=cartaJugador.getFiligranas()%></td>
								<td rowspan="2" width='60' style="text-align: center;"><%=cartaJugador.getPierna_mala()%></td>

								<td rowspan="2" width="60" style="text-align: center;"><div
										class="<%=Operaciones.ponerCssEstadisticas(cartaJugador.getPac())%>"><%=cartaJugador.getPac()%></div></td>

								<td rowspan="2" width="60" style="text-align: center;"><div
										class="<%=Operaciones.ponerCssEstadisticas(cartaJugador.getSho())%>"><%=cartaJugador.getSho()%></div></td>

								<td width="60" rowspan="2" style="text-align: center;"><div
										class="<%=Operaciones.ponerCssEstadisticas(cartaJugador.getPas())%>"><%=cartaJugador.getPas()%></div></td>

								<td width="60" rowspan="2" style="text-align: center;"><div
										class="<%=Operaciones.ponerCssEstadisticas(cartaJugador.getDri())%>"><%=cartaJugador.getDri()%></div></td>

								<td width="60" rowspan="2" style="text-align: center;"><div
										class="<%=Operaciones.ponerCssEstadisticas(cartaJugador.getDef())%>"><%=cartaJugador.getDef()%></div></td>

								<td width="60" rowspan="2" style="text-align: center;"><div
										class="<%=Operaciones.ponerCssEstadisticas(cartaJugador.getPhy())%>"><%=cartaJugador.getPhy()%></div></td>

								<td rowspan="2" width='60' style="text-align: center;"><%=jugador.getAltura()%>
									cm</td>

							</tr>
							<tr>
								<td width='45' style="text-align: right;"><a
									href="equipo.jsp?codEquipo=<%=equipoJugador.getCodigo_equipo()%>"><img
										width="40px" alt="<%=equipoJugador.getNombre_equipo()%>"
										title="<%=equipoJugador.getNombre_equipo()%>"
										src="images/equipos/<%=equipoJugador.getCodigo_equipo()%>.png" /></a></td>

								<td width='50' style="text-align: center;"><img
									width="40px" alt="<%=jugador.getPais()%>"
									title="<%=jugador.getPais()%>"
									src="images/paises/<%=jugador.getPais()%>.png" /></td>

								<td width='230'><a
									href="liga.jsp?codLiga=<%=ligaJugador.getCod_liga()%>"><img
										width="40px" alt="<%=ligaJugador.getNombre_liga()%>"
										title="<%=ligaJugador.getNombre_liga()%>"
										src="images/ligas/<%=ligaJugador.getCod_liga()%>.png" /></a></td>
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