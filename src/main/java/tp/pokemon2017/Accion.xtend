package tp.pokemon2017

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.Entity

@Accessors
@TransactionalAndObservable
abstract class Accion extends Entity{
	String name
	String descripcion
	
	def void notificar(Entrenador trainer)
//	def getDescripcion(){descripcion}

}

class ObtieneNivelMultiplo5 extends Accion {
	new (){
		name ="Obtener Nivel x5"
	}
	override def notificar(Entrenador trainer) {
		if (trainer.nivel % 5 === 0) {
			trainer.amistades.forEach [ amistad |
				amistad.recibirNotificacion("El Entrenador" + trainer.toString + "ha obtenido un nivel múltiplo de 5")
			]
			trainer.recibirNotificacion("El Entrenador" + trainer.toString + "ha obtenido un nivel múltiplo de 5")
		}
	}
}

class SuperaAmigosEnNivel extends Accion {
	new (){
		name ="Supera Nivel Amigos"
	}
	override def notificar(Entrenador trainer) {
		trainer.amistades.forEach[amistad |enviarA(amistad,trainer)]
	}

	def enviarA(Entrenador amistad, Entrenador trainer) {
		var Mail mail = new Mail("TE HAN SUPERADO EN NIVEL", "El entrenador" + trainer.toString + "te ha superado en nivel",
					trainer)
		if ((amistad.nivel < trainer.nivel) && (!trainer.entrenadoresNotificados.contains(amistad))) {
			amistad.recibirNotificacion("El entrenador" + trainer.toString + "te ha superado en nivel")
			amistad.casilla.recibir(mail)
			trainer.entrenadoresNotificados.add(amistad)
		}

	}

}

class NivelMasAltoAlcanzado extends Accion {
	new (){
		name ="Nivel Mas Alto Alcanzado"
	}
	override def notificar(Entrenador trainer) {
		if (trainer.nivel == trainer.nivelMaximo) {
			trainer.amistades.forEach[amistad|enviarA(amistad, trainer)]
		}
	}

	def enviarA(Entrenador amistad, Entrenador trainer) {

		amistad.recibirNotificacion("El entrenador" + trainer.toString + "ha alcanzado el máximo nivel")
		amistad.casilla.recibir(
			new Mail("NIVEL MAXIMO ALCANZADO", "El entrenador" + trainer.toString + "ha alcanzado el máximo nivel",
				trainer))
	}
}

class Recompensar extends Accion {


	var int nivelRecompensa
	var double recompensaMonetaria
	List<Item> recompensaItems = newArrayList

	new(List<Item> _itemRecompensa, double dineroRecompensa, int _nivelRecompensa) {
		name = "Recompensa nivel "+ _nivelRecompensa
		recompensaItems.addAll(_itemRecompensa)
		recompensaMonetaria = dineroRecompensa
		nivelRecompensa = _nivelRecompensa
	}

	override def notificar(Entrenador trainer) {
		if (trainer.nivel == nivelRecompensa) {
			recompensaItems.forEach[item|trainer.bolso.agregarNuevoItem(item)]
			trainer.dinero = trainer.dinero + recompensaMonetaria
		}
	}

}
