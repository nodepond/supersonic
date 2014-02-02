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

clr
puts "This is SuperSonic.\n"
puts "You could become coding rockstar!\n"
puts "\n\n"

# http://tagaholic.me/2009/05/11/demystifying-irb-commands.html
IRB.start