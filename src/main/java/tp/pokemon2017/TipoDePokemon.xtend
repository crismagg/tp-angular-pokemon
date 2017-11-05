package tp.pokemon2017

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class TipoDePokemon {
	String nombre
	List<TipoDePokemon> resistente = newArrayList
	List<TipoDePokemon> fuerte = newArrayList

	new() {
	}

	new(String name, List<TipoDePokemon> resistent, List<TipoDePokemon> strong) {
		nombre = name
		resistente = resistent
		fuerte = strong

	}

	def fortaleza(Especie especie) {
		especie.tipos.exists[elemento|fuerte.contains(elemento)]

	}

	def resistencia(Especie especie) {
		especie.tipos.exists[elemento|resistente.contains(elemento)]
	}

}
