Template.messages.rendered = ->
  messages = [
    'This is a line',
    'And here is another line',
    'But also, this is a line..',
    'Yet one line further hurts no one',
    'All lined out']
  $messages = $('#messages')
  scroller = new MessageScroller($messages, messages)
  Valentine scroller.step
