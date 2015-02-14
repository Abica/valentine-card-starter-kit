Template.messages.rendered = ->
  messages = [
    'This is a line',
    'And here is another line',
    'But also, this is a line..',
    'Yet one line further hurts no one',
    'All lined out']

  $messages = $('#messages')

  $messages.addClass 'fade-in'

  scroller = new MessageScroller($messages, messages)

  Valentine (elapsedTime, dt) ->
    scroller.step elapsedTime, dt

