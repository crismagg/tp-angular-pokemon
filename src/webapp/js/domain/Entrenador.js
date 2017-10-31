class Entrenador {
    constructor() {
        this.nombre
        this.nivel
        this.nivelMaximo = 20
        this.experiencia = 0;
        this.esExperto
        this.pokemonesCapturados = []
        this.coordenadaActual
        this.dinero
        this.pokeballs
        this.victorias
        this.apuesta = 0
        // this.victoria
        this.pokemonElegido
        this.calcularNivel()
    }

    // ------------------------------------------------------------------------------------------------------------------
    // EXPERIENCIA ENTRENADOR
    ganaExperiencia(experienciaGanada) {
        this.experiencia += experienciaGanada
        this.calcularNivel()
    }
        
    get tablaDeNiveles() {
        return [0, 1000, 3000, 6000, 10000, 15000, 21000, 28000, 36000, 45000, 55000, 65000, 75000, 85000, 100000, 120000, 140000, 160000, 185000, 210000]
    }
    get distanciaCercana() {
        return 0.001
    }
    // NIVELES
    calcularNivel() {
        if ((this.tablaDeNiveles[this.nivel] <= this.experiencia) && (this.nivel < this.nivelMaximo)) {
            this.nivel++
                this.calcularNivel()
        }
    }

    static asEntrenador(jsonEntrenador) {
        var pokemones = _.map(jsonEntrenador.pokemonesCapturados, Pokemon.transformarAPokemon)
        var pokeball = Pokeball.asPokeball(jsonEntrenador.pokeballs)
        var entrenadorTemp = angular.extend(new Entrenador(), jsonEntrenador)
        entrenadorTemp.pokemonesCapturados = pokemones
        entrenadorTemp.pokeballs = pokeball
        return entrenadorTemp 
    }

    esCercano(coordenada) {
        return Math.abs(Math.abs(coordenada.x) - Math.abs(this.coordenadaActual.x)) <= this.distanciaCercana &&
            Math.abs(Math.abs(coordenada.y) - Math.abs(this.coordenadaActual.y)) <= this.distanciaCercana
    }

    batallar(oponente) {
        var result = this.ganarBatalla()
        if (result) {
            if (this.apuesta != null && this.apuesta > 0) {

                this.dinero += this.apuesta
                this.apuesta = 0
            }
        }
        return result
    }

    ganarBatalla(oponente) {
        return true
        // return Math.random() <=
        //     (this.pokemonElegido.chancesVictoria() / (this.pokemonElegido.chancesVictoria() + oponente.pokemonElegido.chancesVictoria()))
    }
    capturar(pokemon) {
        return true
        // return Math.random() <= this.chancesCapturar() / (this.chancesCapturar() + pokemon.chancesEscapar())
    }
    agregarAlEquipo(pokemon) {
        this.pokeballs.usar()
        this.pokemonesCapturados.push(this.nuevoPokemon(pokemon))
    }

    nuevoPokemon(pokemon) {
        var poke = new Pokemon()
        // poke.experiencia = 0
        poke.especie = pokemon.especie
        poke.propietario = pokemon.propietario
        // poke.velocidad = pokemon.velocidad
        poke.nombre = pokemon.nombre
        // poke.genero = pokemon.genero
        // poke.salud = pokemon.salud
        return poke

    }
    hayPokeballs(){
        return this.pokeballs.cantidad >0
    }

    chancesCapturar() {
        return this.nivel
    }


}