require 'socket'
require 'irb'

### UDP Socket connection has to be some troubles. Let's make this later...

#s = UDPSocket.new
#s.bind(nil, 3001)
#s.send('hello World;', 0, 'localhost', 3001)
#puts s

@sock = TCPSocket.new("localhost",3000)
@sock.write ( 'hello World2;' )
@sock.write ( "this is you;" )

def pd(message)
	@sock.write(message+";")
end

IRB.start

@sock.close