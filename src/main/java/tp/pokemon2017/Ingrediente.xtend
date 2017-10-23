package tp.pokemon2017

interface Ingrediente extends Item{
	def int recuperacion(Especie especie,int recuperacionPocion)

}

class IngredienteSuma implements Ingrediente {
	int costo
	int curacion
	String nombre

	new(int _costo, int _curacion) {
		costo = _costo
		curacion = _curacion
	}

	override costo() {
		costo
	}
	
	override nombre(){
		nombre
	}

	override recuperacion(Especie especie,int recuperacionPocion) {
		curacion
	}
}

class IngredienteSinTipo implements Ingrediente {
	int costo
	var double porcentajeRecuperacion
	String nombre

	new(int _costo, double porcentaje) {
		costo = _costo
		porcentajeRecuperacion = porcentaje
	}

	override costo() {
		costo
	}
	
	override nombre(){
		nombre
	}

	override recuperacion(Especie especie,int recuperacionPocion) {
		(recuperacionPocion * porcentajeRecuperacion).intValue()
	}

}

class IngredienteConTipo implements Ingrediente {
	int costo 
	double porcentajeSiEsTipo 
	double porcentajeSiNoEstipo
	TipoDePokemon tipoElegido
	String nombre

	new(int _costo, double porcentajeSi, double porcentajeNo, TipoDePokemon tipo) {
		costo = _costo
		porcentajeSiEsTipo = porcentajeSi
		porcentajeSiNoEstipo = porcentajeNo
		tipoElegido = tipo

	}
	
	override nombre(){
		nombre
	}

	override int costo() {
		costo
	}

	override recuperacion(Especie especie,int recuperacionPocion) {
		if (especie.tipos.contains(tipoElegido)) {
			(recuperacionPocion * porcentajeSiEsTipo).intValue()

		} else {
			(recuperacionPocion * porcentajeSiNoEstipo).intValue()
		}
	}

}
