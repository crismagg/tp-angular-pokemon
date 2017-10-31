class Pokeball {
    constructor() {
        this.nombre = "Pokeball"
        this.costo = 80
        this.chance = 1
        this.cantidad = 0
    }

    static asPokeball(pokeballJson){
        return angular.extend(new Pokeball(),pokeballJson)
    }
    usar() {
        if (this.cantidad > 0) {
            this.cantidad -= 1
        }
    }

}