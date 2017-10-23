package tp.pokemon2017

import com.fasterxml.jackson.annotation.JsonIgnore
import com.fasterxml.jackson.annotation.JsonProperty
import java.util.ArrayList
import java.util.Collection
import java.util.HashMap
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.geodds.Point

@Accessors
@TransactionalAndObservable
class Entrenador {
	String nombre
	int nivel
	int nivelMaximo
	int experiencia
	boolean esExperto = false
	@JsonIgnore val HashMap tablaDeNiveles
	@JsonIgnore List<Especie> especiesAtrapadas = new ArrayList()
	@JsonIgnore Collection<Pokemon> equipoPokemon = new ArrayList()
	@JsonIgnore Collection<Pokemon> depositoPokemon = new ArrayList()
	@JsonIgnore TipoDeEntrenador tipoDeEntrenador
	@JsonIgnore Point coordenadaActual
	@JsonIgnore public static var random = [|return Math.random]
	@JsonIgnore int victorias = 0
	@JsonIgnore int cantidadPokemonesEvolucionados = 0
	@JsonIgnore double dinero = 100
	@JsonIgnore Bolso bolso
	@JsonIgnore Combate combate
	@JsonIgnore Pokemon pokemonElegido

//ENTREGA 4
	@JsonIgnore List<Accion> acciones = newArrayList
	@JsonIgnore List<Entrenador> amistades = newArrayList
	@JsonIgnore List<Entrenador> solicitudes = newArrayList
	@JsonIgnore List<Entrenador> entrenadoresNotificados = newArrayList
	@JsonIgnore List<String> notificaciones = newArrayList
	@JsonIgnore CasillaDeCorreo casilla

//ENTREGA 4
	new(HashMap experienciaPorNivel, int maxLvl) {
		tablaDeNiveles = experienciaPorNivel
		nivelMaximo = maxLvl
		experiencia = 0
		nivel = 1
	}

	new(String name, HashMap experienciaPorNivel, int maxLvl) {
		nombre = name
		tablaDeNiveles = experienciaPorNivel
		nivelMaximo = maxLvl
		experiencia = 0
		nivel = 1
	}

// EXPERIENCIA ENTRENADOR
	def ganaExperiencia(int experienciaGanada) {
		experiencia += experienciaGanada
		calcularNivel()
	}

// NIVELES
	def calcularNivel() {
		var experienciaNivelSiguiente = tablaDeNiveles.get(nivel + 1) as Integer
		if (experienciaNivelSiguiente <= experiencia) {
			subirNivel
		}
	}

	def subirNivel() {
		nivel++
		acciones.forEach[action|action.notificar(this)]
		if (nivel < nivelMaximo) { // Para subir mas de un nivel a la vez
			calcularNivel()
		}
	}

// COMPRA DE ITEMS
	def comprarItem(Pokeparada pokeparada, Item item) {
		if (coordenadaActual.distance(pokeparada.getUbicacion) > 0.01) {
			throw new BusinessException("La pokeparada Se Encuentra lejos")
		}
		if (pokeparada.comprarItem(item) > dinero) {
			throw new BusinessException("Dinero Insuficiente")
		}
		dinero -= pokeparada.comprarItem(item)
		bolso.agregarNuevoItem(item)

	}

// UTILIZAR POCION
	def curarPokemon(Pokemon pokemon, Pocion pocion) {

		if (bolso.hayPociones(pocion) && pokemon.noTieneSaludAlMaximo()) {
			pokemon.curarPokemon(pocion)
			bolso.usarItem(pocion)

		}
	}

	def crearPocion(Pocion pocion, Ingrediente ingrediente) {

		bolso.mejorarPocion(pocion, ingrediente)

	}

// CAPTURA DE POKEMON
	def pokemonesCapturados() {
		(equipoPokemon + depositoPokemon)
	}

	def pokemonNoCapturadoAnteriormente(Pokemon pokemon) {
		if (equipoPokemon.contains(pokemon) || depositoPokemon.contains(pokemon))
			throw new BusinessException("Pokemon Ya Capturado")
	// Evitar capturar el mismo pokemon 2 veces(no misma especie)
	}

	def capturaPokemon(Pokemon pokemon, Pokeball pokeball) {
		bolso.hayPokeballs(pokeball)
		estaEnRangoEl(pokemon)
		pokemonNoCapturadoAnteriormente(pokemon)
		bolso.usarItem(pokeball)
		if (randomCaptura(pokemon, pokeball)) {
			ganaExperiencia(100)
			agregarPokemon(pokemon)
			especieNoAtrapada(pokemon)

		}

	}

	def especieNoAtrapada(Pokemon pokemon) {
		if (!especiesAtrapadas.contains(pokemon.especie)) {
			pokemon.propietario = this
			especiesAtrapadas.add(pokemon.especie)
			ganaExperiencia(tipoDeEntrenador.experienciaPorCaptura())
		}

	}

	def estaEnRangoEl(Pokemon pokemon) {
		if (!(pokemon.distanciaAlPunto(coordenadaActual) < 0.01))
			throw new BusinessException("el pokemon esta fuera de rango")
	}

	def randomCaptura(Pokemon pokemon, Pokeball pokeball) {
		Math.random() <= chancesDeAtrapar(pokeball) / (chancesDeAtrapar(pokeball) + pokemon.chancesEscapar())
	}

