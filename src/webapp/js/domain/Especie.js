class Especie {
    constructor(_nombre, _tipos, _atkBasico) {
        this.tipos = _tipos
        this.ataqueBasico = _atkBasico
        this.nombre = _nombre
        this.velocidad
        this.imagen

    }

    static asEspecie(especieJson){
        console.log(especieJson.tipos)
        var tiposTemp = _.map(especieJson.tipos.data,TipoEspecie.asTipo)
        var especieTemp = angular.extend(new Especie(),especieJson)
        especieTemp.tipos = tiposTemp 
        return especieTemp
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