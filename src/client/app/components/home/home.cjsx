React = require 'react'

module.exports = React.createClass

  getInitialState: ->
    data:
      hello: 'Hello'

  handleClick: ->
    @setState
      data:
        hello: 'Welcome!'

  render: ->
    return (
      # jshint ignore:start
      <div>
        <div ref="hello">{@state.data.hello}</div>
        <button ref="sayHello" type="button" onClick={@handleClick}>Say It!!!</button>
      </div>
      # jshint ignore:end
    )

