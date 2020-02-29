package fifa20;

public class Carta {

	private String nombre_carta;
	private Jugador jugador;
	private int rat;
	private String pos;
	private int precio;
	private int pac;
	private int sho;
	private int pas;
	private int dri;
	private int def;
	private int phy;
	private int pierna_mala;
	private int filigranas;

	public Carta() {
		super();
	}

	public Carta(String nombre_carta, Jugador jugador, int rat, String pos, int precio, int pac, int sho, int pas,
			int dri, int def, int phy, int pierna_mala, int filigranas) {
		super();
		this.nombre_carta = nombre_carta;
		this.jugador = jugador;
		this.rat = rat;
		this.pos = pos;
		this.precio = precio;
		this.pac = pac;
		this.sho = sho;
		this.pas = pas;
		this.dri = dri;
		this.def = def;
		this.phy = phy;
		this.pierna_mala = pierna_mala;
		this.filigranas = filigranas;
	}

	public String getNombre_carta() {
		return nombre_carta;
	}

	public void setNombre_carta(String nombre_carta) {
		this.nombre_carta = nombre_carta;
	}

	public Jugador getJugador() {
		return jugador;
	}

	public void setJugador(Jugador jugador) {
		this.jugador = jugador;
	}

	public int getRat() {
		return rat;
	}

	public void setRat(int rat) {
		this.rat = rat;
	}

	public String getPos() {
		return pos;
	}

	public void setPos(String pos) {
		this.pos = pos;
	}

	public int getPrecio() {
		return precio;
	}

	public void setPrecio(int precio) {
		this.precio = precio;
	}

	public int getPac() {
		return pac;
	}

	public void setPac(int pac) {
		this.pac = pac;
	}

	public int getSho() {
		return sho;
	}

	public void setSho(int sho) {
		this.sho = sho;
	}

	public int getPas() {
		return pas;
	}

	public void setPas(int pas) {
		this.pas = pas;
	}

	public int getDri() {
		return dri;
	}

	public void setDri(int dri) {
		this.dri = dri;
	}

	public int getDef() {
		return def;
	}

	public void setDef(int def) {
		this.def = def;
	}

	public int getPhy() {
		return phy;
	}

	public void setPhy(int phy) {
		this.phy = phy;
	}

	public int getPierna_mala() {
		return pierna_mala;
	}

	public void setPierna_mala(int pierna_mala) {
		this.pierna_mala = pierna_mala;
	}

	public int getFiligranas() {
		return filigranas;
	}

	public void setFiligranas(int filigranas) {
		this.filigranas = filigranas;
	}

	@Override
	public String toString() {
		return "Carta [nombre_carta=" + nombre_carta + ", jugador=" + jugador.getNombre_jugador() + ", rat=" + rat
				+ ", pos=" + pos + ", precio=" + precio + ", pac=" + pac + ", sho=" + sho + ", pas=" + pas + ", dri="
				+ dri + ", def=" + def + ", phy=" + phy + ", pierna_mala=" + pierna_mala + ", filigranas=" + filigranas
				+ "]";
	}
}