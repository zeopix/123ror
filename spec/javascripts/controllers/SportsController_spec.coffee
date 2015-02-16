fixture.preload "sports.json"
describe "SportsController", ->
  scope        = null
  ctrl         = null
  location     = null
  routeParams  = null
  http     = null
  controllerService = null
  sports = sports: fixture.load('sports.json', true)
  # access injected service later
  httpBackend  = null

  setupController = (id=false)->
    inject(($location, $routeParams, $rootScope, $resource, $httpBackend, $controller,$http)->
      scope       = $rootScope.$new()
      location    = $location
      resource    = $resource
      routeParams = $routeParams
      httpBackend = $httpBackend
      http = $http
      controllerService = $controller
      if id != false
        routeParams.id = id
      httpBackend.expectGET(new RegExp("sports")).respond(200,sports)
      ctrl = $controller "SportsController",
                $scope: scope,
                $location: location,
                $routeParams : routeParams
      httpBackend.flush()

    )
  afterEach ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()
  beforeEach(module("betvictor"))
  describe 'sports list', ->
    describe 'controller initialization', ->
      it 'load no sport', ->
        setupController()
        expect(typeof(scope.sport)).toBe(false)
    describe 'controller initialization', ->
      it 'load sports', ->
        setupController()
        expect(scope.sports).toEqualData(sports.sports)
  describe 'sport show', ->
    describe 'controller initialization', ->
      it 'load sport', ->
        setupController(2)
        expect(scope.sport.id).toBe(2)
    describe 'controller initialization', ->
      it 'load sports', ->
        expect(scope.sports).toEqualData(sports.sports)
