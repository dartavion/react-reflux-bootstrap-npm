chai = require 'chai'
global.assert = chai.assert
global.should = chai.should()
chai.use require('sinon-chai')
global.expect = chai.expect
