require 'rubygems'
require 'interactive_editor'
require 'irb'
require 'irb/completion'
require 'unimidi'
require 'midi-message'
require 'topaz'
require 'diamond'

# this program prompts the user to select a midi output and sends some arpeggiated chords to it

@notes = [36, 40, 43] # C E G
@octaves = 5
@duration = 0.1

@midiin = nil
@midiout = nil

@tempo = nil
@midiclock = nil

@allseq = []

def midiout
  # prompt the user to select an output
  UniMIDI::Output.gets do |output| # using their selection...

    @midiout = output

    (0..((@octaves-1)*12)).step(12) do |oct|

    	#while true
      	@notes.each do |note|
      	
          @midiout.puts(0x90, note + oct, 64) # note on
        	sleep(@duration) # wait
       	  @midiout.puts(0x80, note + oct, 64) # note off
        
      	end
  	#end
      
    end
  end
end
def midiin
  UniMIDI::Input.gets do |input|

    @midiin = input

    #(0..((@octaves-1)*12)).step(12) do |oct|

      #while true
      #  @notes.each do |note|
      #  
      #    @midiin.puts(0x90, note + oct, 64) # note on
      #    sleep(@duration) # wait
      #    @midiin.puts(0x80, note + oct, 64) # note off
      #  
      #  end
    #end
      
    #end
  end
end

def clr
  system 'clear'
end

def a 
  (0..((@octaves-1)*12)).step(12) do |oct|
    @notes.each do |note|
      @midiout.puts(0x90, note + oct, 64) # note on
      sleep(@duration) # wait
      @midiout.puts(0x80, note + oct, 64) # note off
    end
  end
end

def r
  (1..64).each do |note|
    rnd=rand(24)+60
    @midiout.puts(0x90, rnd, 64) # note on
    sleep(@duration) # wait
    @midiout.puts(0x80, rnd, 64) # note off
  end
end
def rThread
  Thread.new{
    (1..64).each do |note|
      rnd=rand(24)+60
      @midiout.puts(0x90, rnd, 64) # note on
      sleep(@duration) # wait
      @midiout.puts(0x80, rnd, 64) # note off
    end
  }
end

def aThread
  
  Thread.new {
    (0..((@octaves-1)*12)).step(12) do |oct|
      @notes.each do |note|
        @midiout.puts(0x90, note + oct, 64) # note on
        sleep(@duration) # wait
        @midiout.puts(0x80, note + oct, 64) # note off
      end
    end
  }

end

def seven
  (0..((@octaves-1)*12)).step(12) do |oct|
    @notes.each do |note|
      @midiout.puts(0x90, note + oct + 7, 64) # note on
      sleep(@duration) # wait
      @midiout.puts(0x80, note + oct + 7, 64) # note off
    end
  end
end

# building a chord-system
def maj(note=60, octave=4, notelenght=0.1, repetitions=4)
  Thread.new {
  
    midi = 60
    if note.is_a? Integer # put midi values or "literally notes"
      midi = note
    else
      case note
      when "c" 
        midi = 60
      when "cis" 
        midi = 61
      when "d" 
        midi = 62
      when "dis" 
        midi = 63
      when "e" 
        midi = 64
      when "f" 
        midi = 65
      when "fis" 
        midi = 66
      when "g" 
        midi = 67
      when "gis" 
        midi = 68
      when "a" 
        midi = 69
      when "ais" 
        midi = 70
      when "b" 
        midi = 71
      else
        midi = 60
      end
    end
    midi = midi + (octave-4)*12
    repetitions.times do
        @midiout.puts(0x90, midi, 64) # note on
        sleep(notelenght) # wait
        @midiout.puts(0x80, midi, 64) # note off
        @midiout.puts(0x90, midi+4, 64) # note on
        sleep(notelenght) # wait
        @midiout.puts(0x80, midi+4, 64) # note off
        @midiout.puts(0x90, midi+7, 64) # note on
        sleep(notelenght) # wait
        @midiout.puts(0x80, midi+7, 64) # note off
    end
  }
end

# building a chord-system
def min(note=60, octave=4, notelenght=0.1, repetitions=4)
  Thread.new {
  
    midi = 60
    if note.is_a? Integer # put midi values or "literally notes"
      midi = note
    else
      case note
      when "c" 
        midi = 60
      when "cis" 
        midi = 61
      when "d" 
        midi = 62
      when "dis" 
        midi = 63
      when "e" 
        midi = 64
      when "f" 
        midi = 65
      when "fis" 
        midi = 66
      when "g" 
        midi = 67
      when "gis" 
        midi = 68
      when "a" 
        midi = 69
      when "ais" 
        midi = 70
      when "b" 
        midi = 71
      else
        midi = 60
      end
    end
    midi = midi + (octave-4)*12
    repetitions.times do
        @midiout.puts(0x90, midi, 64) # note on
        sleep(notelenght) # wait
        @midiout.puts(0x80, midi, 64) # note off
        @midiout.puts(0x90, midi+3, 64) # note on
        sleep(notelenght) # wait
        @midiout.puts(0x80, midi+3, 64) # note off
        @midiout.puts(0x90, midi+7, 64) # note on
        sleep(notelenght) # wait
        @midiout.puts(0x80, midi+7, 64) # note off
    end
  }
