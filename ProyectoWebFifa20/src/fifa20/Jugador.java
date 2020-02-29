package fifa20;

public class Jugador {

	private int codigo_jugador;
	private String nombre_jugador;
	private Equipo equipo;
	private String pierna;
	private int altura;
	private String pais;

	public Jugador() {
		super();
	}

	public Jugador(int codigo_jugador, String nombre_jugador, Equipo equipo, String pierna, int altura, String pais) {
		super();
		this.codigo_jugador = codigo_jugador;
		this.nombre_jugador = nombre_jugador;
		this.equipo = equipo;
		this.pierna = pierna;
		this.altura = altura;
		this.pais = pais;
	}

	public int getCodigo_jugador() {
		return codigo_jugador;
	}

	public void setCodigo_jugador(int codigo_jugador) {
		this.codigo_jugador = codigo_jugador;
	}

	public String getNombre_jugador() {
		return nombre_jugador;
	}

	public void setNombre_jugador(String nombre_jugador) {
		this.nombre_jugador = nombre_jugador;
	}

	public Equipo getEquipo() {
		return equipo;
	}

	public void setEquipo(Equipo equipo) {
		this.equipo = equipo;
	}

	public String getPierna() {
		return pierna;
	}

	public void setPierna(String pierna) {
		this.pierna = pierna;
	}

	public int getAltura() {
		return altura;
	}

	public void setAltura(int altura) {
		this.altura = altura;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	@Override
	public String toString() {
		return "Jugador [codigo_jugador=" + codigo_jugador + ", nombre_jugador=" + nombre_jugador + ", equipo=" + equipo.getNombre_equipo()
				+ ", pierna=" + pierna + ", altura=" + altura + ", pais=" + pais + "]";
	}
}