React = require 'react'

flickrSearch = require './lib/flickr_search'

Test = React.createClass
  displayName: "test"
  render: ->
    images = []
    for img in @props.photos
      images.push <img src={img.large} />
      images.push <img src={img.medium} />

     return (
       <div>
         {images}
       </div>
     )

# Assign react to Window so the Chrome React Dev Tools will work
window.React = React

flickrSearch("grass", null, (err, photos) ->
  React.renderComponent(Test(photos:photos), document.body)
)
