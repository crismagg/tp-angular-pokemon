package tp.pokemon2017

import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
class RepositorioAcciones extends RepositorioGenerico<Accion> {
	static var RepositorioAcciones instance

	private new() {

		nombre = "Repositorio Acciones"
	}

	static def getInstance() {
		if (instance === null) {
			instance = new RepositorioAcciones()
		}
		return instance
	}

	override create(Accion _objetoRecibido) {
		listaRepo.add(_objetoRecibido)
	}

	override update(Accion _objetoRecibido) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override searchById(int id) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override search(String valor) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override contieneString(Accion _objetoRecibido, String valor) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
