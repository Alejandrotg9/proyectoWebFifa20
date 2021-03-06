package fifa20;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class BDController {

	private Connection myConnection;
	private String db_server = "localhost:3306";
	private String db = "fifa?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private String db_user = "root";
	private String db_user_password = "Alex2255";

	public BDController() {
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			this.myConnection = DriverManager.getConnection("jdbc:mysql://" + db_server + "/" + db, db_user,
					db_user_password);
		} catch (SQLException e) {
			System.out.println("Error en el constructor vac�o del BDController: " + e.getMessage());
		}
	}

	public Connection getMyConnection() {
		return myConnection;
	}

	public void setMyConnection(Connection myConnection) {
		this.myConnection = myConnection;
	}

	/**** OPERACIONES CON JUGADORES ****/

	public ArrayList<Jugador> dameJugadores() {
		ArrayList<Jugador> jugadores = new ArrayList<Jugador>();
		Statement myStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT * FROM jugadores";

		try {
			myStatement = this.myConnection.createStatement();
			myResultSet = myStatement.executeQuery(query);

			while (myResultSet.next()) {
				Equipo equipo = dameEquipoPorCodigo(myResultSet.getInt("cod_equipo"));
				jugadores.add(new Jugador(myResultSet.getInt("cod_jugador"), myResultSet.getString("nombre"), equipo,
						myResultSet.getString("pierna"), myResultSet.getInt("altura"), myResultSet.getString("pais")));
			}
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				myStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return null;
			}
		}
		return jugadores;
	}

	public ArrayList<Jugador> dameJugadoresEquipo(int codEquipo) {
		ArrayList<Jugador> jugadores = new ArrayList<Jugador>();
		PreparedStatement myPreparedStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT * FROM jugadores WHERE cod_equipo = ?";

		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, codEquipo);
			myResultSet = myPreparedStatement.executeQuery();

			while (myResultSet.next()) {
				Equipo equipo = dameEquipoPorCodigo(myResultSet.getInt("cod_equipo"));
				jugadores.add(new Jugador(myResultSet.getInt("cod_jugador"), myResultSet.getString("nombre"), equipo,
						myResultSet.getString("pierna"), myResultSet.getInt("altura"), myResultSet.getString("pais")));
			}
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				myPreparedStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return null;
			}
		}
		return jugadores;
	}

	public Jugador dameJugador(int codJugador) {
		Jugador jugador = new Jugador();
		PreparedStatement myPreparedStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT * FROM jugadores WHERE cod_jugador = ?";

		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, codJugador);
			myResultSet = myPreparedStatement.executeQuery();

			while (myResultSet.next()) {
				Equipo equipo = dameEquipoPorCodigo(myResultSet.getInt("cod_equipo"));
				jugador = new Jugador(myResultSet.getInt("cod_jugador"), myResultSet.getString("nombre"), equipo,
						myResultSet.getString("pierna"), myResultSet.getInt("altura"), myResultSet.getString("pais"));
			}
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				myPreparedStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return null;
			}
		}
		return jugador;
	}

	public Integer dameCodUltimoJugador() {
		int codJugador = 0;
		Statement myStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT MAX(cod_jugador) codJugador FROM jugadores";

		try {
			myStatement = this.myConnection.createStatement();
			myResultSet = myStatement.executeQuery(query);

			while (myResultSet.next()) {
				codJugador = myResultSet.getInt("codJugador");
			}
		} catch (SQLException e) {
			return 0;
		} finally {
			try {
				myStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return 0;
			}
		}
		return codJugador;
	}

	public boolean altaJugador(Jugador jugador) {
		boolean correcto = false;
		PreparedStatement myPreparedStatement = null;
		String query = "INSERT INTO jugadores(cod_jugador, nombre, cod_equipo, pierna, altura, pais) VALUES (?,?,?,?,?,?)";
		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, jugador.getCodigo_jugador());
			myPreparedStatement.setString(2, jugador.getNombre_jugador());
			myPreparedStatement.setInt(3, jugador.getEquipo().getCodigo_equipo());
			myPreparedStatement.setString(4, jugador.getPierna());
			myPreparedStatement.setInt(5, jugador.getAltura());
			myPreparedStatement.setString(6, jugador.getPais());
			myPreparedStatement.executeUpdate();

			correcto = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				myPreparedStatement.close();
			} catch (SQLException e) {
				return false;
			}
		}
		return correcto;
	}

	public boolean eliminarJugador(int codJugador) {
		boolean eliminado = false;
		PreparedStatement myPreparedStatement = null;
		String query = "DELETE FROM jugadores WHERE cod_jugador = ?";
		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, codJugador);
			myPreparedStatement.executeUpdate();

			eliminado = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				myPreparedStatement.close();
			} catch (SQLException e) {
				return false;
			}
		}
		return eliminado;
	}

	public boolean existeJugador(int codJugador) {
		boolean existe = false;
		PreparedStatement myPreparedStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT cod_jugador FROM jugadores WHERE cod_jugador = ?";

		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, codJugador);
			myResultSet = myPreparedStatement.executeQuery();

			while (myResultSet.next()) {
				existe = true;
			}
		} catch (SQLException e) {
			return false;
		} finally {
			try {
				myPreparedStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return false;
			}
		}
		return existe;
	}

	/**** OPERACIONES CON LIGAS ****/

	public ArrayList<Liga> dameLigas() {
		ArrayList<Liga> ligas = new ArrayList<Liga>();
		Statement myStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT * FROM ligas";

		try {
			myStatement = this.myConnection.createStatement();
			myResultSet = myStatement.executeQuery(query);

			while (myResultSet.next()) {
				ligas.add(new Liga(myResultSet.getInt("cod_liga"), myResultSet.getString("nombre"),
						myResultSet.getString("pais")));
			}
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				myStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return null;
			}
		}
		return ligas;
	}

	public Liga dameLiga(int codLiga) {
		Liga liga = new Liga();
		PreparedStatement myPreparedStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT * FROM ligas WHERE cod_liga = ?";

		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, codLiga);
			myResultSet = myPreparedStatement.executeQuery();

			while (myResultSet.next()) {
				liga = new Liga(myResultSet.getInt("cod_liga"), myResultSet.getString("nombre"),
						myResultSet.getString("pais"));
			}
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				myPreparedStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return null;
			}
		}
		return liga;
	}

	public Liga dameLigaPorCodigo(int codLiga) {
		Liga liga = new Liga();
		PreparedStatement myPreparedStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT * FROM ligas WHERE cod_liga = ?";

		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, codLiga);
			myResultSet = myPreparedStatement.executeQuery();

			while (myResultSet.next()) {
				liga = new Liga(myResultSet.getInt("cod_liga"), myResultSet.getString("nombre"),
						myResultSet.getString("pais"));
			}
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				myPreparedStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return null;
			}
		}
		return liga;
	}

	public Liga dameLigaPorCodigoJugador(int codJugador) {
		Liga liga = new Liga();
		PreparedStatement myPreparedStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT l.* FROM ligas l, equipos e, jugadores j WHERE j.cod_equipo = e.cod_equipo AND e.cod_liga = l.cod_liga AND j.cod_jugador = ?";

		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, codJugador);
			myResultSet = myPreparedStatement.executeQuery();

			while (myResultSet.next()) {
				liga = new Liga(myResultSet.getInt("cod_liga"), myResultSet.getString("nombre"),
						myResultSet.getString("pais"));
			}
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				myPreparedStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return null;
			}
		}
		return liga;
	}

	public boolean existeLiga(int codLiga) {
		boolean existe = false;
		PreparedStatement myPreparedStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT cod_liga FROM ligas WHERE cod_liga = ?";

		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, codLiga);
			myResultSet = myPreparedStatement.executeQuery();

			while (myResultSet.next()) {
				existe = true;
			}
		} catch (SQLException e) {
			return false;
		} finally {
			try {
				myPreparedStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return false;
			}
		}
		return existe;
	}

	public boolean existeLigaPorNombre(String nombreLiga) {
		boolean existe = false;
		PreparedStatement myPreparedStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT nombre FROM ligas WHERE nombre = ?";

		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setString(1, nombreLiga);
			myResultSet = myPreparedStatement.executeQuery();

			while (myResultSet.next()) {
				existe = true;
			}
		} catch (SQLException e) {
			return false;
		} finally {
			try {
				myPreparedStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return false;
			}
		}
		return existe;
	}

	public Integer dameCodUltimaLiga() {
		int codJugador = 0;
		Statement myStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT MAX(cod_liga) codLiga FROM ligas";

		try {
			myStatement = this.myConnection.createStatement();
			myResultSet = myStatement.executeQuery(query);

			while (myResultSet.next()) {
				codJugador = myResultSet.getInt("codLiga");
			}
		} catch (SQLException e) {
			return 0;
		} finally {
			try {
				myStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return 0;
			}
		}
		return codJugador;
	}

	public boolean eliminarLiga(int codLiga) {
		boolean eliminado = false;
		PreparedStatement myPreparedStatement = null;
		String query = "DELETE FROM ligas WHERE cod_liga = ?";
		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, codLiga);
			myPreparedStatement.executeUpdate();

			eliminado = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				myPreparedStatement.close();
			} catch (SQLException e) {
				return false;
			}
		}
		return eliminado;
	}

	public boolean altaLiga(Liga liga) {
		boolean anadido = false;
		PreparedStatement myPreparedStatement = null;
		String query = "INSERT INTO ligas VALUES(?,?,?)";
		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, liga.getCod_liga());
			myPreparedStatement.setString(2, liga.getNombre_liga());
			myPreparedStatement.setString(3, liga.getPais());
			myPreparedStatement.executeUpdate();

			anadido = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				myPreparedStatement.close();
			} catch (SQLException e) {
				return false;
			}
		}
		return anadido;
	}

	/**** OPERACIONES CON EQUIPOS ****/

	public ArrayList<Equipo> dameEquipos() {
		ArrayList<Equipo> equipos = new ArrayList<Equipo>();
		Statement myStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT * FROM equipos";

		try {
			myStatement = this.myConnection.createStatement();
			myResultSet = myStatement.executeQuery(query);

			while (myResultSet.next()) {
				Liga liga = dameLigaPorCodigo(myResultSet.getInt("cod_liga"));
				equipos.add(new Equipo(myResultSet.getInt("cod_equipo"), myResultSet.getString("nombre"), liga));
			}
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				myStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return null;
			}
		}
		return equipos;
	}

	public Equipo dameEquipo(int codEquipo) {
		Equipo equipo = new Equipo();
		PreparedStatement myPreparedStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT * FROM equipos WHERE cod_equipo = ?";

		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, codEquipo);
			myResultSet = myPreparedStatement.executeQuery();

			while (myResultSet.next()) {
				Liga liga = dameLigaPorCodigo(myResultSet.getInt("cod_liga"));
				equipo = new Equipo(myResultSet.getInt("cod_equipo"), myResultSet.getString("nombre"), liga);
			}
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				myPreparedStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return null;
			}
		}
		return equipo;
	}

	public Equipo dameEquipoPorCodigo(int codEquipo) {
		Equipo equipo = new Equipo();
		PreparedStatement myPreparedStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT * FROM equipos WHERE cod_equipo = ?";

		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, codEquipo);
			myResultSet = myPreparedStatement.executeQuery();

			while (myResultSet.next()) {
				Liga liga = dameLigaPorCodigo(myResultSet.getInt("cod_liga"));
				equipo = new Equipo(myResultSet.getInt("cod_equipo"), myResultSet.getString("nombre"), liga);
			}
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				myPreparedStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return null;
			}
		}
		return equipo;
	}

	public Equipo dameEquipoPorCodigoJugador(int codJugador) {
		Equipo equipo = new Equipo();
		PreparedStatement myPreparedStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT e.* FROM equipos e JOIN jugadores j ON j.cod_equipo = e.cod_equipo AND j.cod_jugador = ?";

		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, codJugador);
			myResultSet = myPreparedStatement.executeQuery();

			while (myResultSet.next()) {
				Liga liga = dameLigaPorCodigo(myResultSet.getInt("cod_liga"));
				equipo = new Equipo(myResultSet.getInt("cod_equipo"), myResultSet.getString("nombre"), liga);
			}
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				myPreparedStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return null;
			}
		}
		return equipo;
	}

	public ArrayList<Equipo> dameEquiposLiga(int codLiga) {
		ArrayList<Equipo> equipos = new ArrayList<Equipo>();
		PreparedStatement myPreparedStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT * FROM equipos WHERE cod_liga = ?";

		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, codLiga);
			myResultSet = myPreparedStatement.executeQuery();

			while (myResultSet.next()) {
				Liga liga = dameLigaPorCodigo(myResultSet.getInt("cod_liga"));
				equipos.add(new Equipo(myResultSet.getInt("cod_equipo"), myResultSet.getString("nombre"), liga));
			}
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				myPreparedStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return null;
			}
		}
		return equipos;
	}
	
	public Integer dameCodUltimoEquipo() {
		int codJugador = 0;
		Statement myStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT MAX(cod_equipo) codEquipo FROM equipos";

		try {
			myStatement = this.myConnection.createStatement();
			myResultSet = myStatement.executeQuery(query);

			while (myResultSet.next()) {
				codJugador = myResultSet.getInt("codEquipo");
			}
		} catch (SQLException e) {
			return 0;
		} finally {
			try {
				myStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return 0;
			}
		}
		return codJugador;
	}
	
	public boolean existeEquipo(int codEquipo) {
		boolean existe = false;
		PreparedStatement myPreparedStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT cod_equipo FROM equipos WHERE cod_equipo = ?";

		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, codEquipo);
			myResultSet = myPreparedStatement.executeQuery();

			while (myResultSet.next()) {
				existe = true;
			}
		} catch (SQLException e) {
			return false;
		} finally {
			try {
				myPreparedStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return false;
			}
		}
		return existe;
	}

	public boolean existeEquipoPorNombre(String nombreEquipo) {
		boolean existe = false;
		PreparedStatement myPreparedStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT nombre FROM equipos WHERE nombre = ?";

		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setString(1, nombreEquipo);
			myResultSet = myPreparedStatement.executeQuery();

			while (myResultSet.next()) {
				existe = true;
			}
		} catch (SQLException e) {
			return false;
		} finally {
			try {
				myPreparedStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return false;
			}
		}
		return existe;
	}
	
	public boolean eliminarEquipo(int codEquipo) {
		boolean eliminado = false;
		PreparedStatement myPreparedStatement = null;
		String query = "DELETE FROM equipos WHERE cod_equipo = ?";
		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, codEquipo);
			myPreparedStatement.executeUpdate();

			eliminado = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				myPreparedStatement.close();
			} catch (SQLException e) {
				return false;
			}
		}
		return eliminado;
	}

	public boolean altaEquipo(Equipo nuevoEquipo) {
		boolean anadido = false;
		PreparedStatement myPreparedStatement = null;
		String query = "INSERT INTO equipos VALUES(?,?,?)";
		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, nuevoEquipo.getCodigo_equipo());
			myPreparedStatement.setString(2, nuevoEquipo.getNombre_equipo());
			myPreparedStatement.setInt(3, nuevoEquipo.getLiga().getCod_liga());
			myPreparedStatement.executeUpdate();

			anadido = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				myPreparedStatement.close();
			} catch (SQLException e) {
				return false;
			}
		}
		return anadido;
	}

	/**** OPERACIONES CON CARTA ****/

	public Carta dameCartaPorCodigoJugador(int codJugador) {
		Carta carta = new Carta();
		PreparedStatement myPreparedStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT * FROM cartas WHERE cod_jugador = ? AND nombre = 'Simple'";

		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, codJugador);
			myResultSet = myPreparedStatement.executeQuery();

			while (myResultSet.next()) {
				Jugador jugador = dameJugador(myResultSet.getInt("cod_jugador"));
				carta = new Carta(myResultSet.getString("nombre"), jugador, myResultSet.getInt("rat"),
						myResultSet.getString("pos"), myResultSet.getInt("precio"), myResultSet.getInt("pac"),
						myResultSet.getInt("sho"), myResultSet.getInt("pas"), myResultSet.getInt("dri"),
						myResultSet.getInt("def"), myResultSet.getInt("phy"), myResultSet.getInt("pierna_mala"),
						myResultSet.getInt("filigranas"));
			}
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				myPreparedStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return null;
			}
		}
		return carta;
	}

	public ArrayList<Carta> dameCartasPorCodigoJugador(int codJugador) {
		ArrayList<Carta> cartas = new ArrayList<Carta>();
		PreparedStatement myPreparedStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT * FROM cartas WHERE cod_jugador = ? ORDER BY rat ASC";

		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setInt(1, codJugador);
			myResultSet = myPreparedStatement.executeQuery();

			while (myResultSet.next()) {
				Jugador jugador = dameJugador(myResultSet.getInt("cod_jugador"));
				cartas.add(new Carta(myResultSet.getString("nombre"), jugador, myResultSet.getInt("rat"),
						myResultSet.getString("pos"), myResultSet.getInt("precio"), myResultSet.getInt("pac"),
						myResultSet.getInt("sho"), myResultSet.getInt("pas"), myResultSet.getInt("dri"),
						myResultSet.getInt("def"), myResultSet.getInt("phy"), myResultSet.getInt("pierna_mala"),
						myResultSet.getInt("filigranas")));
			}
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				myPreparedStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return null;
			}
		}
		return cartas;
	}

	public Carta dameCartaPorNombreCarta(String nombreCarta) {
		Carta carta = new Carta();
		PreparedStatement myPreparedStatement = null;
		ResultSet myResultSet = null;
		String query = "SELECT * FROM cartas WHERE nombre = ?";

		try {
			myPreparedStatement = this.myConnection.prepareStatement(query);
			myPreparedStatement.setString(1, nombreCarta);
			myResultSet = myPreparedStatement.executeQuery();

			while (myResultSet.next()) {
				Jugador jugador = dameJugador(myResultSet.getInt("cod_jugador"));
				carta = new Carta(myResultSet.getString("nombre"), jugador, myResultSet.getInt("rat"),
						myResultSet.getString("pos"), myResultSet.getInt("precio"), myResultSet.getInt("pac"),
						myResultSet.getInt("sho"), myResultSet.getInt("pas"), myResultSet.getInt("dri"),
						myResultSet.getInt("def"), myResultSet.getInt("phy"), myResultSet.getInt("pierna_mala"),
						myResultSet.getInt("filigranas"));
			}
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				myPreparedStatement.close();
				myResultSet.close();
			} catch (SQLException e) {
				return null;
			}
		}
		return carta;
	}
}