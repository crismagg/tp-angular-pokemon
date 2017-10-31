angular.module("pokemonApp", ['ui.router'])
    .service("oponenteService", OponenteService)
    .service("pokeparadaService", PokeparadaService)
    .controller("oponenteController", OponenteController)
    .controller("entrenadorController", EntrenadorController)
    .controller("botonesController", BotonesController)
    .controller("pokeparadaController", PokeparadaController)
    .component("oponentes", oponentesComponent)
    .component("pokemonesSalvajes", pokemonesSalvajes)
    .component("pokeparadas", pokeparadasComponent)
    .config(routes)