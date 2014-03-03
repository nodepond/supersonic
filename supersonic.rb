# SuperSonic - A livecoding-tool for irb by m.wisniowsi (nodepond.com) and t.schrader (slogmen).
# Currently this tool need an open socket to a pure-data patch

require 'socket'
require 'irb'
require 'irb/completion'

require 'sketches'

# SuperSonic-code
require './supermidi'
require './superui.rb'

# not decided about the sketches approach yet...
Sketches.config :editor => 'nano',
                :background => true,
                :terminal => lambda { |cmd|
                  "xterm -fg gray -bg black -e #{cmd.dump}"
                }

#Sketches.config :editor => 'nano',
#                :background => true,
#                :terminal => lambda { |cmd|
#                  "'/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl' #{cmd.dump}"
#                }

#Sketches.config :editor => '/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl',
#                :background => true

#Sketches.config :editor => 'nano',
#                :background => true
                

### UDP Socket connection has to be some troubles. Let's make this later...

#s = UDPSocket.new
#s.bind(nil, 3001)
#s.send('hello World;', 0, 'localhost', 3001)
#puts s

#testing ARGV[0]
ARGV.each do |a|
  puts a
  ARGV.delete(a)
end


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

	@sequence

	def init(host='localhost',port=3000)
		self.connect(host,port)
		@sequence = Hash.new
		@sequence = { 
			:type => "notes",
			:data => "60 0 0 0 60 0 0 0 63 0 0 0 65 0 0 0",
			:length => 16,
			:host => host,
			:port => port
	}
	end

	def data(mdata)
		@sequence[:data] = mdata
	end
	alias_method :data=, :data

	def info
		return @sequence
	end
	alias_method :i, :info

	# send current sequence data to puredata ss = send_sequence
	def ss
		self.send(@sequence[:data])
	end
	
	# this method puts the current sequencer data into the copy-buffer to directly paste into irb and evaluate (currently mac only)
	def copybuffer
		s = ""
		s = "seq16.data = '#{@sequence[:data]}'"
		IO.popen('pbcopy', 'w+') {|clipboard| clipboard.write(s)}
		print s
	end
	alias_method :cb, :copybuffer
end

@pdseq16 = PdSeq16.new
@pdseq16.init

def seq16
	return @pdseq16
end

# http://www.ruby-doc.org/stdlib-2.0/libdoc/irb/rdoc/IRB/Context.html
def repeat_last_irb
  #eval(IRB.CurrentContext.io.line(-2))
  eval (IRB.CurrentContext.io << "hrllo")
end

# other approach could be, to "manipulate" the history, write something into and then use "up" to get the content

#https://github.com/ruby/ruby/blob/adf511efc635e53272dc2ce9094d1a579fa2ff3c/lib/irb/workspace.rb
#https://github.com/ruby/ruby/blob/4c2304f0004e9f1784540f3d36976aad9eab1f68/lib/irb/output-method.rb
#https://github.com/ruby/ruby/blob/4c2304f0004e9f1784540f3d36976aad9eab1f68/lib/irb/ext/save-history.rb
#http://www.wetware.co.nz/2010/09/how-to-persist-rails-or-irb-console-command-history-after-exit/
def try_something
	#IRB.CurrentContext.instance_eval{ "test" }
	#IRB.CurrentContext.workspace
	#IRB.CurrentContext.workspace.binding
	#IRB.CurrentContext
	IO.popen('pbcopy', 'w+') {|clipboard| clipboard.write("@aaa = '0 60 0 65 0'")}
end
# why not clipboard!
#http://utilitybelt.rubyforge.org/usage.html
#http://utilitybelt.rubyforge.org/svn/lib/utility_belt/clipboard.rb

def irb_no_echo
	IRB.CurrentContext.echo = false
end
def irb_echo
	IRB.CurrentContext.echo = true
end
def irb_foo
	#IRB.CurrentContext.io = "foo"
	content = "noble"
	print content
	add = gets
	eval(content + add)
end


IRB.start

seq16.disconnect
