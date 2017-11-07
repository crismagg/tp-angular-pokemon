class Entrenador {
    constructor() {
        this.nombre
        this.nivel = 0
        this.nivelMaximo = 20
        this.experiencia = 0;
        this.esExperto
        this.equipoPokemon
        this.pokemonesCapturados = []
        this.llenarPokemonesCapturados()
        this.coordenadaActual
        this.dinero
        this.pokeballs = new Pokeball()
        this.victorias = 0
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

    llenarPokemonesCapturados() {
        this.pokemonesCapturados = this.equipoPokemon
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
        var pokemones = _.map(jsonEntrenador.equipoPokemon, Pokemon.transformarAPokemon)
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
                this.victorias+=1
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
        // return true
        this.pokeballs.usar()
        var randomizer = Math.random()
        return randomizer <= this.chancesCapturar() / (this.chancesCapturar() + pokemon.chancesEscapar)
    }
    agregarAlEquipo(pokemon) {
        this.pokemonesCapturados.push(this.nuevoPokemon(pokemon))
    }

    nuevoPokemon(pokemon) {
        var poke = new Pokemon()
        poke.experiencia = pokemon.experiencia
        poke.especie = pokemon.especie
        poke.propietario = pokemon.propietario
        poke.nombre = pokemon.nombre
        poke.descripcion = pokemon.descripcion
        // poke.genero = pokemon.genero
        // poke.salud = pokemon.salud
        return poke

    }
    hayPokeballs() {
        return this.pokeballs.cantidad > 0
    }

    chancesCapturar() {
        var experto = 1
        if (this.esExperto) {
            experto = 1, 5
        }

        return this.nivel * experto
    }


}