React = require 'react'
SearchBar = require './search_bar'
ImagesContainer = require './images_container'
$ = require 'jquery'
flickrSearch = require '../lib/flickr_search'

module.exports = React.createClass
  displayName: "App"
  getInitialState: ->
    photos: []
  handleSearch: (query) ->
    console.log query
    flickrSearch(query, null, (err, photos) =>
      @setState photos: photos
    )
  render: ->
     return (
       <div>
         <SearchBar onSearch={@handleSearch} />
         <ImagesContainer photos={@state.photos} />
       </div>
     )

