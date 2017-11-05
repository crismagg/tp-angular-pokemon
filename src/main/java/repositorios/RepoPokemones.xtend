package repositorios

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point
import tp.pokemon2017.Especie
import tp.pokemon2017.Pokemon
import tp.pokemon2017.RepositorioEspecie
import tp.pokemon2017.RepositorioPokemones
import tp.pokemon2017.TipoDePokemon

@Accessors
class RepoPokemones {

	RepositorioPokemones repositorioPokemones
	RepositorioEspecie repoEspecies
	List<Pokemon> pokemonesSalvajes = newArrayList
	var TipoDePokemon electricidad
	var TipoDePokemon planta
	var TipoDePokemon fuego
	TipoDePokemon agua
	Especie pikachu
	Especie bulbasaur
	Especie charmander
	Especie squirtle

	new() {
		repositorioPokemones = RepositorioPokemones.instance
		repoEspecies = RepositorioEspecie.instance
		this.crearTipos()
		this.crearEspecies()
		this.crearPokemones()
//		this.llenarRepo()
	}

//	def pokemonesSalvajes() {
//		repoPokemones.listaRepo
//	}
	def llenarRepo() {
		pokemonesSalvajes.forEach[pokem|this.crear(pokem)]
	}

	def crearPokemones() {
		pokemonesSalvajes.add(new Pokemon() => [
			experiencia = 1200
			especie = pikachu
			coordenadaActual = new Point(-58.442857, 34.552667)
			saludActual = 100
		])
		pokemonesSalvajes.add(new Pokemon() => [
			experiencia = 1200
			especie = bulbasaur
			coordenadaActual = new Point(-58.443857, 34.551667)
			saludActual = 100
		])
		pokemonesSalvajes.add(new Pokemon() => [
			experiencia = 1200
			especie = charmander
			coordenadaActual = new Point(58.441856, 34.551667)
			saludActual = 100
		])
		pokemonesSalvajes.add(new Pokemon() => [
			experiencia = 1200
			especie = squirtle 
			coordenadaActual = new Point(58.441856, 34.552667)
			saludActual = 100
		])
		this.llenarRepo()

	}

	def crear(Pokemon pokemon) {
		repositorioPokemones.create(pokemon)
	}

	def crearEspecies() {

		pikachu = new Especie() => [
			saludBase = 100
			ataqueBase = 10
			velocidad = 4
			nombre = "Pikachu"
			descripcion = "rata electrica"
			tipos = #[electricidad]
			imagen = "img/PIKACHU.png"
		]
		bulbasaur = new Especie() => [
			saludBase = 100
			ataqueBase = 10
			velocidad = 4
			nombre = "Bulbasaur"
			descripcion = "plantita"
			tipos = #[planta]
			imagen = "img/bulbasaur.png"
		]
		charmander = new Especie() => [
			saludBase = 100
			ataqueBase = 10
			velocidad = 4
			nombre = "Charmander"
			descripcion = "rata cola fuego"
			tipos = #[fuego]
			imagen = "img/charmander.png"
		]
		squirtle = new Especie() => [
			saludBase = 100
			ataqueBase = 10
			velocidad = 4
			nombre = "Squirtle"
			descripcion = "vamos a calmarno"
			tipos = #[agua]
			imagen = "img/squirtle.png"
		]
	}

	def void crearTipos() {

		electricidad = new TipoDePokemon("electricidad", #[agua], #[agua])
		planta = new TipoDePokemon("planta", #[electricidad], #[electricidad])
		fuego = new TipoDePokemon("fuego", #[planta], #[planta])
		agua = new TipoDePokemon("agua", #[fuego], #[fuego])
	}

}
