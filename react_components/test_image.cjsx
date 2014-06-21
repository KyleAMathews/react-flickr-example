React = require 'react'
_ = require 'underscore'

module.exports = React.createClass
  handleOnLoad: (e) ->
    @props.imgsLoaded()
    widthHeightRatio = e.target.naturalWidth/e.target.naturalHeight

    # Check max size is 640
    unless Math.max(e.target.naturalWidth, e.target.naturalHeight) is 640
      @props.pictureNotOK()

    # Check that the width/height ratio is within acceptable bounds.
    if 1.65 > widthHeightRatio > 1.35
      @props.pictureIsOK(@props.data)
    else
      @props.pictureNotOK()

  render: ->
    #console.log 'yo'
    return (
      <img
        onLoad={@handleOnLoad}
        style={display:'none'}
        src={@props.data.large} />
    )

