'use strict'

express = require 'express'

bodyParser = require 'body-parser'
favicon = require 'serve-favicon'
logger = require 'morgan'
compression = require 'compression'
methodOverride = require 'method-override'
path = require 'path'
config = require './environment'
cors = require 'cors'
bs = require('browser-sync').create()

four0four = require '../utils/404'

server = (app) ->
  app.use cors()
  app.use express.static config.root + '/build/client/'
  app.use express.static './'
  app.use express.static './tmp'
  app.use '/app/*', (req, res, next) ->
    four0four.send404 req, res
#  app.use '/*', express.static config.root + '/build/client/index.html'

devServer = (app) ->
  console.log("started dev server:::::::::::::::::::::::::::::")
  app.use cors()
  app.use express.static config.root + '/tmp/client/'
  app.use '/app/*', (req, res, next) ->
    four0four.send404 req, res
  bs.init
    server: config.root + '/tmp/client'
    middleware: [app]
  bs.watch('tmp/client/scripts/*.js').on('change', bs.reload)
  bs.watch('tmp/client/styles/*.css').on('change', bs.reload)

createExpressServer = (app) ->
  env = app.get('env')

  app.use favicon __dirname + '/../favicon.ico'
  app.use bodyParser.urlencoded
    extended: true

  app.use compression()
  app.use methodOverride()
  app.use bodyParser.json()
  app.use logger('dev')
  app.set('appPath', 'build/client')

  switch env
    when 'production' then server(app)
    else devServer(app)

module.exports = createExpressServer


