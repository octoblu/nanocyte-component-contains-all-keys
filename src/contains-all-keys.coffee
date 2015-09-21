{Transform} = require 'stream'
_ = require 'lodash'

class ContainsAllKeys extends Transform
  constructor: ->
    super objectMode: true

  _transform: (envelope, enc, next) =>
    {message, config, data} = envelope

    messageContainsAllKeys = _.all config.composeKeys, (key) => _.has message, key
    
    @push message if messageContainsAllKeys
    @push null
    next()

module.exports = ContainsAllKeys
