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

class Items
	def initialize(task)
		@task=task
		
	end

end


list=[]
run=Items.new("run")
puts run


get '/' do 
	erb :splash

	
end

post '/list' do
	@task=Item.new(params)
	list.push(@task)
	
redirect to ('/')

end



