package tp.pokemon2017

class Combate {

	var double dineroApostado
	Entrenador entrenador
	Entrenador entrenadorRival
	Pokemon miPokemon
	Pokemon pokemonRival

	new(double _dineroApostado, Entrenador _entrenador, Entrenador _entrenadorRival) {
		dineroApostado = _dineroApostado
		entrenador = _entrenador
		entrenadorRival = _entrenadorRival
		miPokemon = _entrenador.pokemonElegido
		pokemonRival = _entrenadorRival.pokemonElegido
	}

	def realizarCombate() {

		if (Math.random() <= chances(entrenador, entrenadorRival) /
			((chances(entrenador, entrenadorRival) + chances(entrenadorRival, entrenador)))) {

			recompensaVictoriaCombate(entrenador, entrenadorRival)
		} else {
			perdidaPorDerrota(entrenador, entrenadorRival)
		}

	}

	// CHANCES
	def chances(Entrenador _entrenador, Entrenador _entrenadorRival) {

		_entrenador.chancesEntrenadorExperto() *
			_entrenador.pokemonElegido.chancesContra(_entrenadorRival.pokemonElegido)
	}

	// RESULTADO COMBATE
	def recompensaVictoriaCombate(Entrenador _entrenador, Entrenador _entrenadorRival) {
		_entrenador.variarDinero(dineroApostado)
		_entrenador.ganaExperiencia(300)
		if ( _entrenador.nivel < _entrenadorRival.nivel) {
			_entrenador.ganaExperiencia(_entrenador.tipoDeEntrenador.experienciaPorVictoria)
		}
		_entrenador.pokemonElegido.ganaExperiencia(_entrenadorRival.pokemonElegido.experiencia * 10 / 100)
		_entrenador.pokemonElegido.recibirDaño(
			dañoRecibido(_entrenador.pokemonElegido, _entrenadorRival.pokemonElegido))

	}

	def perdidaPorDerrota(Entrenador _entrenador, Entrenador _entrenadorRival) {
		_entrenador.variarDinero(-dineroApostado)
		_entrenador.pokemonElegido.recibirDaño(_entrenador.pokemonElegido.calcularPuntosDeSalud)
	}

	def dañoRecibido(Pokemon pokemon, Pokemon _pokemonRival) {
		(pokemon.calcularPuntosDeSalud *
			(pokemon.calcularPuntosDeAtaque / (pokemon.calcularPuntosDeAtaque + _pokemonRival.calcularPuntosDeAtaque))).
			intValue()

	}

}
