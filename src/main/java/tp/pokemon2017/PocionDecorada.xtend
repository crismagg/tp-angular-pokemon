package tp.pokemon2017

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PocionDecorada implements Pocion {
	String nombre
	Pocion pocion
	int costo
	Ingrediente ingrediente

	new(Pocion pota, Ingrediente _ingrediente) {
		pocion = pota
		ingrediente = _ingrediente
		costo = _ingrediente.costo + pocion.costo()
	}

	new(Pocion pota, Ingrediente _ingrediente, String nomb) {
		pocion = pota
		ingrediente = _ingrediente
		costo = _ingrediente.costo + pocion.costo()
		nombre = nomb
	}

	override nombre() { nombre }

	override costo() {
		costo
	}

	override recuperacion(Pokemon pokemon) {
		 (pocion.recuperacion(pokemon)) + ingrediente.recuperacion(pokemon.especie, pocion.recuperacion(pokemon))	
	}
}

