SuperSonic
==========

About
-----

A minimalistic live-coding sequencer in PureData. The sequencer receives via socket-connection - ready for live-coding with text, i.e. with Ruby, JavaScript or other scripting languages.

Status
------

Things are about the change. I am currently rewriting the main-modules.

You can take a look at the dev-board at Trello! Feel free to submit your feature-requests or bugs...

https://trello.com/b/VwEZS1U1/supersonic


(depreciated) Doku
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

This project was started by Martin "Nodepond" Wisniowski (http://www.nodepond.com) in January 2014 after a discussion with Thömmes "Slogmen" Schrader (http://www.slog.io) about Raspberry Pi, Ruby and LiveCoding.

SuperSonic is maintained by Martin Wisniowski, with hands-on and good feedback from T.Schrader and the PureData UserGroup Cologne (http://pdcologne.reboot-network.de).
