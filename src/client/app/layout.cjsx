React = require 'react'
Router = require 'react-router'
RouteHandler = Router.RouteHandler

render = ->
  return (
    # jshint ignore:start
    <RouteHandler />
    # jshint ignore:end
  )

Layout = React.createClass
  render: render

module.exports = Layout