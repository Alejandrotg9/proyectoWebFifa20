package fifa20;

public class Liga {

	private int cod_liga;
	private String nombre_liga;
	private String pais;

	public Liga() {
		super();
	}

	public Liga(int cod_liga, String nombre_liga, String pais) {
		super();
		this.cod_liga = cod_liga;
		this.nombre_liga = nombre_liga;
		this.pais = pais;
	}

	public int getCod_liga() {
		return cod_liga;
	}

	public void setCod_liga(int cod_liga) {
		this.cod_liga = cod_liga;
	}

	public String getNombre_liga() {
		return nombre_liga;
	}

	public void setNombre_liga(String nombre_liga) {
		this.nombre_liga = nombre_liga;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	@Override
	public String toString() {
		return "Liga [cod_liga=" + cod_liga + ", nombre_liga=" + nombre_liga + ", pais=" + pais + "]";
	}
}