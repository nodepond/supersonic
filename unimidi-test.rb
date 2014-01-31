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

def a 
  (0..((@octaves-1)*12)).step(12) do |oct|

    @notes.each do |note|
      @midiout.puts(0x90, note + oct, 64) # note on
      sleep(@duration) # wait
      @midiout.puts(0x80, note + oct, 64) # note off
    end
  end
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

IRB.start
