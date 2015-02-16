factories = angular.module('factories',[])
factories.factory 'spinnerHttpInterceptor', [
  '$q'
  '$rootScope'
  '$injector'
  ($q, $rootScope, $injector) ->
    $rootScope.showSpinner = false
    $rootScope.http = null
    {
      'request': (config) ->
        $rootScope.showSpinner = true
        config or $q.when(config)
      'requestError': (rejection) ->
        $rootScope.http = $rootScope.http or $injector.get('$http')
        if $rootScope.http.pendingRequests.length < 1
          $rootScope.showSpinner = false
        if canRecover(rejection)
          return responseOrNewPromise
        $q.reject rejection
      'response': (response) ->
        $rootScope.http = $rootScope.http or $injector.get('$http')
        if $rootScope.http.pendingRequests.length < 1
          $rootScope.showSpinner = false
        response or $q.when(response)
      'responseError': (rejection) ->
        $rootScope.http = $rootScope.http or $injector.get('$http')
        if $rootScope.http.pendingRequests.length < 1
          $rootScope.showSpinner = false
        if canRecover(rejection)
          return responseOrNewPromise
        $q.reject rejection

    }
]
