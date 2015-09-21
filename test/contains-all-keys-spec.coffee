ContainsAllKeys = require '../src/contains-all-keys'

describe 'ContainsAllKeys', ->
  beforeEach ->
    @sut = new ContainsAllKeys

  describe 'when given the complete message', ->
    beforeEach ->
      @result = @sut.onEnvelope
        message: {foo: 'bar'}
        config:  {composeKeys: ['foo']}
        data:    {foo: 'bar'}

    it 'should return the message', ->
      expect(@result).to.deep.equal {foo: 'bar'}

  describe 'when incomplete', ->
    beforeEach ->
      @result = @sut.onEnvelope
        message: {foo: 'bar'}
        config:  {composeKeys: ['foo', 'somethingLimp']}
        data:    {foo: 'bar'}

    it 'should return nothing', ->
      expect(@result).to.be.empty
