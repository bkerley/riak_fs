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

		def file?(path)
			f = file_for_path(path)
			f.exists?
		end

		private
		def file_for_path(path)
			File.new @riak_client, path
		end
	end
end