	def chancesDeAtrapar(Pokeball pokeball) {
		if (tipoDeEntrenador.esExperto(this)) {
			(nivel + (0.5 * nivel)) * pokeball.chance

		} else {
			(nivel) * pokeball.chance
		}

	}

// CONDICIONES DEL DESTINO DEL POKEMON CAPTURADO
	def equipoSinCompletar() {
		equipoPokemon.size() < 6
	}

	def agregarPokemon(Pokemon pokemon) {
		pokemonNoCapturadoAnteriormente(pokemon)
		if (equipoSinCompletar) {
			equipoPokemon.add(pokemon)
		} else {
			depositoPokemon.add(pokemon)
		}
	}

// CONDICIONES PARA EL TIPO DE ENTRENADOR SEA EXPERTO
	def esExperto() {
		esExperto = tipoDeEntrenador.esExperto(this)
	}

//TIPO DE ENTRENADOR
	def cambiarTipoDeEntrenador(TipoDeEntrenador nuevoTipoDeEntrenador) {
		tipoDeEntrenador = nuevoTipoDeEntrenador
	}

	// LUCHADOR
	def sumarVictorias() {
		victorias++
	}

	// COLECCIONISTA
	def cantidadEspeciesAtrapadas() {
		especiesAtrapadas.size()
	}

	def generoDePokemonesCapturadosBalanceado() {
		(cantidadPokemonesMacho() <= (pokemonesCapturados.size * 0.55).intValue) &&
			(cantidadPokemonesMacho() >= (pokemonesCapturados.size * 0.45).intValue)
	}

	def cantidadPokemonesMacho() {
		pokemonesCapturados().filter[pokemon|pokemon.esMacho()].size
	}

	def porcentajeDePokemonesMachos(Pokemon pokemon) {
		cantidadPokemonesMacho() * 100 / pokemonesCapturados().size()
	}

	// CRIADOR
	def sumarEvolucionesRealizadas() {
		cantidadPokemonesEvolucionados++
	}

	def cantidadPokemonesMayorANivel(int nivelBuscado) {
		pokemonesCapturados().filter(pokemon|pokemon.nivel() > nivelBuscado).size
	}

// DESPLAZAMIENTO
	def desplazarmeAUnPunto(Point nuevaCoordenada) {
		coordenadaActual = nuevaCoordenada
	}

// COMBATE
	def desafiarA(Entrenador entrenadorRival, double dineroApostado) {
		if (coordenadaActual.distance(entrenadorRival.coordenadaActual) >= 0.005) {
			combate = new Combate(dineroApostado, this, entrenadorRival)
			combate.realizarCombate()
		}
	}

	def elegirPokemon(Pokemon miPokemon) {
		pokemonElegido = miPokemon
	}

	def chancesEntrenadorExperto() {
		var double porcentajeSiEsExperto = 1.2
		var double porcentajeSiNoEsExperto = 1
		if (esExperto) {
			porcentajeSiEsExperto
		} else {
			porcentajeSiNoEsExperto
		}
	}

//DINERO
	def variarDinero(double _dinero) {
		dinero += _dinero
	}

// ENTREGA 4 ---------------------------------------------------------
//OBSERVERS
	def agregarAccion(Accion nuevaAccion) {
		acciones.add(nuevaAccion)
	}

	def removerAccion(Accion accionARemover) {
		acciones.remove(accionARemover)
	}

//FIN OBSERVERS
//AMISTADES
	def agregarAmigo(Entrenador nuevoAmigo) {
		if (amistades.contains(nuevoAmigo)) {
			throw new BusinessException("El Entrenador ya es mi amigo")
		}
		amistades.add(nuevoAmigo)
		nuevoAmigo.amistades.add(this)
		nuevoAmigo.solicitudes.remove(this)
	}

	def removerAmigo(Entrenador amigo) {
		if (!amistades.contains(amigo)) {
			throw new BusinessException("No existe dicho amigo en mi lista")
		}
		amigo.amistades.remove(this)
		amistades.remove(amigo)
	}

//SOLICITUDES
	def solicitarAmistad(Entrenador posibleAmigo) {
		if (amistades.contains(posibleAmigo)) {
			throw new BusinessException("El Entrenador ya es mi amigo")
		}
		posibleAmigo.recibirSolicitud(this)
	}

	def recibirSolicitud(Entrenador posibleAmigo) {
		solicitudes.add(posibleAmigo)
	}

	def aceptarSolicitud(Entrenador trainer) {
		if (!solicitudes.contains(trainer)) {
			throw new BusinessException("El Entrenador indicado no envió una solicitud de amistad")
		}
		agregarAmigo(trainer)
	}

	def denegarSolicitud(Entrenador rechazoAmigo) {
		if (!solicitudes.contains(rechazoAmigo)) {
			throw new BusinessException("El Entrenador indicado no envió una solicitud de amistad")
		}
		solicitudes.remove(rechazoAmigo)

	}

//FIN SOLICITUDES
//FIN AMISTADES
//NOTIFICACIONES
	def recibirNotificacion(String notificacion) {
		notificaciones.add(notificacion)
	}
//FIN NOTIFICACIONES
}
