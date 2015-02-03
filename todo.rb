# Sinatra TODO
# Writing a TODO list has become the new "Hello World!" for the web. Use Sinatra to implement one of this applications

# Write a small application that allows us to add tasks to a list
# Clicking over a task should mark it as done
# Once done we should be able to delete a task
# The date of creation should be shown together with the task
# If the task contains the word urgent the task will become the most prioritary
# The task list should be saved in a file so we can restart the application and the tasks should persist.


require 'sinatra'
require 'sinatra/reloader' if development?


class List
	def initialize(name, list)
		@name=name
		@list=[list]
	end
end

class Items
	attr_accessor :task
	def initialize(task)
		@task=task
		@complete=false
		@remove=false
	end
	def complete
		@complete=true
	end
	def complete?
		return @complete
	end

	def remove
		@remove=true
	end

	def remove?
		return @remove
	end
end


list=[]
newlist=List.new("newlist", list)





get '/' do 
	time=Time.new
	@time=time
	@list=list
	erb :splash
end

post '/list' do
	new_item=Items.new(params[:task])
	list.push(new_item)

redirect to ('/')
end

post '/complete' do
	params[:task].each do |index|
		list[index.to_i].complete
	end

	
	redirect to ('/')
end

post '/remove' do 
	params[:task].reverse_each do |index|
		p index.to_i
		list.delete_at(index.to_i)
		p list
	end

	redirect to ('/')

end






