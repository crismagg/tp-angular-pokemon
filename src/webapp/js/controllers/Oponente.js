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
    }
    get distanciaCercana(){
        return 0.001
    }
    get distanciaAAvanzar(){
       return 0.001
    }
    get player() {
        return this.oponenteService.player
    }
    get pokemonesSalvajes() {
        return this.oponenteService.pokemonesSalvajes
    }
    obtenerOponentesCercanos() {
        this.oponenteService.findAll((response) => {
            this.oponentes = _.map(response.data, this.transformarAEntrenador)

        })
    }

    transformarAEntrenador(jsonEntrenador) {
        return Entrenador.asEntrenador(jsonEntrenador)
    }
    proximidad(objeto) {
        return this.player.esCercano(objeto.coordenadaActual)
    }
    battle() {
        this.resultadoBatalla = new Resultado(this.player.pokemonElegido.especie.nombre,this.oponenteBatalla,this.player.batallar(this.oponenteBatalla))
    }
    seleccionar(oponente) {
        this.oponenteBatalla = oponente
    }
    capturar(pokemon) {
        this.player.capturar(pokemon)
    }
    elegirPokemonBatalla(pokemon){
        this.pokemonBatalla = pokemon
    }
} 