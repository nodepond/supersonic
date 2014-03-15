def manual
	puts ""
	puts "Manual (might not be list all commands...)\n"
	puts ""
	puts "seq16 - represents a 16-step sequence\n"
	puts ""
	puts "seq16.info / seq16.i - show info / inspects the sequence\n"
	puts "seq16.s - send sequence: send sequence to connected host\n"
	puts "seq16.cp / seq16.copybuffer - pastes a ruby-formatted representation of the sequence into the console and (on mac) into copybuffer\n"
	puts "seq16.data() / seq16.data= - sets new data to seq (comma seperated)\n"
	puts "seq16.data! - set new data and sends immediately\n"
	puts ""	
	puts "seq16.t / seq16.trans / seq16.transpose - set transpose parameter, that is added to sequence on sending\n"
	puts "seq16.t! / seq16.trans! / seq16.transpose! - same as transpose, but sends data immediatly\n"
	puts "seq16.addt / seq16.addTranspose - add value to transpose\n"
	puts "seq16.addt! / seq16.addTranspose! - add value to transpose and send data immediatly\n"
	puts ""	
	puts "seq16.on / seq16.start - Start sequence"
	puts "seq16.off / seq16.sto / seq16.stop - Stop sequence"
	puts "seq16.r / seq16.reset - Reset sequence"
	puts ""
end

def man
	manual
end
def m
	manual
end
