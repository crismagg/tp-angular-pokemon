class Resultado{
    constructor(pokemon,entrenador,result){
        this.pokemon = pokemon
        this.entrenador = entrenador
        this.result = result
    }

    get resultado(){
        if(this.result){
            return "Venciste a "
        }
        else return "Perdiste con "
    }
    get contrincante(){
        return this.entrenador.nombre
    }
}