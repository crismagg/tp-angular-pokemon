class BotonesController {
    constructor(playerService) {
        this.playerService = playerService
        this.distanciaAAvanzar = 0.001
    }
    get player(){
        return this.playerService.player
    }
    actualizar() {
        this.oponenteService.updatePlayer(this.player, () => {})
    }
    norte() {
        this.player.coordenadaActual.y = this.player.coordenadaActual.y + this.distanciaAAvanzar
    }
    sur() {
        this.player.coordenadaActual.y = this.player.coordenadaActual.y - this.distanciaAAvanzar
    }
    este() {
        this.player.coordenadaActual.x = this.player.coordenadaActual.x - this.distanciaAAvanzar
    }
    oeste() {
        this.player.coordenadaActual.x = this.player.coordenadaActual.x + this.distanciaAAvanzar
    }
}