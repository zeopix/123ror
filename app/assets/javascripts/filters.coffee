filters = angular.module('filters',[])
filters.filter 'getById', ->
  (input, id) ->
    i = 0
    len = input.length
    while i < len
      if +input[i].id == +id
        return input[i]
      i++
    null
