class Pokeparada {
    constructor() {
        this.numeroID
        this.nombre
        this.coordenadaActual
    }
    validar() {
        this.ubicacion !== null &&
            this.nombre !== null

    }

    curarEquipo(pokemones) {

        pokemones.forEach(function (pokemon) {
            pokemon.curarCompleto()
        })

    }
}