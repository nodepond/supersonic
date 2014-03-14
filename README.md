SuperSonic
==========

About 
-----

An experiment in making a music live-coding tool in Ruby.

Status
------

This is extremely early-on, but you can already play with it!

You can take a look at the dev-board at Trello! Feel free to submit your feature-requests or bugs...

https://trello.com/b/VwEZS1U1/supersonic


Doku
----

Requirements: Puredata-Extended and Ruby with required ruby gems

```
Open PureData-Patch "seq16.pd". You can to this from console as well with 'open seq16.pd'.

Then start supersonic with "ruby supersonic.rb". An irb with supersonic-commands opens...
```

SuperSonic currently tries to connect to a pure-data patch, listening to TCP-Socket (seq16.pd).

Inspect supersonic.rb and especially "seq16" for stuff to do.

```
Type "man" for some help on the commands
```

Note: Midi is not really used right at the moment...

midiout - Select MIDI-Output-Device

midiin - Select MIDI-Input-Device




Credits
-------

This project was started by Martin "Nodepond" Wisniowski and Thömmes "Slogmen" Schrader in January 2014. In Cologne!

http://www.nodepond.com

http://www.slog.io
