package fifa20;

public class Operaciones {

	public static String ponerCssEstadisticas(int num) {
		String colorCss = "";

		if (num >= 0 && num <= 49) {
			colorCss = "cuadradito_rojo";

		} else if (num >= 50 && num <= 69) {
			colorCss = "cuadradito_naranja";

		} else if (num >= 70 && num <= 79) {
			colorCss = "cuadradito_amarillo";

		} else if (num >= 80 && num <= 89) {
			colorCss = "cuadradito_verde";

		} else if (num >= 90 && num <= 99) {
			colorCss = "cuadradito_verde_oscuro";
		}
		return colorCss;
	}

	public static String[] ponerCssBarras(int num) {
		String[] css = new String[2];

		if (num >= 0 && num <= 49) {
			if (num == 0) {
				css[0] = "#f44336";
				css[1] = "0";
			} else {
				css[0] = "#f44336";
				css[1] = "50";
			}

		} else if (num >= 50 && num <= 69) {
			css[0] = "#fb8c00";
			css[1] = "100";

		} else if (num >= 70 && num <= 79) {
			css[0] = "#e9bc0b";
			css[1] = "150";

		} else if (num >= 80 && num <= 89) {
			css[0] = "#4caf50";
			css[1] = "200";

		} else if (num >= 90 && num <= 99) {
			if (num >= 95 && num <= 100) {

				css[0] = "#007e33";
				css[1] = "285";
			} else {
				css[0] = "#007e33";
				css[1] = "300";
			}
		}
		return css;
	}
}