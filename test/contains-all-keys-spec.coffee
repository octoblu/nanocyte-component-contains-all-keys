ContainsAllKeys = require '../src/contains-all-keys'

describe 'ContainsAllKeys', ->
  beforeEach ->
    @sut = new ContainsAllKeys

  describe 'when written to and read from', ->
    beforeEach (done) ->
      @sut.on 'end', done

      @sut.write
        message: {foo: 'bar'}
        config:  {composeKeys: ['foo']}
        data:    {foo: 'bar'}

      @things = []
      @sut.on 'readable', =>
        while thing = @sut.read()
          @things.push thing

    it 'should have emitted the message', ->
      expect(@things).to.deep.contain {foo: 'bar'}

  describe 'when incomplete', ->
    beforeEach (done) ->
      @sut.on 'end', done

      @sut.write
        message: {foo: 'bar'}
        config:  {composeKeys: ['foo', 'somethingLimp']}
        data:    {foo: 'bar'}

      @things = []
      @sut.on 'readable', =>
        while thing = @sut.read()
          @things.push thing

    it 'should not have emitted the message', ->
      expect(@things).to.be.empty
