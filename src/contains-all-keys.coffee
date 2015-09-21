ReturnValue = require 'nanocyte-component-return-value'
_ = require 'lodash'

class ContainsAllKeys extends ReturnValue
  onEnvelope: (envelope) =>
    {message, config, data} = envelope

    keys = _.keys config.compose
    messageContainsAllKeys = _.all keys, (key) => _.has message, key

    return message if messageContainsAllKeys

module.exports = ContainsAllKeys
