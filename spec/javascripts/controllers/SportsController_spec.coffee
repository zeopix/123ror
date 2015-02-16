fixture.preload "sports.json"
describe "SportsController", ->
  scope        = null
  ctrl         = null
  location     = null
  routeParams  = null
  http     = null
  controllerService = null
  sports = sports: fixture.load('sports.json')[0]
  # access injected service later
  httpBackend  = null

  setupController = (sportId=false,eventId)->
    inject(($location, $routeParams, $rootScope, $resource, $httpBackend, $controller,$http)->
      scope       = $rootScope.$new()
      location    = $location
      resource    = $resource
      routeParams = $routeParams
      httpBackend = $httpBackend
      http = $http
      controllerService = $controller
      if sportId != false
        routeParams.sportId = sportId
      if eventId != false
        routeParams.eventId = eventId
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
        expect(scope.sport).toBe(false)
    describe 'controller initialization', ->
      it 'load sports', ->
        setupController()
        expect(scope.sports).toEqualData(sports.sports)
  describe 'sport show', ->
    describe 'controller initialization', ->
      it 'load sport', ->
        setupController(100)
        expect(scope.sport.id).toBe(100)
  describe 'event show', ->
    describe 'controller initialization', ->
      it 'load event', ->
        setupController(100,248849910)
        expect(scope.sportEvent.id).toBe(248849910)

