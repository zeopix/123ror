controllers = angular.module('controllers',[])
controllers.controller("SportsController", [ '$scope', '$routeParams', '$location','$http','$filter',
  ($scope,$routeParams,$location,$http,$filter)->
    $scope.sports = []
    $http.get('sports').success((data) ->
      $scope.sports = data.sports
      if typeof($routeParams.sportId) != "undefined"
        $scope.sport = $filter('getById')($scope.sports,$routeParams.sportId);
      if typeof($routeParams.eventId) != "undefined"
        $scope.event = $filter('getById')($scope.sport.events,$routeParams.eventId);
    ).error (a)->
      alert("Http Error ocurred")
    null

    #initialization
    $scope.sport = false;
    $scope.event = false;

])
