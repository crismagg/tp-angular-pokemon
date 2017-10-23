package controllers

import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import repositorios.RepoEntrenadores
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
	@Get('/player/:nombre')
	def Result player(){
		val name = nombre
		val player = repo.search(nombre)
		response.contentType = ContentType.APPLICATION_JSON
		ok(player.toJson)
	}
}