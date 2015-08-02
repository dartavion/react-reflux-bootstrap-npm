React = require 'react';

beforeEach () ->
  testArea = document.querySelector('#test-area')
  if testArea then @container = testArea
  else @container = document.createElement('div')

afterEach () ->
  React.unmountComponentAtNode @container
