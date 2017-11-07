class TipoEspecie {
    constructor() {
        this.nombre
        this.resistente
        this.fuerte
    }

    static asTipo(tipo) {
        return angular.extend(new TipoEspecie(), tipo)
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
}