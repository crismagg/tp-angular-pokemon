class BotonesController {
    constructor(oponenteService) {
        this.oponenteService = oponenteService
        // this.coordenadaGeografica //= new Punto(-58.441856,34.551667)
        this.distanciaAAvanzar = 0.001
    }
    get player(){
        return this.oponenteService.player
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