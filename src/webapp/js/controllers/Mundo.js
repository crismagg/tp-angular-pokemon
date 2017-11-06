class MundoController{
    constructor(playerService){
        this.playerService = playerService

    }

    get player(){
        return this.playerService.player
    }

}