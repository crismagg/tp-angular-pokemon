package tp.pokemon2017

import java.util.List

class Administrador {

	def ejecutarProceso(Proceso proceso){
		proceso.execute()
	}
	def ejecutarProcesoMultiple(List<Proceso> procesos){
		procesos.forEach(process | process.execute())
	}
	
}
