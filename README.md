SuperSonic
==========

About
-----

alpha V0.01

A minimalistic live-coding sequencer in PureData. The sequencer receives data via socket-connection - ready for live-coding with text, i.e. with Ruby, JavaScript or other scripting languages.

The sequencer aims at generating MIDI-Data. So be sure, that you have setup, that is ready to receive incoming MIDI-data - no matter if this is hardware, a software host or another PureData-Instrument.

Status
------

Here is a hands-on video, that explains the basic workflow

https://www.youtube.com/watch?v=PbZU2L12pcc


You can take a look at the dev-board at Trello! Feel free to submit your feature-requests or bugs...

https://trello.com/b/VwEZS1U1/supersonic


Doku
----

Requirements: Puredata-Extended and Ruby with required ruby gems

Open PureData-Patch "supersonic.pd". You can to this from console as well with 'open supersonic.pd'.

Configure the MIDI-Settings in your PureData-Environment.

Then start supersonic with "ruby supersonic.rb". An irb with supersonic-commands opens.

SuperSonic connects to a pure-data patch, listening to a TCP-Socket on the localhost. The port is per default 3000.

If you need, to connect to another host or port, then you will configure it like this:

 - Open the PD-patch and edit the port in the netreceive module.
 - Start the supersonic-irb console with 'ruby supersonic --host myhost --port myport'

```
Type "man" for some help on the commands
```

To send data to PD from irb:

 - pd.send(write ch1 60 0 0 0 60 0 0 0 60 0 0 0 60 0 0 0)


Credits
-------

This project was started by Martin "Nodepond" Wisniowski (http://www.nodepond.com) in January 2014 after a discussion with Thömmes "Slogmen" Schrader (http://www.slog.io) about Raspberry Pi, Ruby and LiveCoding.

SuperSonic is maintained by Martin Wisniowski, with hands-on and good feedback from T.Schrader and the PureData UserGroup Cologne (http://pdcologne.reboot-network.de).
