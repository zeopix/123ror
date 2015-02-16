controllers = angular.module('controllers',[])
controllers.controller("SportsController", [ '$scope', '$routeParams', '$location','$http','$filter',
  ($scope,$routeParams,$location,$http,$filter)->
    $scope.sports = []
    $http.get('sports').success((data) ->
      $scope.sports = data.sports
    ).error (a)->
      alert("Http Error ocurred")
    null
    $scope.sport = false;
    if typeof($routeParams.id) != "undefined"
      $scope.sport = $filter('getById')($scope.sports,$routeParams.id);
])
