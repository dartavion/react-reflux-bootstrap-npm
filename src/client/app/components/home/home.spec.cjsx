React = require 'react'
Home = React.createFactory require './home.cjsx'
TestUtils = require('react/addons').addons.TestUtils
TestHelpers = require('../../../test/helpers')

describe 'Hello View', ->
  $home = {}
  handleClick = {}

  beforeEach ->
    handleClick = TestHelpers.stubMethod(Home, "handleClick")
    $home = React.render Home(), @container

  it 'said hello', (done) ->
    hello = React.findDOMNode($home.refs.hello)
    expect(hello.textContent).to.equal($home.state.data.hello)
    done()

  it 'should say hello', (done) ->
    TestUtils.Simulate.click($home.refs.sayHello.getDOMNode())
    expect(handleClick).to.have.been.called
    done()
