package tp.pokemon2017

import java.util.List
import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.geodds.Point

@Accessors
@TransactionalAndObservable
class Area {
	String name
	Point extremo1
	Point extremo2
	List<Pokemon> pokemones = newArrayList
	int nivelMinimo
	int nivelMaximo

	new(Point point1, Point point2) {
		extremo1 = point1
		extremo2 = point2
	}

// RANDOM ESPECIE//
// RANDOM NIVEL 
// RANDOM UBICACION
	def poblar(List<Especie> _especies, int densidad, int nivelMax, int nivelMin) {
		if(nivelMax < 1 || nivelMin < 1) throw new BusinessException("Niveles Incorrectos")

		if(_especies.isEmpty) throw new BusinessException("No Hay Especies")

		if (densidad < 1) {
			throw new BusinessException("Densidad negativa")
		}

		var List<Especie> especies = randomEspecie(_especies, densidad)
		nivelMaximo = nivelMax
		nivelMinimo = nivelMin

		especies.forEach[esp|crearPokemon(esp)]
	}

	def cantidadPokemonesACrear(int densidad) {
		( area * densidad ).intValue
	}

	def area() {
		var Point punto = new Point(extremo2.x, extremo1.y)
		var double base = extremo1.distance(punto)
		var double altura = extremo2.distance(punto)
		base * altura
	}

	def randomizar(int rango, int valorInicial) {
		var ran = new Random()
		(ran.nextDouble * rango + valorInicial).intValue
	}

	def randomizar(double rango, double valorInicial) {
		var ran = new Random()
		(ran.nextDouble * rango + valorInicial).intValue
	}

	def experiencia(int nivel) {
		((((Math.pow(((nivel * 2) - 50), 2) ) / 100) - 25) / 2).intValue

	}

	def randomEspecie(List<Especie> especiero, int densidad) {
		var List<Especie> especiesCreadas = newArrayList
		var int idLista
		for (var int especieCreada; especieCreada < cantidadPokemonesACrear(densidad); especieCreada++) {

			idLista = randomizar(especiero.size, 0)
			especiesCreadas.add(especiero.get(idLista))

		}
		especiesCreadas

	}

	def randomNivel() {
		var rangoExperienciaDeNiveles = (experiencia(nivelMaximo) - experiencia(nivelMinimo))
		var experienciaNivelMinimo = experiencia(nivelMinimo)

		randomizar(rangoExperienciaDeNiveles, experienciaNivelMinimo)

	}

	def randomUbicacion() {
		var double xNuevo = randomizar((extremo2.x - extremo1.x), extremo1.x)
		var double yNuevo = randomizar((extremo2.y - extremo1.y), extremo1.y)
		var Point nuevaUbicacion = new Point(xNuevo, yNuevo)
		nuevaUbicacion
	}

	def crearPokemon(Especie _especie) {
		pokemones.add(
			new Pokemon => [
				especie = _especie
				coordenadaActual = randomUbicacion
			]
		)
	}

}
