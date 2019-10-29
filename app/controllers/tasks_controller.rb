class TasksController < ApplicationController
  get '/tasks' do
    erb :"tasks/index"
  end

end
