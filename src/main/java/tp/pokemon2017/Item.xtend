package tp.pokemon2017

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

interface Item {
	def String nombre()

	def int costo()
}

interface Pocion extends Item {

	def int recuperacion(Pokemon pokemon)

}

@Accessors
class Pokeball implements Item {
	String nombre
	int costo
	double chance

	new(int _costo, double _chance) {
		costo = _costo
		chance = _chance
	}
	new(int _costo, double _chance,String nomb) {
		costo = _costo
		chance = _chance
		nombre = nomb
	}


	override nombre() { nombre }

	override costo() {
		costo
	}

}

@Accessors
class PocionNormal implements Pocion {
	String nombre
	int costo
	int recuperacion
	List<Ingrediente> ingredientes

	new(int _costo, int _recupera) {
		costo = _costo
		recuperacion = _recupera
	}
	new(int _costo, int _recupera,String nomb) {
		costo = _costo
		recuperacion = _recupera
		nombre = nomb
	}

	def setNombre(String _nombre) { nombre = _nombre }

	override nombre() { nombre }

	override costo() {
		costo
	}

	override recuperacion(Pokemon pokemon) {
		recuperacion
	}

}

@Accessors
class MaxPocion implements Pocion {
	String nombre
	int costo = 150

	override costo() {
		costo
	}


	override nombre() { nombre }

	override recuperacion(Pokemon pokemon) {
		pokemon.curacionCompletaSaludActual
	}

}
