class RDispatch

	def initialize
		tasks = []
	end

	def create_task(callback, data)
		avail_threads = RDispatch::System.thread_count
		unless data.kind_of?(Array)
			raise ArgumentError, "#{data} is not an array", caller
		end
		split_data = data.each_slice((data.size/avail_threads.to_f).round).to_a
		split_data.each do |data_array|
			# create tasks, each with 1/n of data, where n is number of cpu cores
			tasks << proc { callback.call(data_array) }
		end
	end

	def run!
		# run tasks, each in its own thread
		threads = []
		tasks.each do |t|
			threads << Thread.new do
				puts "spawning thread"
				t.call
			end
		end
		threads.each(&:join)
		tasks = []
	end

	private
	tasks = []
end
require 'rdispatch/sys'
