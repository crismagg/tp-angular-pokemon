class OponenteController {
    constructor(oponenteService) {
        this.oponenteService = oponenteService
        this.oponentes = []
        // this.getPlayer()
        this.obtenerOponentesCercanos()
        this.apuesta = 0
        this.victoria = ""
        this.distanciaCercana = 0.001
        this.pokemonesSalvajes = []
        this.pokemonSeleccionado
        this.obtenerPokemonesSalvajesCercanos()
        this.distanciaAAvanzar = 0.001
    }
    
    get player() {
        // this.oponenteService.findPlayer((response) => {
        //     this.player = this.transformarAEntrenador(response.data)
        //     this.player.calcularNivel()
        //     this.player.pokemonesCapturados = this.oponenteService.getPokemones()
        // })
        return this.oponenteService.player
    }
    obtenerOponentesCercanos() {
        this.oponenteService.findAll((response) => {
            this.oponentes = _.map(response.data, this.transformarAEntrenador)
            
        })
    }
    obtenerPokemonesSalvajesCercanos(){
        this.pokemonesSalvajes = this.oponenteService.getPokemones()
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
    seleccionar(pokemon){
        this.pokemonSeleccionado = pokemon
    }
    capturar(pokemon){
        this.player.capturar(pokemon)
        this.pokemonesSalvajes.pop(pokemon)
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