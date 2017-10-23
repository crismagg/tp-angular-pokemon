package tp.pokemon2017

import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Bolso {
	Collection<Item> items =new ArrayList()

	def agregarNuevoItem(Item _item) {
		items.add(_item)
	}
	
	def usarItem(Item _item){
		items.remove(_item)
	}
	
	def hayPokeballs(Item pokeball) {
		if(!items.contains(pokeball)) throw new BusinessException("No hay pokeballs")
	}
	
	def hayPociones(Pocion pocion) {
		if(!items.contains(pocion)) throw new BusinessException("No hay pokeballs")
		else true
	}
	
	def mejorarPocion(Pocion pocion,Ingrediente ingrediente){
		if(!items.contains(pocion)){
			throw new BusinessException("No existe Pocion")
		}
		if(!items.contains(ingrediente)){
			throw new BusinessException("No existe Ingrediente")
		}
		items.add(new PocionDecorada(pocion,ingrediente))
		usarItem(pocion)
		usarItem(ingrediente)
	}
	
}
