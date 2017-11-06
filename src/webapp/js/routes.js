const routes = ($stateProvider, $urlRouterProvider) => {

    $urlRouterProvider.otherwise('/');

    $stateProvider

        .state('elMundo', {
            url: "/",
            templateUrl: "partials/el-mundo.html",
            controller: "elMundoController as playerCtrl"

        })

        .state('entrenador', {
            url: "/",
            templateUrl: "partials/entrenador.html",
            controller: "entrenadorController as entrenador"
        })

}