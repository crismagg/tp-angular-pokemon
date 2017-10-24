class OponenteController {
    constructor(oponenteService) {
        this.oponenteService = oponenteService
        this.player
        this.getPlayer()
        this.oponentes = []
        this.obtenerOponentesCercanos()
        this.apuesta = 0
        this.victoria = ""
        this.distanciaCercana = 0.001
        this.pokemonesSalvajes = []
        
    }

    getPlayer() {
        this.oponenteService.findPlayer((response) => {
            this.player = this.transformarAEntrenador(response.data)
            this.player.calcularNivel()
        })
    }
    obtenerOponentesCercanos() {
        this.oponenteService.findAll((response) => {
            this.oponentes = _.map(response.data, this.transformarAEntrenador)
            
        })
    }
    transformarAEntrenador(jsonEntrenador) {
        return Entrenador.asEntrenador(jsonEntrenador)
    }
    proximidad(oponente) {
        return this.player.esCercano(oponente) && oponente.nombre !== this.player.nombre
    }

    battle(oponente) {
        this.player.batallar(oponente)
        
        // if (this.apuesta < 100) {

        //     this.victoria = "Ganaste!!"
        // } else(this.victoria = "Perdiste!!")
    }
    mostrarImagen() {
        this.imagen = "https://material.io/guidelines/static/spec/images/callouts/default.svg"
    }
}