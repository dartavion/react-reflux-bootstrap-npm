sinon = require('sinon')
_sandbox = sinon.sandbox.create()

afterEach () ->
  _sandbox.restore()

global.sandbox = _sandbox
