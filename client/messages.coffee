Template.messages.rendered = ->
  messages = [
   "You're just too good to be true ",
   "Can't take my eyes off of you ",
   "You'd be like heaven to touch ",
   "I wanna hold you so much     ",
   "At long last love has arrived    ",
   "And I thank God I'm alive       ",
   "You're just too good to be true    ",
   "Can't take my eyes off of you ",
   "        ",

   "Pardon the way that I stare ",
   "There's nothing else to compare ",
   "The sight of you leaves me weak ",
   "There are no words left to speak ",
   "But if you feel like I feel ",
   "Please let me know that it's real ",
   "You're just too good to be true        ",
   "Can't take my eyes off of you ",
   "                                                 ",
   "                                                 ",
   "                                     ",

   "I love you baby and if it's quite all right ",
   "I need you baby to warm the lonely nights ",
   "I love you baby, trust in me when I say      ",
   "Oh pretty baby, don't bring me down I pray ",
   "Oh pretty baby, now that I've found you stay ",
   "And let me love you baby, let me love you ",
   "           ",

   "You're just too good to be true ",
   "Can't take my eyes off of you ",
   "You'd be like heaven to touch ",
   "I wanna hold you so much    ",
   "At long last love has arrived     ",
   "And I thank God I'm alive  ",
   "You're just too good to be true  ",
   "Can't take my eyes off of you ",
   "                                               ",
   "                                 ",

   "I love you baby and if it's quite all right ",
   "I need you baby to warm the lonely nights ",
   "I love you baby, trust in me when I say ",
   "Oh pretty baby, don't bring me down I pray ",
   "Oh pretty baby, now that I've found you stay ",
   "And let me love you baby, let me love you"]

  $messages = $('#messages')

  $messages.addClass 'fade-in'

  scroller = new MessageScroller($messages, messages)

  shown = false
  cleared = false
  Valentine (elapsedTime, dt) ->
    if elapsedTime > 5.0 && !shown
      $node = $('<span class="character"></span>').text('Happy Valentines Day baby :)')
      $messages.html($node)
      shown = true

    if elapsedTime > 11.0 && !cleared
      $messages.html(null)
      cleared = true

    scroller.step elapsedTime, dt

