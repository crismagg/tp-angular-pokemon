package tp.pokemon2017

import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.exceptions.UserException

@Accessors
@TransactionalAndObservable
abstract class Proceso {
String descripcion
String ultimaEjecucion

	var int id = -1
	
	def void execute()
	
	def validar() {
		if(descripcion.isNullOrEmpty) {
			throw new UserException("La descripcion no debe estar vacía")
		}	
	}
	
	def setUltimaEjecucion(){
		val DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		ultimaEjecucion = LocalDateTime.now.format(formatter)	
	}
	
	def getUltimaEjecucion(){
		ultimaEjecucion
	}
}
@Accessors
@TransactionalAndObservable
class Actualizar extends Proceso {

	List<RepositorioGenerico> repos

	new(List<RepositorioGenerico> _repos) {
		repos = _repos
	}

	override execute() {
		if(repos.isEmpty) throw new BusinessException("No hay repositorios")
		this.validar
		this.doExecute()
		this.setUltimaEjecucion
	}

	def doExecute() {
		repos.forEach[repo|repo.updateAll()]
	}

}
@Accessors
@TransactionalAndObservable
class AgregarAcciones extends Proceso {

	List<Entrenador> entrenadores
	List<Accion> acciones

	new(List<Entrenador> trainers, List<Accion> actions) {

		entrenadores = trainers
		acciones = actions
	}

	override execute() {
		if(entrenadores.isEmpty) throw new BusinessException("no hay entrenadores")
		if(acciones.isEmpty) throw new BusinessException("no hay Acciones")
		this.validar
		this.doExecute()
		this.setUltimaEjecucion
	}

	def doExecute() {
		acciones.forEach[action|this.agregarAccion(action)]
	}

	def agregarAccion(Accion accion) {
		entrenadores.forEach[trainer|trainer.agregarAccion(accion)]
	}

}
@Accessors
@TransactionalAndObservable
class RemoverAcciones extends Proceso {

	List<Entrenador> entrenadores
	List<Accion> acciones

	new(List<Entrenador> trainers, List<Accion> actions) {
		entrenadores = trainers
		acciones = actions
	}

	override execute() {
		if(entrenadores.isEmpty) throw new BusinessException("no hay entrenadores")
		if(acciones.isEmpty) throw new BusinessException("no hay Acciones")
		this.validar
		this.doExecute()
		this.setUltimaEjecucion
	}

	def doExecute() {
		acciones.forEach[action|this.removerAccion(action)]
	}

	def removerAccion(Accion accion) {
		entrenadores.forEach[trainer|trainer.removerAccion(accion)]
	}

}
@Accessors
@TransactionalAndObservable
class PoblarArea extends Proceso {

	Area area
	List<Especie> especies
	int densidad
	int nivelMaximo
	int nivelMinimo

	new(Area _area, List<Especie> _especies, int density, int levelmin, int levelMax) {
		area = _area
		especies = _especies
		densidad = density
		nivelMaximo = levelMax
		nivelMinimo = levelmin
	}

	override execute() {
		if(area == null) throw new BusinessException("Area No definida")
		this.validar
		this.doExecute()
		this.setUltimaEjecucion
	}

	def doExecute() {
		area.poblar(especies, densidad, nivelMaximo, nivelMinimo)
	}
	
	override validar() {
		if(descripcion.isNullOrEmpty) {
			throw new UserException("La descripcion no debe estar vacía")
		}	
		if(nivelMaximo > 20){
			throw new UserException("El Nivel Maximo no puede superar al nivel 20")
		}
		if(nivelMaximo < 1){
			throw new UserException("El Nivel Maximo no puede ser menor al nivel 1")
		}
		if(nivelMinimo < 1){
			throw new UserException("El Nivel Mínimo no puede ser menor al nivel 1")
		}
		if(nivelMaximo < nivelMinimo){
			throw new UserException("El Nivel Maximo no puede ser menor al Nivel Mínimo")
		}
		if(densidad < 1){
			throw new UserException("La densidad no puede ser menor a 1")
		}
		if(area === null){
			throw new UserException("No ha seleccionado un area")
		}
	}

}
@Accessors
@TransactionalAndObservable
class ProcesosMultiples extends Proceso {

	List<Proceso> procesos

	new(List<Proceso> process) {
		procesos = process
	}

	override execute() {
		if(procesos.isEmpty) throw new BusinessException("No hay Procesos")
		this.validar
		this.doExecute()
		this.setUltimaEjecucion
	}

	def doExecute() {
		procesos.forEach[proceso|proceso.execute]
	}

}
