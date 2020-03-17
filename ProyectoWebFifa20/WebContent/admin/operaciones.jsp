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

		if (bdController.altaJugador(nuevoJugador)) {
			response.sendRedirect("./alta-jugador.jsp?estado=opt_completada");
		} else {
			response.sendRedirect("./alta-jugador.jsp?error=opt_fallida");
		}

		break;
	case "bajaJugador":
		int codJugador = Integer.parseInt(request.getParameter("codJugador"));
		
		if (bdController.eliminarJugador(codJugador)) {
			response.sendRedirect("./baja-jugador.jsp?estado=opt_completada");
		} else {
			response.sendRedirect("./baja-jugador.jsp?error=opt_fallida");
		}
		break;
	default:
		response.sendRedirect("../index.jsp");
		break;
	}
%>