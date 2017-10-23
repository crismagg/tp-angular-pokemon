class BotonesController {
    constructor(oponenteService) {
        this.oponenteService = oponenteService
        this.player
        this.getPlayer()
        // this.coordenadaGeografica //= new Punto(-58.441856,34.551667)
        this.distanciaAAvanzar = 0.001
    }
    getPlayer() {
        this.oponenteService.findPlayer((response) => {
            this.player = this.transformarAEntrenador(response.data)
            this.player.calcularNivel()
        })
    }   
    transformarAEntrenador(jsonEntrenador) {
        return Entrenador.asEntrenador(jsonEntrenador)
    }

    actualizar() {
        this.oponenteService.updatePlayer(this.player, () => {})
    }
    norte() {
        this.player.coordenadaActual.y = this.player.coordenadaActual.y + this.distanciaAAvanzar
        this.actualizar()
    }
    sur() {
        this.player.coordenadaActual.y = this.player.coordenadaActual.y - this.distanciaAAvanzar
        this.actualizar()
    }
    este() {
        this.player.coordenadaActual.x = this.player.coordenadaActual.x - this.distanciaAAvanzar
        this.actualizar()
    }
    oeste() {
        this.player.coordenadaActual.x = this.player.coordenadaActual.x + this.distanciaAAvanzar
        this.actualizar()
    }
}