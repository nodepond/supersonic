require 'test/unit'

dir = File.dirname(File.expand_path(__FILE__))
$LOAD_PATH.unshift dir + '/..'

#require File.dirname(__FILE__) + '/supersonic'
require 'supersonic'


class PdTests < Test::Unit::TestCase

	def test_pd_connect
		seq16 = PdSeq16.new
		seq16.init("localhost",3000)
		p seq16.i
		assert_equal(seq16.i[:port], 3000)
		assert_equal(seq16.i[:host], "localhost")
	end

end
