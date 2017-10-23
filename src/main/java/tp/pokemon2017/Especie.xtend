package tp.pokemon2017

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Especie {
	int numeroID
	int evolucionID
	int saludBase
	int ataqueBase
	int velocidad
	int nivelEvolucion
	String nombre
	String descripcion
	boolean tieneEvolucion
	Especie especieEvolucion
	List<TipoDePokemon> tipos
	

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
 	def validar(){
 		var boolean especieValida = true
 		
 		if( ataqueBase == 0 || 
			saludBase == 0 || 
			nombre == null ||
			numeroID == 0 || 
			descripcion == null || 
			velocidad < 1 || velocidad > 10
			)
			{throw new BusinessException("La Especie Es Inválida")}
		
		especieValida
		
		
		
	} 
//---------------------------	 


}
