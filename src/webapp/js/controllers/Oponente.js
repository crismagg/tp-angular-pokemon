class OponenteController {
    constructor(oponenteService) {
        this.oponenteService = oponenteService
        this.player
        this.getPlayer()
        this.oponentes = []
        this.obtenerOponentesCercanos()
        this.apuesta = 0
        this.victoria = ""
        this.distanciaCercana = 0.001
        this.pokemonesSalvajes = []
        this.imagenEspecie //= "https://cdn6.aptoide.com/imgs/5/9/0/590ec974ff82245193c53f4947d1c803_icon.png?w=256"
        this.pokemonSeleccionado
    }

    getPlayer() {
        this.oponenteService.findPlayer((response) => {
            this.player = this.transformarAEntrenador(response.data)
            this.player.calcularNivel()
            this.player.pokemonesCapturados = this.oponenteService.getPokemones()
        })
    }
    obtenerOponentesCercanos() {
        this.oponenteService.findAll((response) => {
            this.oponentes = _.map(response.data, this.transformarAEntrenador)
            
        })
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
    mostrarImagen(especie) {
        this.imagenEspecie = especie.imagen
    }
}