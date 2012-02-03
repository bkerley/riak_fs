require 'helper'

class TestFilesystem < MiniTest::Unit::TestCase
	def test_creation_with_hash
		h = {:host=>'test.invalid', :pb_port=>12345}
		::Riak::Client.expects(:new).with(h).returns(:slug)

		fs = RiakFS::Filesystem.new h
		assert fs
		assert_equal :slug, fs.riak_client
	end
end