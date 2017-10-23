package tp.pokemon2017

import org.eclipse.xtend.lib.annotations.Accessors

//Clase creada con el único propósito de generar objetos Hembra o Macho (para evitar uso de strings)


interface Genero {

  def boolean esMacho()
}

class Macho implements Genero{
	
	
	override esMacho(){
		true
	}
}

class Hembra implements Genero{
	
	override esMacho(){
		false
	}
	
}