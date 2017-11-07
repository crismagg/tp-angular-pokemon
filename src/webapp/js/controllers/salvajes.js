class SalvajesController {

    constructor(salvajeService) {
        this.salvajeService = salvajeService
        this.vm = this
        this.pokemonSeleccionado
        this.nuevoMote
    }
    noTienePokebola() {
        var hayPokebolas = this.vm.player.hayPokeballs()
        return !hayPokebolas
    }

    pokemonCapturado() {
        return !this.noTienePokebola() && this.resultadoCaptura
    }

    pokemonNoCapturado() {
        return !this.noTienePokebola() && !this.resultadoCaptura
    }

    seleccionarSalvaje(pokemon) {
        this.pokemonSeleccionado = pokemon
        this.capturar()
    }

    capturar() {
        this.resultadoCaptura = this.vm.player.capturar(this.pokemonSeleccionado)
    }

    proximidad(objeto) {
        return this.vm.player.esCercano(objeto.coordenadaActual)
    }

    get pokemonesSalvajes() {
        return this.salvajeService.pokemonesSalvajes
    }

    seleccionarSalvaje(pokemon) {
        this.pokemonSeleccionado = pokemon
        this.capturar()
    }
    nombrar() {
        var mote = this.nuevoMote

        if (mote == null) {
            mote = this.pokemonSeleccionado.especie.nombre
        }
        this.nuevoMote = null
        this.pokemonSeleccionado.nombre = mote
        this.vm.player.agregarAlEquipo(this.pokemonSeleccionado)
    }
}