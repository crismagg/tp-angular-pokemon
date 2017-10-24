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

    updatePlayer(player, callback) {
        this.$http.put('http://localhost:9000/player/', player).then(callback)
    }

    getPokemones(){
        let electricidad
        let fuego
        let agua
        let pikachu
        let charmander
        let pokemon1
        let pokemon2
        let entrenador1
        let entrenador2

        electricidad = new TipoEspecie("electricidad",[electricidad], [fuego])
        fuego = new TipoEspecie("fuego",[electricidad], [])
        agua = new TipoEspecie("agua",[fuego], [fuego])

        pikachu = new Especie('Pikachu',[electricidad, agua], 10)
        pikachu.imagen = "img/PIKACHU.png"
        charmander = new Especie('Charmander',[fuego], 20)
        charmander.imagen = "https://vignette2.wikia.nocookie.net/es.pokemon/images/b/be/Charmander_%28anime_SO%29.png/revision/latest?cb=20120906002506"
        pokemon1 = new Pokemon(pikachu,entrenador1)
        pokemon2 = new Pokemon(charmander,entrenador2)

        return [pokemon1,pokemon2] 
    }



}