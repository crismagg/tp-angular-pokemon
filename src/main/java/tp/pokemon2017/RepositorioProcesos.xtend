package tp.pokemon2017

import java.util.List
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
class RepositorioProcesos extends RepositorioGenerico<Proceso> {
	static var RepositorioProcesos instance
	List<Proceso> historial = newArrayList
	var int idHistory = 0

	private new() {
		nombre = "Repositorio Proceso"
	}

	static def getInstance() {
		if (instance === null) {
			instance = new RepositorioProcesos()

		}
		return instance
	}

	def getHistorial() {
		historial
	}

	override create(Proceso _procesoRecibido) {
		this.aplicarId(_procesoRecibido)
		listaRepo.add(_procesoRecibido)
		addHistorial(_procesoRecibido)
	}

	def aplicarId(Proceso proceso) {
		if (esNuevo(proceso)) {
			proceso.id = idHistory
			idHistory++
		}
	}

	def esNuevo(Proceso proceso) {
		proceso.id < 0
	}

	def dispatch addHistorial(Proceso proceso) {
		if (!historial.contains(proceso)) {
			historial.add(proceso)
		}
	}

	def dispatch addHistorial(ProcesosMultiples proceso) {}

	override update(Proceso _objetoRecibido) {
		if (!esNuevo(_objetoRecibido)) {
			listaRepo.set(listaRepo.indexOf(searchById(_objetoRecibido.id)), _objetoRecibido)
			historial.set(listaRepo.indexOf(searchById(_objetoRecibido.id)), _objetoRecibido)

//			listaRepo.remove(searchById(_objetoRecibido.id))
//			this.create(_objetoRecibido)
		} else
			create(_objetoRecibido)
	}

	override searchById(int id) {
		listaRepo.findFirst[proc|proc.id == id]
	}

	override List<Proceso> search(String valor) {
		listaRepo.filter[proc|proc.descripcion.equals(valor)].toList
	}

	override contieneString(Proceso _objetoRecibido, String valor) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
