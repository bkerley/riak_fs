module RiakFS
	class Filesystem
		attr_reader :riak_client
		def initialize(opts)
			@riak_client = Riak::Client.new opts
		end
	end
end