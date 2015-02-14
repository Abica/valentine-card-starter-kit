@MessageScroller = class
  constructor: ($el, messages) ->
    @$el = $el
    @messages = messages
    @currentLine = 0
    @currentPosition = 0
    @secondsPerLetter = 0.1
    @endOfLinePause = 1.0
    @timeOnCurrentLetter = 0

    @render()

  step: (dt) ->
    return if @endOfMessages()

    @timeOnCurrentLetter += dt

    if @timeOnCurrentLetter > @secondsPerLetter
      @timeOnCurrentLetter = 0

      if @endOfLine()
        @advanceLine()
        @renderLinebreak()
      else
        @advancePosition()

      @render()

  endOfLine: ->
    @currentPosition > @messages[@currentLine].length - 1

  endOfMessages: ->
    @currentLine > @messages.length - 1

  advancePosition: ->
    @currentPosition++

  advanceLine: ->
    @currentLine++
    @currentPosition = 0

  renderLinebreak: ->
    @$el.append $('<br />')

  render: ->
    line = @messages[@currentLine]
    character = line[@currentPosition]
    $character = $('<span class="character"></span>').text(character)
    @$el.append $character
