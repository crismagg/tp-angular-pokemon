package tp.pokemon2017

import com.fasterxml.jackson.annotation.JsonIgnore
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Especie {
	@JsonIgnore int numeroID
	@JsonIgnore int evolucionID
	int saludBase
	int ataqueBase
	int velocidad
	@JsonIgnore int nivelEvolucion
	String nombre
	String descripcion
	@JsonIgnore boolean tieneEvolucion
	@JsonIgnore Especie especieEvolucion
	List<TipoDePokemon> tipos = newArrayList
	String imagen

	new() {
	}

//	new(int salud, int atack, int speed, String name, String description, List<TipoDePokemon> _tipos) {
//		saludBase = salud
//		ataqueBase = atack
//		velocidad = speed
//		nombre = name
//		descripcion = description
//		tipos = _tipos
//
//	}

	// RESISTENCIAS Y DEBILIDADES
	def esFuerteA(Pokemon rival) {
		tipos.exists(tipoDePokemon|tipoDePokemon.fortaleza(rival.especie))
	}

	def esResistenteA(Pokemon rival) {
		tipos.exists(tipoDePokemon|tipoDePokemon.resistencia(rival.especie))
	}

	// EVOLUCION
	def puedeEvolucionar(Pokemon pokemon) {
		if (pokemon.nivel() >= nivelEvolucion) {
			pokemon.evolucionar(especieEvolucion)
		}

	}

//------ ENTREGA 2 -----------
	def validar() {
		var boolean especieValida = true

		if (ataqueBase == 0 || saludBase == 0 || nombre == null || numeroID == 0 || descripcion == null ||
			velocidad < 1 || velocidad > 10) {
			throw new BusinessException("La Especie Es Inválida")
		}

		especieValida

	}
//---------------------------	 
}
