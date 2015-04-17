React = require 'react'
Reflux = require 'reflux'

render = ->
  return (
    # jshint ignore:start
    <div>Hello</div>
    # jshint ignore:end
  )

Home = React.createClass
  render: render

module.exports = Home
