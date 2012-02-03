module RiakFS
	class Filesystem
		attr_reader :riak_client
		def initialize(opts)
			@riak_client = Riak::Client.new opts
		end

		def contents(path)
			dir = Directory.new @riak_client, path
			dir.contents
		end
	end
end