class OponenteController {
    constructor(oponenteService) {
        this.oponenteService = oponenteService
        this.oponentes = []
        this.obtenerOponentesCercanos()
        this.apuesta = 0
        this.victoria = ""
        this.pokemonSeleccionado
        this.pokemonBatalla
        this.oponenteBatalla
        this.resultadoBatalla
        this.resultadoCaptura
        this.nuevoMote
        this.vm = this
    }
    get distanciaCercana() {
        return 0.001
    }
    get distanciaAAvanzar() {
        return 0.001
    }
    obtenerOponentesCercanos() {
        this.oponenteService.findAll((response) => {
            this.oponentes = _.map(response.data, this.transformarAEntrenador)

        })
        this.oponentes.forEach(function(trainer){
            trainer.llenarPokemonesCapturados()
        })
    }

    get batallaValida(){
        return this.vm.player.pokemonesCapturados.length > 0 
    }

    transformarAEntrenador(jsonEntrenador) {
        return Entrenador.asEntrenador(jsonEntrenador)
    }
    proximidad(objeto) {
        return this.vm.player.esCercano(objeto.coordenadaActual)
    }
    battle() {
        this.resultadoBatalla = new Resultado(this.vm.player.pokemonElegido.especie.nombre, this.oponenteBatalla, this.vm.player.batallar(this.oponenteBatalla))
    }
    seleccionar(oponente) {
        this.oponenteBatalla = oponente
    }
    elegirPokemonBatalla(pokemon) {
        this.pokemonBatalla = pokemon
    }
}