class TasksController < ApplicationController
  get '/tasks' do
    erb :index
  end

end
