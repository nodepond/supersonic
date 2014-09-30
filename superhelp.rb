def manual
	puts
	puts "-- S U P E R S O N I C --"
	puts
	puts 'pd.send(String)'
	puts "    Sends a command to connected SuperSonic-host"
	puts
	puts "-- E X A M P L E S --"
	puts
	puts 'pd.send("write ch1 60 0 0 0  60 0 0 0  60 0 0 0 35 65 73 88")'
	puts "    Sending 16 steps of MIDI-notes to midi-channel 1"
	puts
	puts 'pd.send("start")'
	puts "    Start the sequencer"
	puts 'pd.send("stop")'
	puts "    Stop the sequencer"
	puts
	puts 'pd.send("bpm 140")'
	puts "    Set bpm to number provided"
	puts
end

def man
	manual
end
def m
	manual
end
