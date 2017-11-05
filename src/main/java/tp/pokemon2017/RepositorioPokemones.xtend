package tp.pokemon2017

class RepositorioPokemones extends RepositorioGenerico<Pokemon> {
	static var RepositorioPokemones instance
	var int idNuevo = 0

	static def getInstance() {
		if (instance == null) {
			instance = new RepositorioPokemones()
		}
		return instance
	}

	override create(Pokemon _pokemon) {
		if (!existeId(_pokemon.idPokemon) || _pokemon.idPokemon <0) {
			_pokemon.idPokemon = idNuevo
			idNuevo++
			listaRepo.add(_pokemon)
		}
	}

	def existeId(int id) {
		listaRepo.exists[pokemon|pokemon.idPokemon == id]
	}

	override update(Pokemon _poke) {
		if (listaRepo.contains(searchById(_poke.idPokemon))) {
			listaRepo.set(listaRepo.indexOf(searchById(_poke.idPokemon)), _poke)
		} else {
			this.create(_poke)
		}
	}

	override searchById(int id) {
		listaRepo.filter[pokemon|pokemon.idPokemon == id].get(0)
	}

	override search(String valor) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override contieneString(Pokemon _objetoRecibido, String valor) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
