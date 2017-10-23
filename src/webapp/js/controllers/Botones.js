class BotonesController{
    constructor(oponenteService){
        this.oponenteService = oponenteService
        this.player
        this.getPlayer()    
        // this.coordenadaGeografica //= new Punto(-58.441856,34.551667)
        this.distanciaAAvanzar = 0.001
    }

    getPlayer() {
        this.oponenteService.findPlayer((response) => {
            this.player =( _.map(response.data, this.transformarAEntrenador))[0]
        })  
    }
    transformarAEntrenador(jsonEntrenador) {
        return Entrenador.asEntrenador(jsonEntrenador)
    }

    norte(){
        this.player.coordenadaActual.y=this.player.coordenadaActual.y + this.distanciaAAvanzar
    }
    sur(){
        this.player.coordenadaActual.y=this.player.coordenadaActual.y - this.distanciaAAvanzar
    }
    este(){
        this.player.coordenadaActual.x=this.player.coordenadaActual.x - this.distanciaAAvanzar
    }
    oeste(){
        this.player.coordenadaActual.x=this.player.coordenadaActual.x + this.distanciaAAvanzar
    }
}