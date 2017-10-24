
class Trainer {
    constructor(_experto){
        this.experto = _experto
    }
    esExperto(){
        return this.experto
    }
}

describe('pokemonFunc', () => {
    let fuego
    let agua
    let electricidad

    let especie1
    let especie2

    let pokemon1
    let pokemon2

    let entrenador1
    let entrenador2

    beforeEach(() => {
        entrenador1 = new Trainer(true)
        entrenador2 = new Trainer(false)

        electricidad = new TipoEspecie("electricidad",[electricidad], [fuego])
        fuego = new TipoEspecie("fuego",[electricidad], [])
        agua = new TipoEspecie("agua",[fuego], [fuego])

        especie1 = new Especie('pikachu',[electricidad, agua], 10)
        especie2 = new Especie('charmander',[fuego], 20)

        pokemon1 = new Pokemon(especie1, entrenador1)
        pokemon2 = new Pokemon(especie2, entrenador2)
    })

    it('experiencia 0 devuelve nivel 1', () => {
        expect(1).toBe(pokemon1.nivel)
    })

    it('ataque Basico En Nivel 1 devuelve Su Ataque Basico', () => {
        expect(10).toBe(pokemon1.ataque)
    })

    it('El pokemon gana 500 de experiencia y sube a nivel 3', () => {
        pokemon1.ganaExperiencia(500)
        expect(3).toBe(pokemon1.nivel)
    })

    it('El pokemon1 es fuerte sobre el pokemon2', ()=> {
        expect(true).toBe(pokemon1.esFuerte(pokemon2))
    })
    it('El pokemon2 NO es fuerte sobre el pokemon1', ()=> {
        expect(false).toBe(pokemon2.esFuerte(pokemon1))
    })

    it('El pokemon1 es resistente al pokemon2', ()=> {
        expect(true).toBe(pokemon1.esResistente(pokemon2))
    })

    it('El pokemon1 es fuerte contra el  pokemon2 entonces la chance devuelve 1.25 ', ()=> {
        expect(1.25).toBe(pokemon1.chancesFuerte(pokemon2))
    })
    it('El pokemon2 NO es fuerte contra el  pokemon2 entonces la chance devuelve 1 ', ()=> {
        expect(1).toBe(pokemon2.chancesFuerte(pokemon1))
    })
    it('El pokemon1 es Resistente contra el  pokemon2 entonces la chance devuelve 1.5 ', ()=> {
        expect(1.5).toBe(pokemon1.chancesResistente(pokemon2))
    })
    it('El pokemon2 NO es Resistente contra el  pokemon2 entonces la chance devuelve 1 ', ()=> {
        expect(1).toBe(pokemon2.chancesResistente(pokemon1))
    })

    it('El Propietario del pokemon1 es experto entonces la chance devuelve 1.2 ', ()=> {
        expect(1.2).toBe(pokemon1.chancesPropietarioExperto())
    })
    it('El Propietario del pokemon NO es experto entonces la chance devuelve 1 ', ()=> {
        expect(1).toBe(pokemon2.chancesPropietarioExperto())
    })
    it('las chances de victoria debe dar el ataque basico del pokemon * 2.25(suma total)', ()=> {
        expect(22.5).toBe(pokemon1.chancesVictoria(pokemon2))
    })
})