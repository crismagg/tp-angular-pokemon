package tp.pokemon2017

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.Entity

@Accessors
@TransactionalAndObservable
class Pokeparada {
	int numeroID
	String nombre
	Point ubicacion
	var List<Item> itemsDisponibles

//------ ENTEGA 2 -----------
 	def validar(){
		ubicacion !== null && 
		nombre !== null
	
	} 
//---------------------------	 

	def sumarItemsDisponibles(Item item) {
		itemsDisponibles.add(item)

	}

	def curarEquipoPokemon(Entrenador entrenador) {

		entrenador.equipoPokemon.forEach[pokemon|pokemon.curacionCompletaSaludActual()]

	}

	def comprarItem(Item item) {
		if (!estaElItemEnLaPokeparada(item)) {
			throw new BusinessException("No se Encuentra Ese Item")
		} 
			item.costo
		
	}

	def estaElItemEnLaPokeparada(Item item) {
		itemsDisponibles.contains(item)
	}
	def setNombre(String _nombre){
		nombre = _nombre
	}
	def setUbicacion(Point punto){
		ubicacion = punto
	}

}
