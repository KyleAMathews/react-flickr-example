React = require 'react'
Spinner = require 'react-spinner'

module.exports = React.createClass
  handleSubmit: (e) ->
    e.preventDefault()
    query = @refs.search.getDOMNode().value
    if query isnt ""
      @props.onSearch(query)

  componentDidMount: ->
    @refs.search.getDOMNode().focus()

  render: ->
    if @props.loading
      spinner = <Spinner />

    <div className="search-bar">
      <form onSubmit={@handleSubmit}>
        <input value={@props.query} placeholder="Search Flickr" className="search-bar__input" ref="search" type="search" />
      </form>
      {spinner}
    </div>
