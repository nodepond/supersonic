opts = { 
	:gate => 90,   
	:interval => 7,
	:midi => @midiout,
	:pattern => Diamond::Pattern["UpDown"],
	:range => 4, 
	:rate => 8
}

arp = Diamond::Arpeggiator.new(120, opts)

chords = ["c2","a3"]

arp << chords

@allseq << arp