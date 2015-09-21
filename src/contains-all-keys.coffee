ReturnValue = require 'nanocyte-component-return-value'
_ = require 'lodash'

class ContainsAllKeys extends ReturnValue
  onEnvelope: (envelope) =>
    {message, config, data} = envelope
    messageContainsAllKeys = _.all config.composeKeys, (key) => _.has message, key

    return message if messageContainsAllKeys

module.exports = ContainsAllKeys
