class OponenteService {
    constructor($http) {
        this.$http = $http
    }

    findAll(callback) {
        this.$http.get('http://localhost:9000/oponentes').then(callback)
    }

    findPlayer(callback) {
        this.$http.get('http://localhost:9000/player').then(callback)
    }

    updatePlayer(player,callback){
        this.$http.put('http://localhost:9000/player/', player).then(callback)
    }
}