end

def looptest
  # could this be a way to get accuarate timings?!
  Thread.new {
    loop do
      maj(60, 4, 0.01, 12)
      sleep(1)
      min("e")
      sleep(1)
    end
  }
end
def looptest2
  # could this be a way to get accuarate timings?! -> It seems, that compated to a music-timer here we have some sublte inaccurate timings!
  Thread.new {
    loop do
      maj(60, 4, 0.01, 1)
      sleep(0.25)
    end
  }
end

def beatTickTest
  #loop do
  #  puts 'beat'
  #  sleep(0.5)
  #end
  loop do
    dt = 0.0625
    puts 'beat'
    #maj(60, 4, 0.01, 1)
      
    (0..7).each do |t|
      t1 = Time.now.to_f
      puts 'tick ' + t.to_s

      sleep(0.0625+(0.0625-dt))
      t2 = Time.now.to_f
      dt = t2-t1
      puts dt
    end
    #sleep(0.5)
  end
  # -> still inaccurate. Maybe a suitable way would be, to make the sleep commands "dynamic" in length, in dependecy of the delta-time of execution
end

# topaz Sequencer test
# a mock sequencer for demonstration
class Sequencer
  
  def step(mididevice)
    @i ||= 0
    mididevice.puts( MIDIMessage::NoteOn.new(1, 60, 64) )
    #p "step #{@i+=1}"
  end
  
end

# First test of maing a "master sequencer", calling our subsequences
class MasterSequencer
  
  def step(mididevice)
    @i ||= 0
    @i = @i%128

    mtick = 4
    it = 128/mtick
    if (@i%it == 0) 
      mididevice.puts( MIDIMessage::NoteOn.new(1, 36, 64) )
    #  p "* step #{@i}"
    end
    if (@i%(it*2) == 0) 
      mididevice.puts( MIDIMessage::NoteOn.new(1, 40, 64) )
    #  p "** step #{@i}"
    end
    if (@i%(it/2) == 0) 
      mididevice.puts( MIDIMessage::NoteOn.new(1, 44, rand(16)+50) )
    #  p "*** step #{@i}"
    end
    @i+=1
    #p ""
    #p "step #{@i+=1}"
  end
  
end
def startMasterSequencer(bpm=120, ticks=128)
  seq = MasterSequencer.new
  Thread.new {
    @tempo = Topaz::Tempo.new(bpm, :interval => ticks) { seq.step(@midiout) }
    @tempo.start
  }
end


def topaz(bpm=120, ticks=0, startwithdelay=0)
  seq = Sequencer.new
  Thread.new {
    @tempo = Topaz::Tempo.new(bpm, :interval => ticks) { maj(60, 4, 0.01, 1) }
    sleep(startwithdelay)
    @tempo.start
  } 
end
def simpleBassdrum(bpm=120, ticks=4)
  seq = Sequencer.new
  Thread.new {
    @tempo = Topaz::Tempo.new(bpm, :interval => ticks) { seq.step(@midiout) }
    @tempo.start
  } 
end
def untopaz
  @tempo.stop
end

def clock
  Thread.new {
    @midiclock = Topaz::Tempo.new(@midiin, :interval => 8, :midi => @midiout) { p "clock" }
    @midiclock.start
  }
end
def unclock
  @midiclock.stop
  @midiout.puts(MIDIMessage::SystemRealtime["Stop"].new.to_a)
end
def midiInOutDelay(seconds)
  Thread.new {
    @midiclock = Topaz::Tempo.new(132, :interval => 64) { @midiout.puts(MIDIMessage::SystemRealtime["Clock"].new.to_a) }
    @midiout.puts(MIDIMessage::SystemRealtime["Start"].new.to_a)
  
    @midiclock.start
    #@midiout.puts(MIDIMessage::SystemRealtime["Start"].new.to_a)
  }
end
def mi
  Thread.new {
  
  @midiclock = Topaz::Tempo.new(@midiin) { p "tempo" }
  @midiclock.start
 } 
end

# ui-methods
# Short-code for "clr + sequences show all"
def sa!
  clr
  @allseq.each do |s|
    p s
  end
end
# Returns array of all sequences
def seqs
  return @allseq
end
# Return single "tracks"
def seq1
  return @allseq[0]
end
def seq2
  return @allseq[1]
end
def seq3
  return @allseq[2]
end
def seq4
  return @allseq[3]
end
def seq5
  return @allseq[4]
end
def seq6
  return @allseq[5]
end
def seq7
  return @allseq[6]
end
def seq8
  return @allseq[7]
end
# Short-code for require-method (to load presets and self-written methods from local files)
# This methods searches the local folder
def r(filename)
  require "./#{filename}"
end
# Short-code for load-method (to load presets and self-written methods from local files)
# This methods searches the local folder. You do not need to add .rb - it will added automatically
def l(filename)
  load "#{filename}.rb"
end

clr
puts "This is SuperSonic.\n"
puts "You could become coding rockstar!\n"
puts "\n\n"

# http://tagaholic.me/2009/05/11/demystifying-irb-commands.html
IRB.start
# I could not get the IRB-object zo config, so I just start it from console.. ;)
#system "irb --prompt simple"
#system "irb supersonic.rb"
# -> Uh, that does not work either...
