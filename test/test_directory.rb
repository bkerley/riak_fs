require 'helper'

class TestDirectory < MiniTest::Unit::TestCase
	def test_creation_with_client_and_path
		path = '/zedo'

		dir = RiakFS::Directory.new @client, path

		assert dir
		assert_equal '/zedo', dir.path
		assert_equal @client, dir.client
	end

	def setup
		@client = stub 'Riak::Client'
		@dirname = '/catte'
		@dir = RiakFS::Directory.new @client, @dirname
	end
end