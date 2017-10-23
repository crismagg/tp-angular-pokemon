class PokemonService{
    constructor(){
        this.especies = [{nombre:"pikachu",nivel:5},{nombre:"charmander",nivel:5},{nombre:"cristian",nivel:100}]
    }
}
// class PokemonService {

//     constructor() {
//         let electricidad
//         let fuego
//         let agua
//         let planta
//         let volador
//         this.tipos = []
//         this.especies = []
//         this.getEspecies()
//     }


//     // init() {
//     //     this.tiposCrear()
//     //     this.especiesCrear()
//     // }


//     // especiesCrear() {
//     //     this.especies.add(new Especie("pikachu", [electrico], 10))
//     //     this.especies.add(new Especie("charmander", [fuego], 9))
//     //     this.especies.add(new Especie("squartile", [agua], 13))
//     //     this.especies.add(new Especie("bulbasaur", [planta], 11))
//     //     this.especies.add(new Especie("pidgey", [volador], 12))
//     // }

//     // tiposCrear() {


//     //     this.electricidad = new TipoEspecie('electricidad', [electricidad], [agua])
//     //     this.fuego = new TipoEspecie('fuego', [fuego], [planta])
//     //     this.agua = new TipoEspecie('agua', [agua], [fuego])
//     //     this.planta = new TipoEspecie('planta', [agua, planta], [agua])
//     //     this.normal = new TipoEspecie('volador', [electrico], [volador])

//     //     this.tipos.add(electricidad)
//     //     this.tipos.add(fuego)
//     //     this.tipos.add(agua)
//     //     this.tipos.add(planta)
//     //     this.tipos.add(normal)
//     // }
//     getEspecies() {
//         this.especies = [{
//             nombre: "Pikachu",
//             nivel: 20
//         }, {
//             nombre: "Charmander",
//             nivel: 21
//         }]
//     }

//     buscarEspecie(_nombre) {
//         return this.especies.find(function (_especie) {
//             return _especie.nombre === _nombre
//         })
//     }
//     buscarTipo(_nombre) {
//         return this.especies.find(function (_tipo) {
//             return _tipo.nombre === _nombre
//         })
//     }
// }

