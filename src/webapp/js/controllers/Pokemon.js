class PokemonController {
    constructor(pokemonService, oponenteService) {
        this.pokemonService = pokemonService
        this.oponenteService = oponenteService
        this.especies = this.pokemonService.especies
        this.player
        this.actualizarPlayer()
    }
    

    actualizarPlayer() {
        this.oponenteService.findPlayer((response) => {
            this.player = _.map(response, Entrenador.asEntrenador())
        })
    }

}