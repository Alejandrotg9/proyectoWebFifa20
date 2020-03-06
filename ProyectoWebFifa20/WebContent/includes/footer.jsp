<!-- Footer -->
<div id="footer">
	<div class="container">
		<div class="row">
			<section class="col-3 col-6-narrower col-12-mobilep">
				<h3>Listados</h3>
				<ul class="links">
					<li><a href="jugadores.asp">Listado de Ligas</a></li>


				</ul>
			</section>
			<section class="col-3 col-6-narrower col-12-mobilep">
				<h3>Más Opciones</h3>
				<ul class="links">
					<li><a href="operaciones.jsp?tipo=altaJugador">Opción 1</a></li>

				</ul>
			</section>
			<section class="col-6 col-12-narrower">
				<h3>Solicita Información</h3>
				<form method="get" action="./buscar.jsp">
					<div class="row gtr-50">
						<div class="col-6 col-12-mobilep" style="width: 450px;">
							<input required="required" type="text" name="query" id="name" placeholder="Introduzca el nombre de un Equipo, Jugador o Liga." />
						</div>

						<div class="col-6 col-12-mobilep">
							<select id ="select-search" name="opcion" required="required">
								<option value="jugador">Jugador</option>
								<option value="equipo">Equipo</option>
								<option value="liga">Liga</option>
							</select>
						</div>
						<div class="col-12">
							<ul class="actions">
								<li><input type="submit" class="button alt"
									value="Buscar" /></li>
							</ul>
						</div>
					</div>
				</form>
			</section>
		</div>
	</div>

	<!-- Icons -->
	<ul class="icons">
		<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
		<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
		<li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
		<li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
	</ul>

	<!-- Copyright -->
	<div class="copyright">
		<ul class="menu">
			<li>&copy; FIFA 20. Todos los derechos reservados</li>
			<li>Design: <a href="https://www.centronelson.org">Centro
					Nelson</a></li>
		</ul>
	</div>

</div>

</div>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>