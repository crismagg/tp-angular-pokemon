package tp.pokemon2017

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.json.JSONArray
import java.util.ArrayList

@Accessors
class RepositorioPokeparada extends RepositorioGenerico<Pokeparada> {
	static var RepositorioPokeparada instance = null // Repositorio único, es una Well Known Instance
	private var int ideador = 1
	ServicioJSONPokeparada servicioPokeparada

//INICIO DEL SINGLETON PATTERN	
	private new() {
		nombre = "Repositorio Pokeparada"
	}

	// static
	static def getInstance() {
		if (instance === null) {
			instance = new RepositorioPokeparada
		}
		instance
	}

//FIN DEL SINGLETON PATTERN
	def void asignarServicio(ServicioJSONPokeparada service){
		servicioPokeparada = service
	}
	
	override void create(Pokeparada _pokeparada) {
		if (_pokeparada.validar()) {
			_pokeparada.numeroID = ideador
			listaRepo.add(_pokeparada)
			ideador++
		}
	}

	override void update(Pokeparada _pokeparada) {
		if (!_pokeparada.validar()) {
			throw new BusinessException("La Pokeparada tiene datos no válidos")
		}
		if (!search(_pokeparada.nombre).isEmpty) {
			search(_pokeparada.nombre).get(0).ubicacion = _pokeparada.ubicacion 
			search(_pokeparada.nombre).get(0).nombre = _pokeparada.nombre
		} else {
			this.create(_pokeparada)
		}
	}


	override Pokeparada searchById(int id) {
		if (listaRepo.size < (id - 1)) {
			throw new BusinessException("No existe una pokeparada con dicho número de ID")
		}
		listaRepo.get(id - 1)
	}

	override List<Pokeparada> search(String valor) {
		listaRepo.filter[pok|contieneString(pok, valor)].toList
	}

	override boolean contieneString(Pokeparada _pokeparada, String valor) {
		_pokeparada.nombre.contains(valor) || _pokeparada.itemsDisponibles.exists[item | item.nombre() == valor]

	}
	override void updateAll() {
		var List<Pokeparada> especiesAUpdatear = new ArrayList
			if(servicioPokeparada === null){
				throw new BusinessException("Se debe asignar un servicio para procesar la actualizacion enviada")
			} else{
				especiesAUpdatear = servicioPokeparada.listaPokeparadas
				especiesAUpdatear.forEach[especie| especie.update]
			}
	}		
		
	
}