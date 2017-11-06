class SalvajeService{
    constructor($http){
        this.$http = $http
        this.pokemonesSalvajes   
    }

    findSalvajes(callback) {
        this.$http.get('http://localhost:9000/salvajes').then(callback)
    }

    getPokemones() {
        this.findSalvajes((response) => {
            this.pokemonesSalvajes = _.map(response.data, this.asPokemon)

        })
    }
    asPokemon(jsonPokemon) {
        return Pokemon.transformarAPokemon(jsonPokemon)
    }
}