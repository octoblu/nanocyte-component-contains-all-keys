ReturnValue = require 'nanocyte-component-return-value'
_ = require 'lodash'

class ContainsAllKeys extends ReturnValue
  onEnvelope: (envelope) =>
    {message, config, data} = envelope

    configData = @_convert config.compose

    return message if @_messageContainsAllKeys {configData, message}

  _convert: (data) =>
    return data if _.isArray data
    _.pairs data

  _messageContainsAllKeys: ({configData, message}) =>
    _.all configData, ([key,value]) =>
      _.has message, key

module.exports = ContainsAllKeys
