<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="fifa20.*"%>
<%@ page import="java.util.*"%>
<%
	BDController bdController = new BDController();
	ArrayList<Liga> ligas = bdController.dameLigas();
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
					<h2>Ligas</h2>
				</header>

				<div class="table-wrapper">
					<table class="alt">
						<thead>
							<tr>
								<th>Nombre</th>
								<th width='195' colspan="3"></th>
								<th colspan="19">Equipos</th>

							</tr>
						</thead>
						<% for(Liga liga : ligas){ %>
						<tbody>

							<tr>
								<td width='60' rowspan="2"><img width="60" title="<%= liga.getNombre_liga()%>" src="images/ligas/<%= liga.getCod_liga()%>.png"/></td>
								<td width='300' colspan="3" style="padding-left: 15px; font-size: 1.3rem; color: brown;"><strong> <%= liga.getNombre_liga() %></strong></td>
								<%for(Equipo equipo : bdController.dameEquiposLiga(liga.getCod_liga())){ %>
								<td rowspan="2" width='60' style="text-align: center;"><img width="40" title="<%= equipo.getNombre_equipo()%>" src="images/equipos/<%= equipo.getCodigo_equipo()%>.png"/></td>
									<%} %>
							</tr>
							<tr>

								<td width='50' style="text-align: left; padding: 10px;"><img width="40" title="<%= liga.getPais()%>" src ="images/paises/<%= liga.getPais()%>.png"/></td>
								<td width='205'></td>
							</tr>


						</tbody>
						<%} %>
					</table>
				</div>


			</article>

		</div>
	</div>
</section>
<!-- INCLUYO EL FOOTER -->
<jsp:include page="includes/footer.jsp" />