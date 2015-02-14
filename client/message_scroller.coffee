@MessageScroller = class
  constructor: ($el, messages) ->
    @$el = $el
    @messages = messages
    @currentLine = 0
    @currentPosition = -1
    @secondsPerLetter = 0.1
    @endOfLinePause = 1.0
    @timeOnCurrentLetter = 0

    @initialDelay = 17.0

  step: (elapsedTime, dt) ->
    return if @endOfMessages()

    @timeOnCurrentLetter += dt

    return if elapsedTime < @initialDelay

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
    if @$el.is(':animated')
      @$el.stop()

    @$el.animate
      scrollTop: @$el.prop('scrollHeight')

  render: ->
    return if @endOfMessages()

    line = @messages[@currentLine]
    character = line[@currentPosition]
    $character = $('<span class="character"></span>').text(character).hide()

    $character.show 'puff', duration: 2000
    @$el.append $character


