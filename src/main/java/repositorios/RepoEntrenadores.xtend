package repositorios

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point
import tp.pokemon2017.Entrenador
import tp.pokemon2017.Especie
import tp.pokemon2017.Pokemon
import tp.pokemon2017.RepositorioEntrenadores
import tp.pokemon2017.TipoDePokemon

@Accessors
class RepoEntrenadores {

	RepositorioEntrenadores repo
	var TipoDePokemon agua 
	var TipoDePokemon fuego 
	val tablaDeNiveles = newLinkedHashMap(2 -> 1000, 3 -> 3000, 4 -> 6000, 5 -> 10000, 6 -> 15000, 7 -> 21000,
		8 -> 28000, 9 -> 36000, 10 -> 45000, 11 -> 55000, 12 -> 65000, 13 -> 75000, 14 -> 85000, 15 -> 100000, 16 ->
			120000, 17 -> 140000, 18 -> 160000, 19 -> 185000, 20 -> 210000)

	new() {

		repo = RepositorioEntrenadores.instance
		this.crearTipos()
		this.crearNPC()
	}

	def crearNPC() {
		var List<Entrenador> trainers = #[
			new Entrenador("Ash", tablaDeNiveles, 20) => [
				experiencia = 10000
				coordenadaActual = new Point(-58.442857, 34.551667)
				equipoPokemon = #[new Pokemon() => [
					experiencia = 3000
					especie = nuevaEspecie("Totodile", #[agua], 8)
					coordenadaActual = new Point(1, 2)
					saludActual = 100
				]]
			],
			new Entrenador("Misty", tablaDeNiveles, 20) => [
				experiencia = 15000
				esExperto = true
				coordenadaActual = new Point(-58.443857, 34.551667)
				equipoPokemon = #[new Pokemon() => [
					experiencia = 1200
					especie = nuevaEspecie("Quilava", #[agua], 8)
					coordenadaActual = new Point(1, 2)
					saludActual = 100
				]]
			],
			new Entrenador("Brock", tablaDeNiveles, 20) => [
				experiencia = 21000
				esExperto = true
				coordenadaActual = new Point(58.441856, 34.551667)
				equipoPokemon = #[new Pokemon() => [
					experiencia = 0
					especie = nuevaEspecie("Onix", #[fuego], 8)
					coordenadaActual = new Point(1, 2)
					saludActual = 100
				]]
			],
			new Entrenador("Red", tablaDeNiveles, 20) => [
				experiencia = 750000
				coordenadaActual = new Point(58.441856, 34.551667)
				equipoPokemon = #[new Pokemon() => [
					experiencia = 0
					especie = nuevaEspecie("Bulbasaur", #[agua], 8)
					coordenadaActual = new Point(1, 2)
					saludActual = 100
				]]
			],
			new Entrenador("Gary", tablaDeNiveles, 20) => [
				experiencia = 450000
				esExperto = true
				coordenadaActual = new Point(-58.441856, 34.551667)
				equipoPokemon = #[new Pokemon() => [
					experiencia = 0
					especie = nuevaEspecie("Charizard", #[fuego], 8)
					coordenadaActual = new Point(1, 2)
					saludActual = 100
				]]
			]
		]
		trainers.forEach[trainer|trainer.calcularNivel() repo.create(trainer)]
		repo.updatePlayer(new Entrenador("Leo", tablaDeNiveles, 20) => [
			experiencia = 450000
			esExperto = true
			coordenadaActual = new Point(-58.441856, 34.551667)
			victorias = 6
		])
	}

	def nuevaEspecie(String name, List<TipoDePokemon> _tipos, int _velocidad) {
		var _especie = new Especie() => [
			nombre = name
			ataqueBase = 10
			saludBase = 15
			tipos = _tipos
			velocidad = _velocidad
		]
		_especie
	}

	def crearTipos() {
		fuego = new TipoDePokemon("fuego",#[agua],#[agua])
		agua =new TipoDePokemon("agua",#[fuego],#[fuego])
	}

}
