<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="fifa20.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<%
	BDController bdController = new BDController();
	String opt = request.getParameter("opt");

	switch (opt) {
	case "altaJugador":
		String nombre = request.getParameter("nombreJugador");
		int codEquipo = Integer.parseInt(request.getParameter("codEquipo"));
		String pierna = request.getParameter("piernaJugador");
		int altura = Integer.parseInt(request.getParameter("alturaJugador"));
		String pais = request.getParameter("paisJugador");

		Equipo equipoJugador = bdController.dameEquipoPorCodigo(codEquipo);

		Jugador nuevoJugador = new Jugador(Operaciones.ponerCodJugador(), nombre, equipoJugador, pierna, altura,
				pais);

		if (!bdController.existeJugador(nuevoJugador.getCodigo_jugador())) {

			if (bdController.altaJugador(nuevoJugador)) {
				response.sendRedirect("./alta-jugador.jsp?estado=opt_completada");
			} else {
				response.sendRedirect("./alta-jugador.jsp?error=opt_fallida");
			}
		} else {
			response.sendRedirect("./alta-jugador.jsp?error=jugador_existe");
		}
		break;

	case "bajaJugador":
		int codJugador = Integer.parseInt(request.getParameter("codJugador"));

		if (bdController.existeJugador(codJugador)) {

			if (bdController.eliminarJugador(codJugador)) {
				response.sendRedirect("./baja-jugador.jsp?estado=opt_completada");
			} else {
				response.sendRedirect("./baja-jugador.jsp?error=opt_fallida");
			}
		} else {
			response.sendRedirect("./baja-jugador.jsp?error=jugador_no_existe");
		}
		break;

	case "bajaEquipo":
		int codEquipoBaja = Integer.parseInt(request.getParameter("codEquipo"));

		if (bdController.existeEquipo(codEquipoBaja)) {

			if (bdController.eliminarEquipo(codEquipoBaja)) {
				response.sendRedirect("./baja-equipo.jsp?estado=opt_completada");
			} else {
				response.sendRedirect("./baja-equipo.jsp?error=opt_fallida");
			}
		} else {
			response.sendRedirect("./baja-equipo.jsp?error=equipo_no_existe");
		}
		break;

	case "bajaLiga":
		int codLiga = Integer.parseInt(request.getParameter("codLiga"));

		if (bdController.existeLiga(codLiga)) {

			if (bdController.eliminarLiga(codLiga)) {
				response.sendRedirect("./baja-liga.jsp?estado=opt_completada");
			} else {
				response.sendRedirect("./baja-liga.jsp?error=opt_fallida");
			}
		} else {
			response.sendRedirect("./baja-liga.jsp?error=liga_no_existe");
		}
		break;
	default:
		response.sendRedirect("../index.jsp");
		break;
	}
%>