# SuperSonic - A livecoding-tool with PureData as sequencer by m.wisniowsi (nodepond.com)
# You can program the seuencer by sending text via sockets to a PureData patch
# This is an open-source project. http://github.com/nodepond/supersonic

require 'socket'
require 'irb'
require 'irb/completion'

# SuperSonic-code
require './superui'
require './superhelp'

@host = 'localhost'
@port = 3000

### UDP Socket connection has to be some troubles. Let's make this later...

#s = UDPSocket.new
#s.bind(nil, 3001)
#s.send('hello World;', 0, 'localhost', 3001)
#puts s

ARGV.each do |a|
  if a == "--host" then
    @host = ARGV[ ARGV.index('--host') + 1 ]
  end
  if a == "--port" then
    @port = ARGV[ ARGV.index('--port') + 1 ]
  end
end
ARGV.delete_if {true}


module Pd
	@socket = nil

	def connect(host, port)
		@socket = TCPSocket.new(host, port)
		@socket.write ( 'SuperSonic connected on port ' + port.to_s+";")
	end

	def disconnect
		@socket.close
	end

	def send(message)
		@socket.write(message + ";")
	end
end

class PdConnection
	include Pd

  @connection

	def init(host='localhost', port=3000)
    puts "...connecting to " + host + ":" + port.to_s + "\n\n"
    @connection = Hash.new
		@connection = {
			:host => host,
      :port => port
	}
  self.connect(host, port)
	end

	def info
		return @connection
	end
	alias_method :i, :info
end

@pdconnection = PdConnection.new

@pdconnection.init(@host, @port)

def pd
	return @pdconnection
end

IRB.start

pd.disconnect
