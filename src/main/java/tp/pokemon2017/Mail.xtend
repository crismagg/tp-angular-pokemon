package tp.pokemon2017

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

class MailService{
	
	def recibir(Mail mail){
		mail
	}
	
}
@Accessors
class CasillaDeCorreo{
	List<Mail> inbox = newArrayList 
	
	def recibir(Mail mail){
		inbox.add(mail)
	}
	
}

@Accessors
class Mail {
	String mensaje
	String titulo
	Entrenador emisor

	new(String _titulo, String _mensaje, Entrenador _emisor) {
		titulo = _titulo
		mensaje = _mensaje
		emisor = _emisor
	}
	
}
