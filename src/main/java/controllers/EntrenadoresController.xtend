package controllers

import org.uqbar.geodds.Point
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import repositorios.RepoEntrenadores
import tp.pokemon2017.Entrenador
import tp.pokemon2017.RepositorioEntrenadores

@Controller
class EntrenadoresController {
	extension JSONUtils = new JSONUtils
	RepositorioEntrenadores repo = RepositorioEntrenadores.instance

	new() {
		var iniciarEntrenadores = new RepoEntrenadores()
	}

	@Get("/oponentes")
	def Result oponentes() {
		val oponentes = repo.listaRepo
		response.contentType = ContentType.APPLICATION_JSON
		
		ok(oponentes.toJson)
	}
	@Get('/player')
	def Result player(){
		val player = repo.getPlayer()
		response.contentType = ContentType.APPLICATION_JSON
		ok(player.toJson)
	}
	
	@Put('/player/')
	def Result playerActualizar(@Body String body){
		val trainerActualizado = body.fromJson(Entrenador)
		val coordenadaX =new Double(body.getPropertyValue('coordenadaActual.x'))
		val coordenadaY =new Double(body.getPropertyValue('coordenadaActual.y'))
		val coordenada = new Point(coordenadaX,coordenadaY)
		trainerActualizado.coordenadaActual =coordenada
		repo.updatePlayer(trainerActualizado)
		ok('{"Status","OK"}')
		
	}
//		@Put('/tareas/:id')
//	def Result actualizar(@Body String body) {
//		try {
//			//if (true) throw new RuntimeException("ACHALAY")
//			val actualizado = body.fromJson(Tarea)
//
//			val asignadoA = body.getPropertyValue("asignadoA")
//			val asignatario = RepoUsuarios.instance.getAsignatario(asignadoA)
//			actualizado.asignarA(asignatario)
//
//			if (Integer.parseInt(id) != actualizado.id) {
//				return badRequest('{ "error" : "Id en URL distinto del cuerpo" }')
//			}
//
//			RepoTareas.instance.update(actualizado)
//			ok('{ "status" : "OK" }');
//		} catch (Exception e) {
//			badRequest(e.message)
//		}
//	}
}