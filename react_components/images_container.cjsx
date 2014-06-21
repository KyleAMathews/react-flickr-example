React = require 'react/addons'
ReactCSSTransitionGroup = React.addons.CSSTransitionGroup
TestImage = require './test_image'
FlickrImage = require './flickr_image'

module.exports = React.createClass
  displayName: "ImagesContainer"

  getInitialState: ->
    okPics: []
    badPics: 0

  componentWillReceiveProps: (nextProps) ->
    if nextProps.query isnt @props.query
      @setState okPics: []
      @setState badPics: 0

  pictureNotOK: ->
    @setState badPics: @state.badPics + 1
    console.log "bad: #{@state.badPics + 1}"

  pictureIsOK: (data) ->
    @setState okPics: @state.okPics.concat [data]
    console.log "ok: #{@state.okPics.length}"

  render: ->
    images = []
    for img in @props.photos
      images.push <TestImage imgsLoaded={@props.imgsLoaded} key={img.id} pictureNotOK={@pictureNotOK} pictureIsOK={@pictureIsOK} data={img} />

    oKImages = []
    for img in @state.okPics
      oKImages.push <FlickrImage picWidth={@props.picWidth} key={img.id} data={img} />

    if @props.photos.length is 0
      return (<div />)
    else
      return (
        <div>
          <div className="testing-image-container">
            {images}
          </div>
          <div className="image-container">
            <ReactCSSTransitionGroup transitionName="image" transitionLeave={false}>
              {oKImages}
            </ReactCSSTransitionGroup>
          </div>
        </div>
      )
