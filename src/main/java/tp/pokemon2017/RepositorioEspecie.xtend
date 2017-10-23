package tp.pokemon2017

import java.util.ArrayList
import java.util.List

class RepositorioEspecie extends RepositorioGenerico <Especie> {
	static var RepositorioEspecie instance	
	ServicioJSONEspecie servicioEspecie
//INICIO DEL SINGLETON PATTERN	
	private new(){
		
	nombre = "Repositorio Especie"
	}	
	
	static def getInstance(){
		if(instance == null){
			instance = new RepositorioEspecie()
		}
		return instance
	}

//FIN DEL SINGLETON PATTERN
	

	def void asignarServicio(ServicioJSONEspecie service){
		servicioEspecie = service
	}
	
	override void create(Especie _especie){
		if(_especie.validar()){
			listaRepo.add(_especie)
		}	
	}

	override void update(Especie _especie) {
		if(_especie.validar()){	
				if(listaRepo.contains(searchById(_especie.numeroID))){
					listaRepo.set(listaRepo.indexOf(searchById(_especie.numeroID)), _especie)
				} else{
					listaRepo.add(_especie)
				}	
			} else{
				throw new BusinessException("La Especie tiene datos no válidos")
			}
	}

	override Especie searchById(int id) {
		
			listaRepo.findFirst[esp | esp.numeroID == id]
		
	}
	
	override List<Especie>search(String valor){ 
		listaRepo.filter[especie | contieneString(especie, valor)].toList
	}
	
	override boolean contieneString(Especie _especie, String valor){
		_especie.descripcion.contains(valor) || _especie.nombre == valor
	}

	override updateAll(){
		var List<Especie> especiesAUpdatear = new ArrayList
			if(servicioEspecie === null){
				throw new BusinessException("Se debe asignar un servicio para procesar la actualizacion enviada")
			} else{
				especiesAUpdatear = servicioEspecie.listaEspecies
				especiesAUpdatear.forEach[especie| especie.update]
			}
	}
}
