require 'socket'
require 'irb'
require 'irb/completion'

### UDP Socket connection has to be some troubles. Let's make this later...

#s = UDPSocket.new
#s.bind(nil, 3001)
#s.send('hello World;', 0, 'localhost', 3001)
#puts s


module Pd

	@sock = nil
	
	def connect(host, port)
		@sock = TCPSocket.new("localhost",port)
		@sock.write ( 'SuperSonic inited on port '+ port.to_s)
	end

	def disconnect
		@sock.close
	end

	def send(message)
		@sock.write(message+";")
	end

end

class PdSeq16
	include Pd

	def init(host='localhost',port=3000)
		self.connect(host,port)
	end
end

@pdseq16 = PdSeq16.new
@pdseq16.init

def seq16
	return @pdseq16
end

IRB.start

seq16.disconnect
