class TipoEspecie {
    constructor(_nombre,_resistente, _fuerte) { 
        this.nombre = _nombre
        this.resistente = _resistente
        this.fuerte = _fuerte
    }

    fortaleza(tiposRival) {
        var fuertes = this.fuerte
        return tiposRival.some(function (tipo) {
            return fuertes.some(function (tipoFuerte) {
                return tipo === tipoFuerte
            })
        })
    }

    resistencia(tiposRival) {
        var resistentes = this.resistente
        return tiposRival.some(function (tipo) {
            return resistentes.some(function (tipoResistente) {
                return tipo === tipoResistente
            })
        })
    }


    // resistencia(tipos) {
    //     return tipos.some(function (tipo) {
    //         this.resistente.has(tipo)
    //     })
    // }
    // esFuerte(element) {
    //     return this.contains(fuerte, element)
    // }

    // contains(_array, _value) {
    //     return _array.some(function (array_value) {
    //         return _value === array_value
    //     })
    // }

}