opts = { 
	:gate => 90,   
	:interval => 7,
	:midi => @midiout,
	:pattern => Diamond::Pattern["UpDown"],
	:range => 2, 
	:rate => 8
}

arp = Diamond::Arpeggiator.new(133, opts)

chords = ["c3","a3","d3"]

arp << chords

@allseq << arp