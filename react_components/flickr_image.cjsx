React = require 'react'
_ = require 'underscore'
$ = require 'jquery'

module.exports = React.createClass
  displayName: "FlickrImage"

  getInitialState: ->
    loaded: false

  render: ->
    style =
      float: 'left'
      width: "#{@props.picWidth}px"
      height: "#{@props.picWidth / 1.5}px"


    return (
        <img
          onLoad={@handleOnLoad}
          style={style}
          src={@props.data.large} />
    )
