class Entrenador {
    constructor() {
        this.nombre
        this.nivel
        this.nivelMaximo = 20
        this.experiencia = 0;
        // this.especiesCapturadas = []
        this.tablaDeNiveles = [0, 1000, 3000, 6000, 10000, 15000, 21000, 28000, 36000, 45000, 55000, 65000, 75000, 85000, 100000, 120000, 140000, 160000, 185000, 210000]
        this.esExperto
        this.coordenadaActual
        this.victorias
        this.dinero
        this.apuesta = 0
        // this.distanciaCercana = 0.001
        this.calcularNivel()
    }

    // ------------------------------------------------------------------------------------------------------------------
    // EXPERIENCIA ENTRENADOR
    ganaExperiencia(experienciaGanada) {
        this.experiencia += experienciaGanada
        this.calcularNivel()
    }
    // get pokemonElegido(){
    //     return pokemonCapturado[0]
    // }

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
        return angular.extend(new Entrenador(), jsonEntrenador)
    }

    esCercano(oponente) {
        return Math.abs((Math.abs(oponente.coordenadaActual.x) - Math.abs(this.coordenadaActual.x)) <= this.distanciaCercana) &&
            Math.abs((Math.abs(oponente.coordenadaActual.y) - Math.abs(this.coordenadaActual.y))) <= this.distanciaCercana
    }

    batallar(oponente) {
        if (this.ganarBatalla()) {
            if (this.apuesta != null) {

                this.dinero += this.apuesta
                this.apuesta=0
            }
        }
    }

    ganarBatalla(oponente) {
        return true
        // return Math.random() <=
        //     (this.pokemonElegido.chanceVictoria() / (this.pokemonElegido.chanceVictoria() + oponente.pokemonElegido.chanceVictoria()))
    }

    capturar(pokemon) {
        return Math.random() <= this.chancesCapturar() / (this.chancesCapturar() + pokemon.chancesEscapar())
    }

    chancesCapturar() {
        return this.nivel
    }


}