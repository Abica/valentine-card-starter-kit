@MessageScroller = class
  constructor: ($el, messages...) ->
    @$el = $el
    @messages = messages
    @currentLine = 0
    @currentPosition = 0
    @secondsPerLetter = 1.0
    @endOfLinePause = 1.0
    @timeOnCurrentLetter = 0

  step: (dt) ->
    @timeOnCurrentLetter += dt
    if @timeOnCurrentLetter > @secondsPerLetter
      @timeOnCurrentLetter = 0
      @advancePosition()
      @render()

  endOfLine: ->
  endOfMessages: ->

  advancePosition: ->
    @currentPosition++

  advanceLine: ->
    @currentLine++

  render: ->
    line = @messages[@currentLine]
    characters = line.slice 0, @currentPosition
    @$el.text characters
