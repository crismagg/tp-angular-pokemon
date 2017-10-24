const routes = ($stateProvider, $urlRouterProvider) => {

    $urlRouterProvider.otherwise('/');

    $stateProvider

        .state('elMundo', {
            url: "/",
            templateUrl: "partials/el-mundo.html" ,
            controller: "pokemonController as PkmCtrl"

        })

        .state('entrenador', {
            url: "/",
            templateUrl: "partials/entrenador.html",
            controller: "oponenteController as entrenador"
        })

}