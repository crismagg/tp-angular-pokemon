class Especie {
    constructor(_nombre, _tipos, _atkBasico) {
        this.tipos = _tipos
        this.ataqueBasico = _atkBasico
        this.nombre = _nombre
        this.velocidad
        this.imagen
        this.descripcion

    }

    static asEspecie(especieJson){
        var tiposTemp = _.map(especieJson.tipos,TipoEspecie.asTipo)
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