package tp.pokemon2017

class RepositorioAreas extends RepositorioGenerico<Area>{
	static var RepositorioAreas instance	

//INICIO DEL SINGLETON PATTERN	
	private new(){
		
	nombre = "Repositorio Especie"
	}	
	
	static def getInstance(){
		if(instance == null){
			instance = new RepositorioAreas()
		}
		return instance
	}

//FIN DEL SINGLETON PATTERN
	
	
	override create(Area _objetoRecibido) {
		if(!listaRepo.contains(_objetoRecibido)){
			listaRepo.add(_objetoRecibido)
		}
	}
	
	override update(Area _objetoRecibido) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override searchById(int id) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override search(String valor) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override contieneString(Area _objetoRecibido, String valor) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}