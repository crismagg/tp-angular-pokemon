package tp.pokemon2017

import java.util.List

class RepositorioEntrenadores extends RepositorioGenerico<Entrenador> {
	static var RepositorioEntrenadores instance

//INICIO DEL SINGLETON PATTERN	
	private new() {

		nombre = "Repositorio Entrenadores"
	}

	static def getInstance() {
		if (instance == null) {
			instance = new RepositorioEntrenadores()
		}
		return instance
	}

//FIN DEL SINGLETON PATTERN
	override void create(Entrenador _entrenador) {
		if (!listaRepo.contains(_entrenador)) {
			listaRepo.add(_entrenador)
		}
	}

	override void update(Entrenador _entrenador) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override Entrenador searchById(int id) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override List<Entrenador> search(String valor) {
		listaRepo.filter[trainer| trainer.nombre.contains(valor)].toList
	}

	override contieneString(Entrenador _objetoRecibido, String valor) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
