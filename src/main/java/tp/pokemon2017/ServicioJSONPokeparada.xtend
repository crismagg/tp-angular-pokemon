package tp.pokemon2017


import java.util.List
import org.json.JSONArray
import org.json.JSONObject
import org.uqbar.geodds.Point
import java.util.ArrayList

class ServicioJSONPokeparada {
	List<Pokeparada> listaPokeparadas = newArrayList
//PROCESA LOS TIPOS RECIBIDOS POR JSON Y CREA OBJETOS DE TIPO ITEM PARA LA LISTA DE LA POKEPARADA
	def transformarListaItemsDisponibles(String listaItemsDisponibles) {
		var List<Item> listaItems = new ArrayList()
		var String[] listaItemsString = listaItemsDisponibles.split("\\W+")
			
			for(var indice = 0; indice < listaItemsString.length; indice++){ 
				if(listaItemsString.get(indice).equals("pokebola")){ listaItems.add(new Pokeball(80,1))} 
				if(listaItemsString.get(indice).equals("superball")){ listaItems.add(new Pokeball(150,1.1))}  
				if(listaItemsString.get(indice).equals("ultraball")){ listaItems.add(new Pokeball(200,1.25))} 
				if(listaItemsString.get(indice).equals("pocion")) { listaItems.add(new PocionNormal(50,20))} 
				if(listaItemsString.get(indice).equals("superpocion")) { listaItems.add(new PocionNormal(100,50))} 
			}	

		listaItems
	}
	
//INICIO UPDATE UNITARIO
	def Pokeparada transformarEnPokeparada(JSONObject jsonObject) {
		 new Pokeparada() =>[
			ubicacion = new Point(jsonObject.getDouble("x"), jsonObject.getDouble("y"))
			nombre = jsonObject.getString("nombre")

			var String todosLosItemsDeLaPokeparada = jsonObject.getString("itemsDisponibles") 		 
			itemsDisponibles = transformarListaItemsDisponibles(todosLosItemsDeLaPokeparada)
		]
		
	}
//FIN UPDATE UNITARIO

//INICIO UPDATE MASIVO
	def transformarArrayJSON(JSONArray jsonArray){
		
		for (var indice = 0; indice < jsonArray.length(); indice++) {
  			listaPokeparadas.add(transformarEnPokeparada(jsonArray.getJSONObject(indice)))
		}
		
	}
	
	def getListaPokeparadas(){
		listaPokeparadas
	}
//FIN UPDATE MASIVO

}
