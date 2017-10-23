class OponenteService{
    constructor($http){
        this.$http = $http
    }

    findAll(callback){
        this.$http.get('http://localhost:9000/oponentes').then(callback)
    }

    findPlayer(player, callback){
        this.$http.get('http://localhost:9000/player/' + player.nombre).then(callback)
    }

}