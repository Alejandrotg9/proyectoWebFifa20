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
		String codEquipo = request.getParameter("codEquipo");
		String pierna = request.getParameter("piernaJugador");
		String altura = request.getParameter("alturaJugador");
		String pais = request.getParameter("paisJugador");

		if (!altura.isEmpty() && Operaciones.esNumero(altura) && !codEquipo.isEmpty()
				&& Operaciones.esNumero(codEquipo)) {

			int codigoEquipo = Integer.parseInt(codEquipo);
			int alturaJugador = Integer.parseInt(altura);

			Equipo equipoJugador = bdController.dameEquipoPorCodigo(codigoEquipo);
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
			response.sendRedirect("./alta-jugador.jsp?error=numeros_mal");
		}

		break;

	case "altaLiga":
		String nombreLiga = request.getParameter("nombreLiga");
		String paisLiga = request.getParameter("paisLiga");

		if (!nombreLiga.isEmpty() && !paisLiga.isEmpty()) {
			Liga nuevaLiga = new Liga(Operaciones.ponerCodLiga(), nombreLiga, paisLiga);

			if (!bdController.existeLigaPorNombre(nuevaLiga.getNombre_liga())) {
				if (bdController.altaLiga(nuevaLiga)) {
					response.sendRedirect("./alta-liga.jsp?estado=opt_completada");
				} else {
					response.sendRedirect("./alta-liga.jsp?error=opt_fallida");
				}
			} else {
				response.sendRedirect("./alta-liga.jsp?error=liga_existe");
			}
		} else {
			response.sendRedirect("./alta-liga.jsp?error=campos_vacios");
		}

		break;
	case "altaEquipo":
		String nombreEquipo = request.getParameter("nombreEquipo");
		String codLigaNuevoEquipo = request.getParameter("codLiga");

		if (!nombreEquipo.isEmpty() && Operaciones.esNumero(codLigaNuevoEquipo)) {
			int codigoLiga = Integer.parseInt(codLigaNuevoEquipo);
			Liga nuevaLiga = bdController.dameLigaPorCodigo(codigoLiga);
			Equipo nuevoEquipo = new Equipo(Operaciones.ponerCodEquipo(), nombreEquipo, nuevaLiga);

			if (!bdController.existeEquipoPorNombre(nuevoEquipo.getNombre_equipo())) {
				if (bdController.altaEquipo(nuevoEquipo)) {
					response.sendRedirect("./alta-equipo.jsp?estado=opt_completada");
				} else {
					response.sendRedirect("./alta-equipo.jsp?error=opt_fallida");
				}
			} else {
				response.sendRedirect("./alta-equipo.jsp?error=equipo_existe");
			}

		} else {
			response.sendRedirect("./alta-equipo.jsp?error=campos_erroneos");
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