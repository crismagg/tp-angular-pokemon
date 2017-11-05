class OponenteService {
    constructor($http) {
        this.$http = $http
        this.player
        this.idGenerate = 0
        this.pokemonesSalvajes = []
        this.getPokemones()
        this.takePlayer()
    }

    findAll(callback) {
        this.$http.get('http://localhost:9000/oponentes').then(callback)
    }

    findPlayer(callback) {
        this.$http.get('http://localhost:9000/player').then(callback)
    }

    updatePlayer(player, callback) {
        this.$http.put('http://localhost:9000/player/', player).then(callback)
    }
    findSalvajes(callback) {
        this.$http.get('http://localhost:9000/salvajes').then(callback)
    }

    takePlayer() {
        this.findPlayer((response) => {
            this.player = this.transformarAEntrenador(response.data)
            this.player.calcularNivel()
        })
    }

    getPokemones() {
        this.findSalvajes((response) => {
            this.pokemonesSalvajes = _.map(response.data, this.asPokemon)

        })
    }
    asPokemon(jsonPokemon){
        return Pokemon.transformarAPokemon(jsonPokemon)
    }

    transformarAEntrenador(jsonEntrenador) {
        return Entrenador.asEntrenador(jsonEntrenador)
    }

    // getPokemones() {
    //     let electricidad
    //     let fuego
    //     let agua
    //     let pikachu
    //     let charmander
    //     let pokemon1
    //     let pokemon2
    //     let entrenador1
    //     let entrenador2

    //     electricidad = new TipoEspecie("electricidad", [electricidad], [fuego])
    //     fuego = new TipoEspecie("fuego", [electricidad], [])
    //     agua = new TipoEspecie("agua", [fuego], [fuego])

    //     pikachu = new Especie('Pikachu', [electricidad, agua], 10)
    //     pikachu.imagen = "img/PIKACHU.png"
    //     pikachu.velocidad = 8
    //     charmander = new Especie('Charmander', [fuego], 20)
    //     charmander.imagen = "https://vignette2.wikia.nocookie.net/es.pokemon/images/b/be/Charmander_%28anime_SO%29.png/revision/latest?cb=20120906002506"
    //     charmander.velocidad = 4
    //     pokemon1 = new Pokemon(pikachu, entrenador1)
    //     pokemon1.experiencia = 20000
    //     pokemon2 = new Pokemon(charmander, entrenador2)
    //     this.pokemonesSalvajes.push(pokemon1)
    //     this.pokemonesSalvajes.push(pokemon2)
    // }


}