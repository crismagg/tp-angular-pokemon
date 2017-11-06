class PlayerService {
    constructor($http) {
        this.$http = $http
        this.player
        this.takePlayer()
    }

    findPlayer(callback) {
        this.$http.get('http://localhost:9000/player').then(callback)
    }

    takePlayer() {
        this.findPlayer((response) => {
            this.player = this.transformarAEntrenador(response.data)
            this.player.calcularNivel()
        })
    }

    transformarAEntrenador(jsonEntrenador) {
        return Entrenador.asEntrenador(jsonEntrenador)
    }

}