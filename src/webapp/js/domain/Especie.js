class Especie {
    constructor(_nombre, _tipos, _atkBasico) {
        this.tipos = _tipos
        this.ataqueBasico = _atkBasico
        this.nombre = _nombre
        this.imagen

    }

    esFuerteA(especie) {
        return this.tipos.some(function (element) {

            return element.fortaleza(especie.tipos)
        })
    }

    esResistenteA(especie) {
        return this.tipos.some(function (element) {

            return element.resistencia(especie.tipos)
        })
    }
}