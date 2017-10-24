class EntrenadorController {
    
        constructor(oponenteService) {
            this.entrenador = new Entrenador()
            this.player
            this.especies = this.entrenador.especiesCapturadas
        }
    
        getPlayer() {
            this.oponenteService.findPlayer((response) => {
                this.player = Entrenador.asEntrenador(response.data)
            })
        }
    
    
    
    }