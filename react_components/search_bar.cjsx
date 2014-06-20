React = require 'react'

module.exports = React.createClass
  handleSubmit: (e) ->
    e.preventDefault()
    query = @refs.search.getDOMNode().value
    if query isnt ""
      @props.onSearch(query)

  componentDidMount: ->
    @refs.search.getDOMNode().focus()

  render: ->
    <div className="search-bar">
      <form onSubmit={@handleSubmit}>
        <input className="search-bar__input" ref="search" type="search" />
      </form>
    </div>
