//package repositorios
//
//import tp.pokemon2017.Especie
//import tp.pokemon2017.Pokemon
//import tp.pokemon2017.RepositorioEspecie
//import tp.pokemon2017.RepositorioPokemones
//import tp.pokemon2017.TipoDePokemon
//
//class RepoPokemones {
//
//	RepositorioPokemones repoPokemones
//	RepositorioEspecie repoEspecies
//	TipoDePokemon electricidad
//	TipoDePokemon planta
//	TipoDePokemon fuego
//	TipoDePokemon agua
//	Especie pikachu
//	Especie bulbasaur
//	Especie charmander
//	Especie squartile
//
//	new() {
//		repoPokemones = RepositorioPokemones.instance
//		repoEspecies = RepositorioEspecie.instance
//		this.crearPokemones()
//	}
//
//	def crearPokemones() {
//		this.crearEspecies()
//		new Poskemon
//	}
//
//	def crearEspecies() {
//		this.crearTipos()
//		pikachu = new Especie() => [
//			saludBase = 100
//			ataqueBase = 10
//			velocidad = 4
//			nombre = "Pikachu"
//			descripcion = "rata electrica"
//			tipos.add(electricidad)
//		]
//		bulbasaur = new Especie() => [
//			saludBase = 100
//			ataqueBase = 10
//			velocidad = 4
//			nombre = "Bulbasaur"
//			descripcion = "plantita"
//			tipos.add(planta)
//		]
//		charmander = new Especie() => [
//			saludBase = 100
//			ataqueBase = 10
//			velocidad = 4
//			nombre = "Charmander"
//			descripcion = "rata cola fuego"
//			tipos.add(fuego)
//		]
//		squartile = new Especie() => [
//			saludBase = 100
//			ataqueBase = 10
//			velocidad = 4
//			nombre = "Squartile"
//			descripcion = "vamos a calmarno"
//			tipos.add(agua)
//		]
//	}
//
//	def crearTipos() {
//		electricidad = new TipoDePokemon() => [tipo = "electricidad" resistente.add(agua) fuerte.add(agua)]
//		planta = new TipoDePokemon() => [tipo = "planta" resistente.add(electricidad) fuerte.add(electricidad)]
//		fuego = new TipoDePokemon() => [tipo = "fuego" resistente.add(planta) fuerte.add(planta)]
//		agua = new TipoDePokemon() => [tipo = "agua" resistente.add(fuego) fuerte.add(fuego)]
//	}
//
//}
