require 'etc'
class RDispatch::System
	# return number of CPU threads
	def self.thread_count
		Etc.nprocessors
	end
end