describe('entrenador', () => {
    let entrenador 
  
    beforeEach(() => {
        entrenador = new Entrenador()
    })
  
    it('Entrenador tiene 0 puntos de experiencia', () => {
        expect(0).toBe(entrenador.experiencia)
    }) 
    it('Entrenador tiene nivel 1', () => {
        expect(1).toBe(entrenador.nivel)
    }) 
    it('Entrenador gana puntos de experiencia pero se queda en nivel 1', () => {
        entrenador.ganaExperiencia(300)
        expect(1).toBe(entrenador.nivel)
    }) 
    it('Entrenador gana puntos de experiencia para pasar justo a nivel 2', () => {
        entrenador.ganaExperiencia(1000)
        expect(2).toBe(entrenador.nivel)
    }) 
    it('Entrenador gana puntos de experiencia para pasar a nivel 2 con un poco de experiencia extra', () => {
        entrenador.ganaExperiencia(1400)
        expect(2).toBe(entrenador.nivel)
    }) 
    it('Entrenador gana puntos de experiencia para pasar justo de nivel 1 a 3 ', () => {
        entrenador.ganaExperiencia(3000)
        expect(3).toBe(entrenador.nivel)
    }) 
    it('Entrenador gana puntos de experiencia para pasar de nivel 1 a 3 con un poco de experiencia extra', () => {
        entrenador.ganaExperiencia(3200)
        expect(3).toBe(entrenador.nivel)
    })
    it('Entrenador gana puntos de experiencia para pasar a nivel 10', () => {
        entrenador.ganaExperiencia(46000)
        expect(10).toBe(entrenador.nivel)
    })  
    it('Entrenador gana puntos de experiencia para pasar a nivel maximo', () => {
        entrenador.ganaExperiencia(210000)
        expect(20).toBe(entrenador.nivel)
    })  
})
