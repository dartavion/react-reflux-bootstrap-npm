Reflux = require('reflux')

countActions = require('../actions/count-actions')

module.exports = Reflux.createStore

  count: (count) ->
    @trigger(count)

