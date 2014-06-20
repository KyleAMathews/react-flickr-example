React = require 'react'
FlickrImage = require './flickr_image'

module.exports = React.createClass
  displayName: "App"
  render: ->
    images = []
    for img in @props.photos
      images.push <FlickrImage key={img.id} data={img} />

     return (
       <div className="image-container">
         {images}
       </div>
     )
