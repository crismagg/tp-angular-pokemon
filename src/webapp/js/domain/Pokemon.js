class Pokemon {
    constructor(_especie, _propietario) {
        this.experiencia = 0
        this.especie = _especie
        this.propietario = _propietario
        this.velocidad
        this.nombre
        this.genero
        this.saludActual
    }
    get nivel() {
        return Math.floor((Math.sqrt(100 * (2 * this.experiencia + 25)) + 50) / 100)
    }

    ganaExperiencia(_experiencia) {
        this.experiencia += _experiencia
    }

    get ataque() {
        return this.especie.ataqueBasico * this.nivel
    }
    get defensa() {
        return this.especie.defensaBasica * this.nivel
    }
    get puntosDeSalud() {
        return this.especie.saludBase * this.nivel
    }
    get chancesEscapar() {
        return this.nivel * (1 + this.velocidad / 10)
    }

    esFuerte(pokemonRival) {
        return this.especie.esFuerteA(pokemonRival.especie)
    }

    esResistente(pokemonRival) {
        return this.especie.esFuerteA(pokemonRival.especie)
    }


    chancesVictoria(pokemon_rival) {
        return this.ataque * this.chancesFuerte(pokemon_rival) * this.chancesResistente(pokemon_rival) * this.chancesPropietarioExperto(pokemon_rival)
    }

    chancesFuerte(pokemon_rival) {
        const fuerte = 1.25
        const noFuerte = 1
        if (this.esFuerte(pokemon_rival)) {
            return fuerte
        }
        return noFuerte
    }

    chancesResistente(pokemon_rival) {
        const resistente = 1.5
        const noResistente = 1
        if (this.esResistente(pokemon_rival)) {
            return resistente
        }
        return noResistente
    }

    chancesPropietarioExperto() {
        const experto = 1.2
        const noExperto = 1
        if (this.propietario.esExperto()) {
            return experto
        }
        return noExperto
    }
    curarCompleto(){
        this.saludActual = this.salud()
    }
}