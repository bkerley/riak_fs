require 'helper'

class TestFilesystem < MiniTest::Unit::TestCase
	# first test creating a filesystem
	def test_creation_with_hash
		h = {:host=>'test.invalid', :pb_port=>12345}
		::Riak::Client.expects(:new).with(h).returns(:slug)

		fs = RiakFS::Filesystem.new h
		assert fs
		assert_equal :slug, fs.riak_client
	end

	# create the filesystem with a stub client
	def setup
		@opts = stub 'options'
		@client = stub 'Riak::Client'
		::Riak::Client.stubs(:new).with(@opts).returns(@client)
		@fs = RiakFS::Filesystem.new @opts
	end

	def test_root_directory
		directory = stub 'RiakFS::Directory instance'
		
		entries = ['example.txt', rand(36**10).to_s(36)]

		RiakFS::Directory.expects(:new).with(@client, '/').returns(directory)
		directory.expects(:contents).returns entries

		assert_equal entries, @fs.contents('/')
	end
end