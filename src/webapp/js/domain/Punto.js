class Punto{

    // constructor(ejeX,ejeY){
    //     this.ejeX=ejeX
    //     this.ejeY = ejeY
    // }
    constructor(){
        this.x = 0.0
        this.y = 0.0
    }
    
   static asPunto(jsonPunto){
       return angular.extend(new Punto(),jsonPunto)
   }
}