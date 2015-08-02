React = require 'react'
Router = require 'react-router'
RouteHandler = Router.RouteHandler

module.exports = React.createClass
  render: ->
    return (
      # jshint ignore:start
      <RouteHandler />
      # jshint ignore:end
    )
