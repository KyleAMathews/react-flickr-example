React = require 'react'
_ = require 'underscore'
$ = require 'jquery'

module.exports = React.createClass
  displayName: "FlickrImage"

  getInitialState: ->
    loaded: false

  handleOnLoad: (e) ->
    console.log $.extend {}, e
    widthHeightRatio = e.target.naturalWidth/e.target.naturalHeight

    # Check max size is 640
    unless Math.max(e.target.naturalWidth, e.target.naturalHeight) is 640
      return

    # Check that the width/height ratio is within acceptable bounds.
    if 1.65 > widthHeightRatio > 1.35
      @setState loaded: true
      @setState orientation: 'landscape'
    else
      console.log widthHeightRatio

  render: ->
    display = if @state.loaded then "inline" else "none"
    style =
      display: display
      float: 'left'
    if @state.orientation is "landscape"
      style.width = "640px"
      style.height = "426px"
    else
      style.width = "426px"
      style.height = "640px"

    return (
      <a target="_blank" href="http://flickr.com/photo.gne?id=#{@props.data.id}" >
        <img
          onLoad={@handleOnLoad}
          style={style}
          src={@props.data.large} />
      </a>
    )
