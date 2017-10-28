class OponenteService {
    constructor($http) {
        this.$http = $http
        let player
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

    takePlayer() {
        this.findPlayer((response) => {
            this.player = this.transformarAEntrenador(response.data)
            this.player.calcularNivel()
        })
    }

    transformarAEntrenador(jsonEntrenador) {
        return Entrenador.asEntrenador(jsonEntrenador)
    }

    getPokemones() {
        let electricidad
        let fuego
        let agua
        let pikachu
        let charmander
        let pokemon1
        let pokemon2
        let entrenador1
        let entrenador2

        electricidad = new TipoEspecie("electricidad", [electricidad], [fuego])
        fuego = new TipoEspecie("fuego", [electricidad], [])
        agua = new TipoEspecie("agua", [fuego], [fuego])

        pikachu = new Especie('Pikachu', [electricidad, agua], 10)
        pikachu.imagen = "img/PIKACHU.png"
        charmander = new Especie('Charmander', [fuego], 20)
        charmander.imagen = "https://vignette2.wikia.nocookie.net/es.pokemon/images/b/be/Charmander_%28anime_SO%29.png/revision/latest?cb=20120906002506"
        pokemon1 = new Pokemon(pikachu, entrenador1)
        pokemon2 = new Pokemon(charmander, entrenador2)

        this.pokemonesSalvajes.push(pokemon1)
        this.pokemonesSalvajes.push(pokemon2)
    }

    salvajeCapturado(pokemon) {
        var pos = this.pokemonArrayId(pokemon)
        this.borrar(pos)

        // if (pos > 0) {
        //     this.pokemonesSalvajes.splice(pos-1, 1)
        //     console.log(this.pokemonesSalvajes)
        // }
        // else if(pos == 0){
        //     this.pokemonesSalvajes.splice(pos, 1)
        // }
        
    }
    // borrar(posicion){
    //     if(posicion == 0){
    //         var eliminado =this.pokemonesSalvajes.shift()
    //     }
    //     else {
    //         var eliminado = this.pokemonesSalvajes.slice(posicion-1,1)
    //     }

    //     // var tempArray = []
    //     // delete array[posicion]
    //     // array.forEach(function(poke){
    //     //     if(poke == undefined){
    //     //     }else{
    //     //         tempArray.push(poke)
    //     //     }
    //     // })
    //     // this.pokemonesSalvajes = tempArray
    // }
    

    // pokemonArrayId(pokemon) {
    //     // return this.pokemonesSalvajes.indexOf(function (_pokemon) {
    //     //     return _pokemon.id == pokemon.id
    //     // })
    //     this.pokemonABuscar = this.pokemonesSalvajes.filter(function (poke) {
    //         return poke.id == pokemon.id
    //     })[0]
    //     return this.pokemonesSalvajes.indexOf(this.pokemonABuscar)
    // }

    // addSalvaje(pokemon) {
    //     pokemon.id = this.idGenerate
    //     this.pokemonesSalvajes.push(pokemon)
    //     this.idGenerate++
    // }



}