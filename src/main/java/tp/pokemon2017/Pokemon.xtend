package tp.pokemon2017

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point

@Accessors
class Pokemon {
	int idPokemon
	var int experiencia
	var int nivel
	Especie especie
	Point puntoGeografico
	Genero genero
	double chancesDeGanar = 0d
	var int saludActual
	var Entrenador propietario
	
	// OBTNER NIVEL 
	def nivel() {
		((Math.sqrt(100 * (2 * experiencia + 25)) + 50) / 100).intValue()
	}

	// EXPERIENCIA
	def ganaExperiencia(int experienciaGanada) {

		experiencia += experienciaGanada
		if (especie.tieneEvolucion) {
			especie.puedeEvolucionar(this)
		}
	}

	def distanciaAlPunto(Point otroPunto) {
		puntoGeografico.distance(otroPunto)
	}

	def double calcularPuntosDeAtaque() {
		this.nivel() * especie.ataqueBase
	}

	def chancesEscapar() {
		nivel() * (1 + especie.velocidad / 10)
	}

	// SALUD
	def calcularPuntosDeSalud() {
		this.nivel() * especie.saludBase
	}

	def curacionCompletaSaludActual() {
		saludActual = calcularPuntosDeSalud()
	}
	def siSuperaLaMaximaAcondicionar(){
		if(saludActual>calcularPuntosDeSalud){
			curacionCompletaSaludActual()
		}
	}

	def curarPokemon(Pocion pocion) {
		saludActual += pocion.recuperacion(this)
		siSuperaLaMaximaAcondicionar()
	}
	
	def curarPokemon(MaxPocion mPocion){
		mPocion.recuperacion(this)		
	}

	def recibirDaño(int dañoRecibido) {
		saludActual -= dañoRecibido

	}
	def noTieneSaludAlMaximo(){
		if(saludActual ==calcularPuntosDeSalud()) throw new BusinessException("La salud esta al maximo")
		else true
		
	}

	// EVOLUCION
	def evolucionar(Especie especieNueva) {
		especie = especieNueva
		propietario.tipoDeEntrenador.experienciaPorEvolucionAdicional(this)
		propietario.sumarEvolucionesRealizadas
		}
	

	// RESISTENCIA Y DEBILIDADES
	def fuerteFrenteA(Pokemon pokemonRival) {
		especie.esFuerteA(pokemonRival)
	}

	def resistenteFrenteA(Pokemon pokemonRival) {
		especie.esResistenteA(pokemonRival)

	}
	
	def esMacho(){
		genero.esMacho()
	}
	
	//CHANCES COMBATE
	
		//CHANCES
	def  chancesContra(Pokemon pokemonRival) {
		var double ataqueChancePokemon = calcularPuntosDeAtaque()
		ataqueChancePokemon*= chancesPokemonFortaleza(pokemonRival)
		ataqueChancePokemon*=chancesPokemonResistencia(pokemonRival)
		ataqueChancePokemon
	}

	def chancesPokemonFortaleza(Pokemon _pokemonRival) {
		val adicionalSiNoEsFuerte = 1
		val double adicionalSiEsFuerte = 1.25
		if (fuerteFrenteA(_pokemonRival)) {
			adicionalSiEsFuerte
		}
		else{adicionalSiNoEsFuerte}
	
	}

	def chancesPokemonResistencia( Pokemon _pokemonRival) {
		val adicionalSiNoEsResistente = 1
		val double adicionalSiEsResistente = 1.15
		if (resistenteFrenteA(_pokemonRival)) {

			adicionalSiEsResistente
		}
		else(adicionalSiNoEsResistente)
	}

	
	
}
