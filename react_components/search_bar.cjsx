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
    <div>
      <form onSubmit={@handleSubmit}>
        <input ref="search" type="search" />
      </form>
    </div>
