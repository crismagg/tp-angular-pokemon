class EntrenadorController {
    
        constructor(oponenteService) {
            this.oponenteService = oponenteService
            this.especies = this.player.pokemonesCapturados
            this.pokemonSeleccionado
        }
        

        get player() {
            return this.oponenteService.player
        }
        
        seleccionar(pokemon){
            this.pokemonSeleccionado = pokemon
        }
    
    
    }