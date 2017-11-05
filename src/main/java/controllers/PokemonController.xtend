package controllers

import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import repositorios.RepoPokemones
import tp.pokemon2017.Especie
import tp.pokemon2017.RepositorioPokemones

@Controller
class PokemonController {
	RepositorioPokemones repo = RepositorioPokemones.instance
	extension JSONUtils = new JSONUtils
	var especie = new Especie()
	RepoPokemones iniciarSalvajes 

	new() {
		iniciarSalvajes = new RepoPokemones()
	}

	@Get("/salvajes")
	def Result salvajes() {
		val salvajes = repo.listaRepo
		response.contentType = ContentType.APPLICATION_JSON
		ok(salvajes.toJson)
	}
// @Get("/oponentes")
//	def Result oponentes() {
//		val oponentes = repo.listaRepo
//		response.contentType = ContentType.APPLICATION_JSON
//		
//		ok(oponentes.toJson)
//	}
}
