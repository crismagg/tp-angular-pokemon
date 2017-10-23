package tp.pokemon2017

//Si buscan tests de Tipo De Entrenador, ir a testEntrenador sección Tipo De Entrenador
abstract class TipoDeEntrenador {
	int experienciaCaptura = 0
	int experienciaPorVictoria = 0
	int experienciaEvolucionAdicional = 0
	def boolean esExperto(Entrenador entrenador)
	def int experienciaPorCaptura(){
		experienciaCaptura
	}
	def int experienciaPorVictoria(){
		experienciaPorVictoria
	}
	def int experienciaPorEvolucionAdicional(Pokemon pokemon){
		experienciaEvolucionAdicional
	}

}

class Luchador extends TipoDeEntrenador {
	int nivelMinimoRequerido = 18
	int victoriasMinimasRequeridas = 30
	int experienciaVictorioso= 200
	override esExperto(Entrenador entrenador) {
		entrenador.nivel > nivelMinimoRequerido || entrenador.victorias >= victoriasMinimasRequeridas
	}
	override experienciaPorVictoria(){
		experienciaVictorioso
	}
}

class Coleccionista extends TipoDeEntrenador {
	int nivelMinimoRequerido = 13
	int minimaCantidadEspeciesDistintas = 20
	int experienciaPorCapturar = 500

	override esExperto(Entrenador entrenador) {
		entrenador.nivel > nivelMinimoRequerido &&
			entrenador.cantidadEspeciesAtrapadas() > minimaCantidadEspeciesDistintas &&
			entrenador.generoDePokemonesCapturadosBalanceado()
	}
	override experienciaPorCaptura(){
		experienciaPorCapturar
	}
	
}

class Criador extends TipoDeEntrenador {
	int cantidadMinimaPokemonesEvolucionados = 15
	int cantidadMinimaDePokemonesNecesarios = 5
	int experienciaPorEvolucionarCriador = 200 
	
	override esExperto(Entrenador entrenador) {
		(entrenador.cantidadPokemonesEvolucionados > cantidadMinimaPokemonesEvolucionados &&
			entrenador.cantidadPokemonesMayorANivel(20) > cantidadMinimaDePokemonesNecesarios)
	}
	override experienciaPorEvolucionAdicional(Pokemon pokemon){
		experienciaPorEvolucionarCriador + experienciaAdicionalPorPokemon(pokemon)
	}
	
	def  experienciaAdicionalPorPokemon(Pokemon pokemon){
		(pokemon.experiencia * 0.2).intValue()
	}
}
