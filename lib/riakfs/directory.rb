module RiakFS
	class Directory
		attr_reader :client, :path
		def initialize(client, path)
			@client = client
			@path = path
		end
	end
end