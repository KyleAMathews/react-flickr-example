React = require 'react'
$ = require 'jquery'

module.exports = React.createClass
  displayName: "FlickrImage"
  getInitialState: ->
    loaded: false
  handleOnLoad: (e) ->
    console.log $.extend {}, e
    @setState loaded: true

  render: ->
    display = if @state.loaded then "show" else "hide"
    <div>
      <img onLoad={@handleOnLoad} style={display: display} src={@props.src} />
    </div>
