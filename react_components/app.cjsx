React = require 'react'
SearchBar = require './search_bar'
ImagesContainer = require './images_container'
_ = require 'underscore'
$ = require 'jquery'
flickrSearch = require '../lib/flickr_search'

module.exports = React.createClass
  displayName: "App"

  getInitialState: ->
    photos: []
    picWidth: 0
    query: ""
    imgsLoaded: 0
    page: 1
    loading: false

  imageLoaded: ->
    @setState imgsLoaded: @state.imgsLoaded + 1
    # If 90 out of 100 images have been checked, then we're not "loading" anymore
    # for our purposes.
    if @state.imgsLoaded > (@state.page * 100) - 10
      @setState loading: false

  updateDimensions: ->
    width = window.innerWidth
    if width > 2000
      columns = 3
    else if width < 600
      columns = 1
    else
      columns = 2

    # Calculate picture width. Space for columns w/ gutter space subtracted.
    @setState picWidth: (width / columns) - (columns / 1.5 * 17)

  nextPage: ->
    unless @state.loading
      # If we're within 1000 px of the bottom of the page.
      if document.body.scrollHeight - window.scrollY < 4000
        @setState page: @state.page + 1, -> @search()

  componentDidMount: ->
    @updateDimensions()
    window.addEventListener("resize", @updateDimensions)
    window.addEventListener("scroll", @nextPage)

  handleSearch: (query) ->
    @setState {
      photos: []
      query: query
      imgsLoaded: 0
      page: 1
    }, -> @search()

  search: ->
    @setState loading: true
    flickrSearch(@state.query, {page: @state.page}, (err, photos) =>
      @setState photos: @state.photos.concat photos
    )

  render: ->
     return (
       <div>
         <SearchBar
           onSearch={@handleSearch}
           loading={@state.loading}
         />
         <ImagesContainer
           imgsLoaded={@imageLoaded}
           picWidth={@state.picWidth}
           query={@state.query}
           photos={@state.photos}
         />
       </div>
     )
