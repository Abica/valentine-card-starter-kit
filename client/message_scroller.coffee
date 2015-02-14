@MessageScroller = class
  constructor: ($el, messages...) ->
    @messages = messages
    @currentLine = 0
    @currentPosition = 0
    @millisecondsPerLetter = 1000
    @endOfLinePause = 1000
    @timeOnCurrentLetter = 0

  step: (dt) ->
    @timeOnCurrentLetter += dt
    if @timeOnCurrentLetter > @millisecondsPerLetter
      @timeOnCurrentLetter = 0
      @currentPosition = 0
      @advancePosition()
      render()

  endOfLine: ->
  endOfMessages: ->

  advancePosition: ->
    @currentPosition++

  advanceLine: ->
    @currentLine++

  render: ->
    line = @messages[@currentLine]
    characters = line.slice 0, @currentPosition
    $el.text characters
