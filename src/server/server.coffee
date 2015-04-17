'use strict'

express = require 'express'
app = express()

bodyParser = require 'body-parser'
favicon = require 'serve-favicon'
logger = require 'morgan'
port = process.env.PORT || 3000
four0four = require './utils/404'

environment = process.env.NODE_ENV
app.use favicon __dirname + '/favicon.ico'
app.use bodyParser.urlencoded
  extended: true

app.use bodyParser.json()
app.use logger('dev')

useDevServer = ->
  app.use express.static './build/client/'
  app.use express.static './'
  app.use express.static './tmp'
  app.use '/app/*', (req, res, next) ->
    four0four.send404 req, res
  app.use '/*', express.static './build/client/index.html'

switch environment
  when 'build' then console.log 'build'
  else useDevServer()

app.listen port, () ->
  console.log 'Express listening on port' + port
  console.log 'env' + app.get 'env' + '\n__dirname' + __dirname + '\nprocess.cwd' + process.cwd()
