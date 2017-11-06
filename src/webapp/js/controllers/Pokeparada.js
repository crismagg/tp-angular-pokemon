class PokeparadaController {
    constructor() {
        this.pokeparadas = []
        this.obtenerPokeparadasCercanas()
        this.curado = false
        this.vm = this
    }

    obtenerPokeparadasCercanas() {
        let pokeUnsam = new Pokeparada()
        pokeUnsam.nombre = "Pokeparada Unsam"
        pokeUnsam.coordenadaActual = {
            x: -58.442857,
            y: 34.551667
        }
        let pokeMiguelete = new Pokeparada()
        pokeMiguelete.nombre = "Pokeparada Miguelete"
        pokeMiguelete.coordenadaActual = {
            x: -58.441856,
            y: 34.551667
        }
        this.pokeparadas = [pokeUnsam, pokeMiguelete]
    }

    curar() {
        this.vm.player.pokemonesCapturados.forEach(function (pokemon) {
            pokemon.curarCompleto()
        })
        this.curado = true
    }

}