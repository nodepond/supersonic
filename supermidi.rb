require 'unimidi'

@midiin = nil
@midiout = nil

# for tet purposes (can expire later)
@notes = [36, 40, 43] # C E G
@octaves = 5
@duration = 0.1

def midiout
  # prompt the user to select an output
  UniMIDI::Output.gets do |output| # using their selection...

    @midiout = output

    (0..((4-1)*12)).step(12) do |oct|

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
