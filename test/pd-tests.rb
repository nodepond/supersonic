require 'test/unit'

dir = File.dirname(File.expand_path(__FILE__))
$LOAD_PATH.unshift dir + '/..'

#require File.dirname(__FILE__) + '/supersonic'
require 'supersonic'


class PdTests < Test::Unit::TestCase

	def test_pd_connect
		seq16 = PdSeq16.new
		seq16.init("localhost",3000)
		assert_equal(seq16.i[:port], 3000)
		assert_equal(seq16.i[:host], "localhost")
		seq16.disconnect
	end

	def test_pd_send_data
		seq16 = PdSeq16.new
		seq16.init("localhost",3000)
		seq16.data = "60 0 0 0 60 0 0 0 63 0 0 0 65 0 0 0"
		r = seq16.s
		assert_equal(r, 44)
		seq16.disconnect
	end

	def test_pd_send_on
		seq16 = PdSeq16.new
		seq16.init("localhost",3000)
		r = seq16.on
		assert_equal(r, 14)
		seq16.disconnect
	end

	def test_pd_send_off
		seq16 = PdSeq16.new
		seq16.init("localhost",3000)
		r = seq16.off
		assert_equal(r, 13)
		seq16.disconnect
	end

	def test_global_header_string
		seq16 = PdSeq16.new
		seq16.init("localhost",3000)
		seq16.track = 1
		assert_equal(seq16.seqDataHeader, "seq16 1 ")
		seq16.track = 2
		assert_equal(seq16.seqDataHeader, "seq16 " + seq16.i[:track].to_s + " ")
		seq16.disconnect
	end
end
