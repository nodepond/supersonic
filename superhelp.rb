def manual
	puts ""
	puts "Manual (might not be list all commands...)\n"
	puts ""
	puts "seq16 - represents a 16-step sequence\n"
	puts ""
	puts "seq16.info / seq16.i - shows info / inspects the sequence\n"
	puts "seq16.s - send sequence: sends sequence to connected host\n"
	puts "seq16.cp / seq16.copybuffer - pastes a ruby-formatted representation of the sequence into the console and (on mac) into copybuffer\n"
	puts "seq16.data() / seq16.data= - sets new data to seq (comma seperated)\n"
	puts ""	
	puts "seq16.sto / seq16.stop - Stop sequence"
	puts "seq16.sta / seq16.start - Start sequence"
	puts "seq16.r / seq16.reset - Reset sequence"
	puts ""
end

def man
	manual
end
def m
	manual
end
