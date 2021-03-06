angular.module("pokemonApp", ['ui.router'])
    .service("playerService", PlayerService)
    .service("oponenteService", OponenteService)
    .service("salvajeService", SalvajeService)
    .service("pokeparadaService", PokeparadaService)
    .controller("elMundoController", MundoController)
    .controller("oponenteController", OponenteController)
    .controller("entrenadorController", EntrenadorController)
    .controller("botonesController", BotonesController)
    .controller("pokeparadaController", PokeparadaController)
    .controller("salvajesController", SalvajesController)
    .component("oponentes", oponentesComponent)
    .component("pokemonesSalvajes", pokemonesSalvajes)
    .component("pokeparadas", pokeparadasComponent)
    .config(routes)