class EntrenadorController {
    
        constructor(oponenteService) {
            this.oponenteService = oponenteService
            this.especies = this.player.pokemonesCapturados
            this.pokemonSeleccionado
        }
        

        // getPlayer() {
        //     this.oponenteService.findPlayer((response) => {
        //         this.player = Entrenador.asEntrenador(response.data)
        //     })
        // }
        get player() {
            return this.oponenteService.player
        }
        
        seleccionar(pokemon){
            this.pokemonSeleccionado = pokemon
        }
    
    
    }