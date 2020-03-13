<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="fifa20.*"%>
<%@ page import="java.util.*"%>

<%
	BDController bdController = new BDController();
	Jugador jugador = bdController.dameJugador(Integer.parseInt(request.getParameter("codJugador")));
	Carta carta = new Carta();
	
	if (request.getParameter("nombreCarta") == null) {
		 carta = bdController.dameCartaPorCodigoJugador(Integer.parseInt(request.getParameter("codJugador")));
	} else {
		 carta = bdController.dameCartaPorNombreCarta(request.getParameter("nombreCarta"));
	}
%>

<!-- INCLUYO LA CABECERA -->
<jsp:include page="includes/header.jsp" />

<section class="wrapper style1">
	<div class="container">
		<div id="content">

			<!-- Content -->

			<article>
				<header>
					<table
						style="background-color: white; border-color: white; margin: 0; padding: 0 0em 0em 0em;">
						<tr
							style="background-color: white; border-color: white; margin: 0; padding: 0 0em 0em 0em;">
							<td width="100"
								style="background-color: white; border-color: black; text-align: center; margin: 0; padding: 0 0em 0em 0em;"><h2></h2></td>
						</tr>
					</table>
				</header>
				<%
					
				%>
				<!-- Grid -->
				<div class="grid-containerGeneral">
					<div class="c1">
						<div class="grid-container"
							style="background-image: url('./images/cartas/<%= carta.getNombre_carta() %>.png');">
							<div class="A"><%=carta.getRat()%></div>
							<div class="B"><%=carta.getPos()%></div>
							<div class="C">
								<img width="45" alt="<%=jugador.getPais()%>"
									src="images/paises/<%=jugador.getPais()%>.png">
							</div>
							<div class="D">
								<a href="equipo.jsp?codEquipo=<%=jugador.getEquipo().getCodigo_equipo()%>"><img width="30"
									alt="<%=jugador.getEquipo().getNombre_equipo()%>"
									src="images/equipos/<%=jugador.getEquipo().getCodigo_equipo()%>.png"></a>
							</div>
							<div class="E">
								<img width="110px" alt="<%=jugador.getNombre_jugador()%>"
									src="./images/jugadores/<%=jugador.getCodigo_jugador()%>.png">
							</div>
							<div class="F"><%=jugador.getNombre_jugador()%></div>
							<div class="G">
								<%=carta.getPac()%>
								PAC &nbsp;&nbsp;|&nbsp;&nbsp;
								<%=carta.getDri()%>
								DRI<br>
								<%=carta.getSho()%>
								SHO &nbsp;|&nbsp;&nbsp;
								<%=carta.getDef()%>
								DEF<br><%=carta.getPas()%>
								PAS &nbsp;&nbsp;|&nbsp;&nbsp;
								<%=carta.getPhy()%>
								PHY
							</div>
						</div>
					</div>
					<div class="b">
						<div class="grid-container2">
							<div class="grid-container2">
								<div class="a2">PACE</div>
								<div class="b2"
									style="color:<%=Operaciones.ponerCssBarras(carta.getPac())[0]%>"><%=carta.getPac()%></div>
								<div class="c2"
									style="background-color: <%=Operaciones.ponerCssBarras(carta.getPac())[0]%>; width:<%=Operaciones.ponerCssBarras(carta.getPac())[1]%>px"></div>

								<div class="d2">SHOOTING</div>
								<div class="e2"
									style="color:<%=Operaciones.ponerCssBarras(carta.getSho())[0]%>;"><%=carta.getSho()%></div>
								<div class="f2"
									style="background-color: <%=Operaciones.ponerCssBarras(carta.getSho())[0]%>; width: <%=Operaciones.ponerCssBarras(carta.getSho())[1]%>px;"></div>

								<div class="g2">PASSING</div>
								<div class="h2"
									style="color: <%=Operaciones.ponerCssBarras(carta.getPas())[0]%>;"><%=carta.getPas()%></div>
								<div class="i2"
									style="background-color: <%=Operaciones.ponerCssBarras(carta.getPas())[0]%>; width: <%=Operaciones.ponerCssBarras(carta.getPas())[1]%>px;"></div>

								<div class="j2">DRIBBLING</div>
								<div class="k2"
									style="color: <%=Operaciones.ponerCssBarras(carta.getDri())[0]%>;"><%=carta.getDri()%></div>
								<div class="l2"
									style="background-color: <%=Operaciones.ponerCssBarras(carta.getDri())[0]%>; width: <%=Operaciones.ponerCssBarras(carta.getDri())[1]%>px;"></div>

								<div class="m2">DEFENDING</div>
								<div class="n2"
									style="color: <%=Operaciones.ponerCssBarras(carta.getDef())[0]%>;"><%=carta.getDef()%></div>
								<div class="o2"
									style="background-color: <%=Operaciones.ponerCssBarras(carta.getDef())[0]%>; width: <%=Operaciones.ponerCssBarras(carta.getDef())[1]%>px;"></div>

								<div class="p2">PHYSICALITY</div>
								<div class="q2"
									style="color: <%=Operaciones.ponerCssBarras(carta.getPhy())[0]%>;"><%=carta.getPhy()%></div>
								<div class="r2"
									style="background-color: <%=Operaciones.ponerCssBarras(carta.getPhy())[0]%>; width: <%=Operaciones.ponerCssBarras(carta.getPhy())[1]%>px;"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="grid-containerGeneral">
					<div class="c1"
						style="padding-left: 5px; padding-top: 5px; text-align: center;">
						<%
							ArrayList<Carta> cartasJugador = bdController.dameCartasPorCodigoJugador(jugador.getCodigo_jugador());
							if (cartasJugador.size() > 1) {
						%>
						<table
							style="border-color: white; background-color: white;">
							<tr style="border-color: white; background-color: white;">
								<%
									for (int i = 0; i < cartasJugador.size(); i++) {
								%>
								<td style="border-color: white; background-color: white;"><a
									href="jugador.jsp?codJugador=<%=jugador.getCodigo_jugador()%>&nombreCarta=<%=cartasJugador.get(i).getNombre_carta()%>"><div
											class="Simple" style="text-align: center;"><%=cartasJugador.get(i).getRat()%></div></a></td>
								<%
									}
								%>
							</tr>
						</table>
						<%
							}
						%>
					</div>


					<div class="b"></div>
				</div>
			</article>

		</div>
	</div>
</section>

<!-- INCLUYO EL FOOTER -->
<jsp:include page="includes/footer.jsp" />