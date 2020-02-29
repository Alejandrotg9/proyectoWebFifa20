<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="fifa20.*"%>
<%@ page import="java.util.*"%>
<%
	BDController bdController = new BDController();
	ArrayList<Jugador> jugadores = bdController.dameJugadores();
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
							<td style="background-color: white;"><h2>Jugadores</h2></td>
							<td style="text-align: right; background-color: white;"></td>
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
								<td width='60' rowspan="2"><img width="80px"
									alt="<%=jugador.getNombre_jugador()%>"
									src="images/jugadores/<%=jugador.getCodigo_jugador()%>.png" /></td>
								<td width='325' colspan="3" style="padding-left: 15px;"><%=jugador.getNombre_jugador()%></td>

								<td rowspan="2" width='60' style="text-align: center;"><%=cartaJugador.getRat()%></td>
								<td rowspan="2" width='60' style="text-align: center;"><%=cartaJugador.getPos()%></td>
								<td rowspan="2" width='100' style="text-align: center;"><%=cartaJugador.getNombre_carta()%></td>
								<td rowspan="2" width='100' style="text-align: center;"><%=cartaJugador.getPrecio()%></td>
								<td rowspan="2" width='60' style="text-align: center;"><%=cartaJugador.getFiligranas()%></td>
								<td rowspan="2" width='60' style="text-align: center;"><%=cartaJugador.getPierna_mala()%></td>

								<td rowspan="2" width='60' style="text-align: center;"><%=cartaJugador.getPac()%></td>

								<td rowspan="2" width='60' style="text-align: center;"><%=cartaJugador.getSho()%></td>

								<td rowspan="2" width='60' style="text-align: center;"><%=cartaJugador.getPas()%></td>

								<td rowspan="2" width='60' style="text-align: center;"><%=cartaJugador.getDri()%></td>

								<td rowspan="2" width='60' style="text-align: center;"><%=cartaJugador.getDef()%></td>

								<td rowspan="2" width='60' style="text-align: center;"><%=cartaJugador.getPhy()%></td>
								<td rowspan="2" width='60' style="text-align: center;"><%=jugador.getAltura()%></td>

							</tr>
							<tr>
								<td width='45' style="text-align: right;"><img width="40px"
									alt="<%=jugador.getPais()%>"
									src="images/equipos/<%=equipoJugador.getCodigo_equipo()%>.png" /></td>
									
								<td width='50' style="text-align: center;"><img
									width="40px" alt="<%=jugador.getPais()%>"
									src="images/paises/<%=jugador.getPais()%>.png" /></td>
									
								<td width='230'><img width="40px"
									alt="<%=ligaJugador.getNombre_liga()%>"
									src="images/ligas/<%=ligaJugador.getCod_liga()%>.png" /></td>
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

