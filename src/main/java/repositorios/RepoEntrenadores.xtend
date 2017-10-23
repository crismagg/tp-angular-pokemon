package repositorios

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point
import tp.pokemon2017.Entrenador
import tp.pokemon2017.RepositorioEntrenadores

@Accessors
class RepoEntrenadores {

	RepositorioEntrenadores repo
	val tablaDeNiveles = newLinkedHashMap(2 -> 1000, 3 -> 3000, 4 -> 6000, 5 -> 10000, 6 -> 15000, 7 -> 21000,
		8 -> 28000, 9 -> 36000, 10 -> 45000, 11 -> 55000, 12 -> 65000, 13 -> 75000, 14 -> 85000, 15 -> 100000, 16 ->
			120000, 17 -> 140000, 18 -> 160000, 19 -> 185000, 20 -> 210000)

	new() {

		repo = RepositorioEntrenadores.instance
		this.crearNPC()
	}

	def crearNPC() {
		var List<Entrenador> trainers = #[
			new Entrenador("Ash", tablaDeNiveles, 20) => [
				experiencia = 10000
				coordenadaActual = new Point(-58.442857, 34.551667)
			],
			new Entrenador("Misty", tablaDeNiveles, 20) => [
				experiencia = 15000
				esExperto = true
				coordenadaActual = new Point(-58.443857, 34.551667)
			],
			new Entrenador("Brock", tablaDeNiveles, 20) => [
				experiencia = 21000
				esExperto = true
				coordenadaActual = new Point(58.441856, 34.551667)
			],
			new Entrenador("Red", tablaDeNiveles, 20) => [
				experiencia = 750000
				coordenadaActual = new Point(58.441856, 34.551667)
			],
			new Entrenador("Gary", tablaDeNiveles, 20) => [
				experiencia = 450000
				esExperto = true
				coordenadaActual = new Point(-58.441856, 34.551667)
			]
		]
		trainers.forEach[trainer|trainer.calcularNivel() repo.create(trainer)]
		repo.updatePlayer(new Entrenador("Leo", tablaDeNiveles, 20) => [
			experiencia = 450000
			esExperto = true
			coordenadaActual = new Point(-58.441856, 34.551667)
		])
	}

}
