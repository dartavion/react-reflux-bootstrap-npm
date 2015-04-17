React = require 'react'
Router = require 'react-router'
Route = Router.Route
Routes = Router.Routes
DefaultRoute = Router.DefaultRoute

Layout = require './app/layout'
Home = require './app/components/home/home'

routes = (
  <Route name="layout" path="/" handler={Layout}>
    <DefaultRoute handler={Home} />
  </Route>
)

exports.start = ->
  Router.run routes, (Handler) ->
    React.render <Handler />, document.getElementById('content')
