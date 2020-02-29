package fifa20;

public class Equipo {

	private int codigo_equipo;
	private String nombre_equipo;
	private Liga liga;

	public Equipo() {
		super();
	}

	public Equipo(int codigo_equipo, String nombre_equipo, Liga liga) {
		super();
		this.codigo_equipo = codigo_equipo;
		this.nombre_equipo = nombre_equipo;
		this.liga = liga;
	}

	public int getCodigo_equipo() {
		return codigo_equipo;
	}

	public void setCodigo_equipo(int codigo_equipo) {
		this.codigo_equipo = codigo_equipo;
	}

	public String getNombre_equipo() {
		return nombre_equipo;
	}

	public void setNombre_equipo(String nombre_equipo) {
		this.nombre_equipo = nombre_equipo;
	}

	public Liga getLiga() {
		return liga;
	}

	public void setLiga(Liga liga) {
		this.liga = liga;
	}

	@Override
	public String toString() {
		return "Equipo [codigo_equipo=" + codigo_equipo + ", nombre_equipo=" + nombre_equipo + ", liga=" + liga.getNombre_liga() + "]";
	}
}