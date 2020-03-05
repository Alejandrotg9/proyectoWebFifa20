<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="fifa20.*"%>
<%@ page import="java.util.*"%>

<%
	BDController bdController = new BDController();
	Jugador jugador = bdController.dameJugador(Integer.parseInt(request.getParameter("codJugador")));
	Carta carta = bdController.dameCartaPorCodigoJugador(jugador.getCodigo_jugador());
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
							style="background-image: url('./images/cartas/carta1.png');">
							<div class="A"><%= carta.getRat() %></div>
							<div class="B"><%= carta.getPos() %></div>
							<div class="C"></div>
							<div class="D"></div>
							<div class="E"><img alt="<%= jugador.getNombre_jugador() %>" src="./images/jugadores/<%= jugador.getCodigo_jugador()%>.png"></div>
							<div class="F"><%= jugador.getNombre_jugador() %></div>
							<div class="G">
								<%= carta.getPac()%> PAC &nbsp;&nbsp;|&nbsp;&nbsp; <%= carta.getDri()%> DRI<br> <%= carta.getSho()%> SHO
								&nbsp;|&nbsp;&nbsp; <%= carta.getDef()%> DEF<br><%= carta.getPas()%> PAS
								&nbsp;&nbsp;|&nbsp;&nbsp; <%= carta.getPhy()%> PHY
							</div>
						</div>
					</div>
					<div class="b">
						<%
							
						%>
						<div class="grid-container2">
							<div class="grid-container2">
								<div class="a2">PACE</div>
								<div class="b2" style="color: #4caf50;"><%= carta.getPac()%></div>
								<div class="c2" style="background-color: #4caf50; width:"<%= carta.getPac()%>px;"></div>

								<%
									
								%>
								<div class="d2">SHOOTING</div>
								<div class="e2" style="color: #4caf50;">88</div>
								<div class="f2" style="background-color: #4caf50; width: 300px;"></div>
								<%
									
								%>

								<div class="g2">PASSING</div>
								<div class="h2" style="color: #e9bc0b;">88</div>
								<div class="i2" style="background-color: #e9bc0b; width: 280px;"></div>
								<%
									
								%>
								<div class="j2">DRIBBLING</div>
								<div class="k2" style="color: #fb8c00;">88</div>
								<div class="l2" style="background-color: #fb8c00; width: 120px;"></div>
								<%
									
								%>
								<div class="m2">DEFENDING</div>
								<div class="n2" style="color: #4caf50;">88</div>
								<div class="o2" style="background-color: #4caf50; width: 240px;"></div>
								<%
									
								%>
								<div class="p2">PHYSICALITY</div>
								<div class="q2" style="color: #4caf50;">88</div>
								<div class="r2" style="background-color: #4caf50; width: 200px;"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="grid-containerGeneral">
					<div class="c1"
						style="padding-left: 5px; padding-top: 5px; text-align: center;">
						<table style="border-color: white; background-color: white;">
							<tr style="border-color: white; background-color: white;">
								<td style="border-color: white; background-color: white;"><div
										class="Simple" style="text-align: center;">94</div></td>

								<td style="border-color: white; background-color: white;"><div
										class='Simple' style="text-align: center;">97</div></td>
								<td style="border-color: white; background-color: white;"><div
										class='Simple' style="text-align: center;">98</div></td>
								<td style="border-color: white; background-color: white;"><div
										class='Simple' style="text-align: center;">99</div></td>
							</tr>
						</table>
					</div>


					<div class="b"></div>
				</div>
			</article>

		</div>
	</div>
</section>

<!-- INCLUYO EL FOOTER -->
<jsp:include page="includes/footer.jsp" />