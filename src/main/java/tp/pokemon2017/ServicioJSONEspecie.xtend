package tp.pokemon2017

import java.util.List
import org.json.JSONArray
import org.json.JSONObject
import java.util.ArrayList

class ServicioJSONEspecie { 
	List<Especie> listaEspecies = newArrayList
//PROCESA LOS TIPOS RECIBIDOS POR JSON Y CREA OBJETOS DE TIPODEPOKEMON PARA LA LISTA DE LA ESPECIE
	def transformarListaTipoEspecie(String tiposDeEspecieRecibidos) {
		var List<TipoDePokemon> tiposEspecie = new ArrayList()
		var String[] todosLosTiposDeEspecies = tiposDeEspecieRecibidos.split("\\W+")
		
			for(var indice = 1; indice < todosLosTiposDeEspecies.length; indice++){ 
				var TipoDePokemon tipoAAgregar = new TipoDePokemon
				tipoAAgregar.tipo = todosLosTiposDeEspecies.get(indice)
				tiposEspecie.add(tipoAAgregar)
			}	

		tiposEspecie
	}
	
//INICIO UPDATE UNITARIO
	def Especie transformarEnEspecie(JSONObject jsonObject) {
		 new Especie() =>[
			numeroID = jsonObject.getInt("numero")
			nombre = jsonObject.getString("nombre")
			ataqueBase = jsonObject.getInt("puntosAtaqueBase") 
			saludBase = jsonObject.getInt("puntosSaludBase")
			descripcion = jsonObject.getString("descripcion")
			velocidad = jsonObject.getInt("velocidad") 
			evolucionID = jsonObject.getInt("evolucion")
			nivelEvolucion = jsonObject.getInt("nivelEvolucion")

			var String tiposDeEspecie = jsonObject.getString("tipos") 		 
			tipos = transformarListaTipoEspecie(tiposDeEspecie)
		]
	}
	

//FIN UPDATE UNITARIO

//INICIO UPDATE MASIVO
	def transformarArrayJSON(JSONArray jsonArray){
		
		for (var indice = 0; indice < jsonArray.length(); indice++) {
  			listaEspecies.add(transformarEnEspecie(jsonArray.getJSONObject(indice)))
		}
		
	}
	
	def getListaEspecies(){
		listaEspecies
	}
//FIN UPDATE MASIVO

}
