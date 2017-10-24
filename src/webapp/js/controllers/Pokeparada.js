class PokeparadaController {
    constructor(pokeparadaService) {
        this.servicio = pokeparadaService
        this.pokeparadas = []
        this.obtenerPokeparadasCercanas()
    }

    obtenerPokeparadasCercanas(){
        this.pokeparadas = [{nombre:"Pokeparada Unsam"},{nombre:"Pokeparada Miguelete"}]
    }

    curar(){
    }
}