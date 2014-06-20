request = require 'superagent'
querystring = require 'querystring'
_ = require 'underscore'

FLICKR_KEY="9ff0fef9b6c8e4509682e9576b9480f3"

module.exports = (query, options = {}, callback) ->
  tags = query.split(' ').join(',')
  defaultOptions =
    method: 'flickr.photos.search'
    api_key: FLICKR_KEY
    tags: tags
    tag_mode: 'any'
    per_page: 10
    page: 1
    format: 'json'
    nojsoncallback: 1

  combinedOptions = _.extend defaultOptions, options

  strOptions = querystring.stringify(combinedOptions)

  url = "https://api.flickr.com/services/rest/?#{strOptions}"
  console.log url

  request url, (res) ->
    generateFlickrImageURL = (data) ->
      return {
        large: "https://farm#{data.farm}.staticflickr.com/#{data.server}/#{data.id}_#{data.secret}_z.jpg"
        medium: "https://farm#{data.farm}.staticflickr.com/#{data.server}/#{data.id}_#{data.secret}_n.jpg"
        title: data.title
        id: data.id
      }

    photos = []
    for photo in res.body.photos.photo
      photos.push generateFlickrImageURL(photo)

    return callback(null, photos)

  return null
