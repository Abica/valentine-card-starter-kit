What is this?
=============
Essentially this is a meteor app that scrolls the lyrics to "Can't Take My Eyes Off Of You" by The Four Seasons

The lyrics are roughly synced with the audio of the track, and there are a bunch of three.js particle hearts floating around in the background. It can be very easily used to scroll any messages but the lyrics fit the song.

There's no reason it needed to be meteor as it's a front end only 'experience'. Meteor was just the most pain free way to get something running.

This is more or less structure pulled from part of my 2015 valentines day card to my wife.

The floating hearts bg is a very slightly modified version of [this particles example on the threejs site](http://threejs.org/examples/#webgl_buffergeometry_custom_attributes_particles).

Running
=============
First you will need to [install meteor](https://www.meteor.com/install). This can be done with this handy one liner:
```sh
curl https://install.meteor.com/ | sh
```

From there just cd into the directory and run
```sh
meteor
```
