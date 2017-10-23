class OponenteController {
    constructor(oponenteService) {
        this.oponenteService = oponenteService
        this.player
        this.prueba = new Entrenador()
        this.oponentes = []
        this.apuesta = 0
        this.victoria = ""
        this.obtenerOponentesCercanos()
    }

    obtenerOponentesCercanos() {
        this.oponenteService.findAll((response) => {
            this.oponentes = _.map(response.data, this.transformarAEntrenador)

        })
    }

    getPlayer() {
        this.oponenteService.findPlayer((response) => {
            this.player = _.map(response.data, this.transformarAEntrenador)
        })
    }
    transformarAEntrenador(jsonEntrenador) {
        return Entrenador.asEntrenador(jsonEntrenador)
    }
    proximidad(oponente){
        return Entrenador.esCercano(this.player,oponente)
    }
    battle() {
        if (this.apuesta < 100) {
            
            this.victoria = "Ganaste!!"
        } else(this.victoria = "Perdiste!!")
    }
    mostrarImagen() {
        this.imagen = "https://material.io/guidelines/static/spec/images/callouts/default.svg"
    }
}