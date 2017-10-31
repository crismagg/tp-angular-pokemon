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
    }
    get distanciaCercana() {
        return 0.001
    }
    get distanciaAAvanzar() {
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
        this.resultadoBatalla = new Resultado(this.player.pokemonElegido.especie.nombre, this.oponenteBatalla, this.player.batallar(this.oponenteBatalla))
    }
    seleccionar(oponente) {
        this.oponenteBatalla = oponente
    }
    capturar() {
        this.resultadoCaptura = this.player.capturar(this.pokemonSeleccionado)
    }
    nombrar() {
        var mote = this.nuevoMote

        if (mote == null) {
            mote = this.pokemonSeleccionado.especie.nombre
        }
        this.pokemonSeleccionado.nombre = mote
        this.player.agregarAlEquipo(this.pokemonSeleccionado)
    }
    elegirPokemonBatalla(pokemon) {
        this.pokemonBatalla = pokemon
    }

    seleccionarSalvaje(pokemon) {
        this.pokemonSeleccionado = pokemon
        this.capturar()
    }
    noTienePokebola(){
        return !this.player.hayPokeballs()
    }
    pokemonCapturado(){
        return !this.noTienePokebola() && this.resultadoCaptura
    }
    pokemonNoCapturado(){
        return !this.noTienePokebola() && !this.resultadoCaptura
    }

}