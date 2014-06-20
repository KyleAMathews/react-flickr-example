React = require 'react'

App = require './react_components/app'

# Assign react to Window so the Chrome React Dev Tools will work
window.React = React

React.renderComponent(App(), document.body)
