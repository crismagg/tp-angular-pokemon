class OponenteService {
    constructor($http) {
        this.$http = $http
        this.player
        this.idGenerate = 0
        this.pokemonesSalvajes = []
    }

    findAll(callback) {
        this.$http.get('http://localhost:9000/oponentes').then(callback)
    }


    transformarAEntrenador(jsonEntrenador) {
        return Entrenador.asEntrenador(jsonEntrenador)
    }

}