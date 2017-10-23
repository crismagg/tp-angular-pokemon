//ENUNCIADO:
// Modelar y testear en JS:

// 1) Cálculo de nivel en base a experiencia tanto para pokemons como entrenadores
// 2) Chances de ganar de un pokemon a otro (enunciado entrega algo2) = (Pts. ataque + 25% esFuerte + 15% esResistente + 20% entrenadorEsExperto) 

class Entrenador {
    constructor() {
        this.nivel = 1
        this.nivelMaximo = 20
        this.experiencia = 0;
        this.especiesCapturadas = [{
            nombre: "Pikachu",
            nivel: 12
        }, {
            nombre: "Charmander",
            nivel: 13
        }]
        this.tablaDeNivelesDeEntrenador = [0, 1000, 3000, 6000, 10000, 15000, 21000, 28000, 36000, 45000, 55000, 65000, 75000, 85000, 100000, 120000, 140000, 160000, 185000, 210000]
        this.esExperto
        this.coordenadaActual
        this.distanciaCercana = 0.001
    }

    // ------------------------------------------------------------------------------------------------------------------
    // EXPERIENCIA ENTRENADOR
    ganaExperiencia(experienciaGanada) {
        this.experiencia += experienciaGanada
        this.calcularNivel()
    }
    // ------------------------------------------------------------------------------------------------------------------
    // NIVELES
    calcularNivel() {
        if ((this.tablaDeNivelesDeEntrenador[this.nivel] <= this.experiencia) && (this.nivel < this.nivelMaximo)) {
            this.nivel++
                this.calcularNivel()
        }
    }
    transformarAPunto(jsonEntrenador) {
        return Punto.asPunto(jsonEntrenador)
    }
    static asEntrenador(jsonEntrenador) {
        return angular.extend(new Entrenador(), jsonEntrenador)
    }

    static esCercano(yo, oponente) {
        return Math.abs(oponente.coordenadaActual.x - yo.coordenadaActual.x) <= this.distanciaCercana &&
            Math.abs(oponente.coordenadaActual.y - yo.coordenadaActual.y) <= this.distanciaCercana
    }
    // ------------------------------------------------------------------------------------------------------------------
}

// OPCION 2 - ELIMINAR NIVELES Y HACERLO SOLO CON EXPERIENCIA, MENOS EXPRESIVO PERO AHORRO VARIABLES
// class Entrenador{
//     constructor(){
//         this.experiencia = 0;
//         this.tablaDeNivelesDeEntrenador = new Map([
//            [0,1][1000,2],[3000,3],[6000,4],[10000,5],[15000,6],[21000,7],[28000,8],[36000,9],
//            [45000,10],[55000,11],[65000,12],[75000,13],[85000,14],[100000,15],[120000,16],
//            [140000,17],[160000,18],[185000,19],[210000,20]
//         ])
//     }
// // ------------------------------------------------------------------------------------------------------------------
// // EXPERIENCIA ENTRENADOR
//     ganaExperiencia(experienciaGanada) {
//        this.experiencia += experienciaGanada
//        this.calcularNivel()
//     }
// // ------------------------------------------------------------------------------------------------------------------
// // NIVELES
//     calcularNivel() {
//        var experienciaNivelSiguiente = this.tablaDeNivelesDeEntrenador.get(nivel + 1) 
//        if (experienciaNivelSiguiente <= this.experiencia) {
//            this.subirNivel()
//        }
//     }

//     subirNivel() {
//       this.nivel++
//       if (this.nivel < this.nivelMaximo) { // Para subir mas de un nivel a la vez
//           this.calcularNivel()
//       }
//     }
// // ------------------------------------------------------------------------------------------------------------------
// }


// var $TABLE = $('#table');
// var $BTN = $('#export-btn');
// var $EXPORT = $('#export');

// $('.table-add').click(function () {
//   var $clone = $TABLE.find('tr.hide').clone(true).removeClass('hide table-line');
//   $TABLE.find('table').append($clone);
// });

// $('.table-remove').click(function () {
//   $(this).parents('tr').detach();
// });

// $('.table-up').click(function () {
//   var $row = $(this).parents('tr');
//   if ($row.index() === 1) return; // Don't go above the header
//   $row.prev().before($row.get(0));
// });

// $('.table-down').click(function () {
//   var $row = $(this).parents('tr');
//   $row.next().after($row.get(0));
// });

// // A few jQuery helpers for exporting only
// jQuery.fn.pop = [].pop;
// jQuery.fn.shift = [].shift;

// $BTN.click(function () {
//   var $rows = $TABLE.find('tr:not(:hidden)');
//   var headers = [];
//   var data = [];

//   // Get the headers (add special header logic here)
//   $($rows.shift()).find('th:not(:empty)').each(function () {
//     headers.push($(this).text().toLowerCase());
//   });

//   // Turn all existing rows into a loopable array
//   $rows.each(function () {
//     var $td = $(this).find('td');
//     var h = {};

//     // Use the headers from earlier to name our hash keys
//     headers.forEach(function (header, i) {
//       h[header] = $td.eq(i).text();   
//     });

//     data.push(h);
//   });

//   // Output the result
//   $EXPORT.text(JSON.stringify(data));
// });