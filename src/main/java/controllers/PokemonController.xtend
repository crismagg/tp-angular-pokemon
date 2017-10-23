package controllers

import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.json.JSONUtils
import tp.pokemon2017.Especie

@Controller
class PokemonController {
	extension JSONUtils = new JSONUtils
	var especie = new Especie()
	
	@Get("especies")
	def Result especie(){
		ok(especie.toJson)
	}

}
