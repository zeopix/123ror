betvictor = angular.module('betvictor',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
  'factories',
  'filters'
])
betvictor.config([ '$routeProvider','$httpProvider'
  ($routeProvider,$httpProvider)->
    $httpProvider.interceptors.push 'myHttpInterceptor'
    $routeProvider
      .when('/sports',
        templateUrl: "index.html"
        controller: 'SportsController'
      )
      .when('/sports/:id',
        templateUrl: "events.html"
        controller: 'SportsController'
      )
      .otherwise("/sports");
])
