class EntrenadorService{
    constructor($http){
        this.$http = $http
    }

    findPlayer(callback){
        this.$http.get('/player').then(callback)
    }
}