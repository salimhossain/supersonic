supersonic = require './core'
superscope = require './angular/superscope'

module.exports = (angular) ->
  superscope(angular)

  angular
    .module('supersonic', [
      'supersonic.superscope'
    ])
    .service('supersonic', ($q) ->
      qify = (f) -> (args...) -> $q.when f args...
      qifyAll = (object) ->
        result = {}
        for key, value of object
          result[key] = switch true
            when value instanceof Function then qify value
            when value instanceof Object then qifyAll value
            else value
        result

      qifyAll supersonic
    )