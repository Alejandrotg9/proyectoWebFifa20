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
		String altura = request.getParameter("alturaJugador");
		String pais = request.getParameter("paisJugador");

		Equipo equipoJugador = bdController.dameEquipoPorCodigo(codEquipo);

		if (!altura.isEmpty() && Operaciones.esNumero(altura)) {
			int alturaJugador = Integer.parseInt(altura);

			Jugador nuevoJugador = new Jugador(Operaciones.ponerCodJugador(), nombre, equipoJugador, pierna,
					alturaJugador, pais);

			if (!bdController.existeJugador(nuevoJugador.getCodigo_jugador())) {

				if (bdController.altaJugador(nuevoJugador)) {
					response.sendRedirect("./alta-jugador.jsp?estado=opt_completada");
				} else {
					response.sendRedirect("./alta-jugador.jsp?error=opt_fallida");
				}
			} else {
				response.sendRedirect("./alta-jugador.jsp?error=jugador_existe");
			}

		} else {
			response.sendRedirect("./alta-jugador.jsp?error=altura_mal");
		}

		break;

	case "bajaJugador":
		String codJugador = request.getParameter("codJugador");

		if (!codJugador.isEmpty() && Operaciones.esNumero(codJugador)) {
			int numJugador = Integer.parseInt(codJugador);
			if (bdController.existeJugador(numJugador)) {

				if (bdController.eliminarJugador(numJugador)) {
					response.sendRedirect("./baja-jugador.jsp?estado=opt_completada");
				} else {
					response.sendRedirect("./baja-jugador.jsp?error=opt_fallida");
				}
			} else {
				response.sendRedirect("./baja-jugador.jsp?error=jugador_no_existe");
			}
		} else {
			response.sendRedirect("./baja-jugador.jsp?error=codigo_mal");
		}
		break;

	case "bajaEquipo":
		String codEquipoBaja = request.getParameter("codEquipo");

		if (!codEquipoBaja.isEmpty() && Operaciones.esNumero(codEquipoBaja)) {
			int numEquipoBaja = Integer.parseInt(codEquipoBaja);

			if (bdController.existeEquipo(numEquipoBaja)) {

				if (bdController.eliminarEquipo(numEquipoBaja)) {
					response.sendRedirect("./baja-equipo.jsp?estado=opt_completada");
				} else {
					response.sendRedirect("./baja-equipo.jsp?error=opt_fallida");
				}
			} else {
				response.sendRedirect("./baja-equipo.jsp?error=equipo_no_existe");
			}
		} else {
			response.sendRedirect("./baja-equipo.jsp?error=codigo_mal");
		}
		break;

	case "bajaLiga":
		String codLiga = request.getParameter("codLiga");

		if (!codLiga.isEmpty() && Operaciones.esNumero(codLiga)) {
			int numLiga = Integer.parseInt(codLiga);

			if (bdController.existeLiga(numLiga)) {

				if (bdController.eliminarLiga(numLiga)) {
					response.sendRedirect("./baja-liga.jsp?estado=opt_completada");
				} else {
					response.sendRedirect("./baja-liga.jsp?error=opt_fallida");
				}
			} else {
				response.sendRedirect("./baja-liga.jsp?error=liga_no_existe");
			}
		} else {
			response.sendRedirect("./baja-liga.jsp?error=codigo_mal");
		}
		break;
	default:
		response.sendRedirect("../index.jsp");
		break;
	}
%>