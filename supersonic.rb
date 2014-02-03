require 'rubygems'
require 'interactive_editor'
require 'irb'
require 'irb/completion'
require 'unimidi'

# this program prompts the user to select a midi output and sends some arpeggiated chords to it

@notes = [36, 40, 43] # C E G
@octaves = 5
@duration = 0.1

@midiout = nil

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
      t1 = Time.now
      puts 'tick ' + t.to_s

      sleep(0.0625+(0.0625-dt))
      t2 = Time.now
      dt = t2-t1
      puts dt
    end
    #sleep(0.5)
  end
  # -> still inaccurate. Maybe a suitable way would be, to make the sleep commands "dynamic" in length, in dependecy of the delta-time of execution
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
