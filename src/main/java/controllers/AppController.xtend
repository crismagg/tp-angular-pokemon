package controllers

import org.uqbar.xtrest.api.XTRest

class AppController {
	def static void main(String[] args) {
		XTRest.start(9000, PokemonController,EntrenadoresController)
	}
}
