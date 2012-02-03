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
		bucket = stub 'riak bucket'
		dir = stub 'riak directory'
		directory = stub 'RiakFS::Directory instance'
		
		@client.expects(:bucket).with(:riak_fs).returns(bucket)
		bucket.expects(:get).with('D-').returns(dir)
		RiakFS::Directory.expects(:new).with(dir).returns(directory)
		directory.expects(:data).returns <<-EOD
		{"subdirectories":[], "files":["example.txt"]}
		EOD

		directory_entries = @fs.contents

		assert_equal ['example.txt'], directory_entries
	end
end