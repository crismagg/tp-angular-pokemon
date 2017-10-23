package tp.pokemon2017

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
abstract class RepositorioGenerico<TipoDeRepositorio> {
	var String nombre
	var List<TipoDeRepositorio> listaRepo = newArrayList()

	def void create(TipoDeRepositorio _objetoRecibido)

	def void delete(TipoDeRepositorio _objetoRecibido) {
		if (listaRepo.contains(_objetoRecibido)) {
			listaRepo.remove(_objetoRecibido)
		}
	}
	def setNombre(String nomb){
		nombre = nomb
	}

	def getListaRepo() { listaRepo }

	def resetListaRepo() { listaRepo.clear}

	def void update(TipoDeRepositorio _objetoRecibido)
	
	def void updateAll(){
			
	}

	def TipoDeRepositorio searchById(int id)

	def List<TipoDeRepositorio> search(String valor)

	def boolean contieneString(TipoDeRepositorio _objetoRecibido, String valor)
}
