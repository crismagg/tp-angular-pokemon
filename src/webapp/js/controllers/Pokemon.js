class PokemonController {
    constructor(pokemonService) {
        this.pokemonService = pokemonService
        this.player
        this.getPlayer()
    }


    getPlayer() {
        this.pokemonService.findPlayer((response) => {
            this.player = this.transformarAEntrenador(response.data)
            this.player.calcularNivel()
        })
    }
    transformarAEntrenador(jsonEntrenador) {
        return Entrenador.asEntrenador(jsonEntrenador)
    }
}