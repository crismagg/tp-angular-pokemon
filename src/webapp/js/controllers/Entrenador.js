class EntrenadorController {

    constructor(playerService) {
        this.playerService = playerService
        this.especies = this.player.pokemonesCapturados
        this.pokemonSeleccionado
    }


    get player() {
        return this.playerService.player
    }

    seleccionar(pokemon) {
        this.pokemonSeleccionado = pokemon
    }


}