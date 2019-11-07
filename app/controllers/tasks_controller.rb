class TasksController < ApplicationController
  get '/tasks' do
    if logged_in?
      erb :'/tasks/index'
    else redirect to :'/login'
    end
  end

  get '/tasks/new' do
    if logged_in?
      erb :'/tasks/new'
    else redirect to :'/login'
    end
  end

  post '/tasks/new' do
    if params[:title].present? && params[:due_date].present? && params[:content].present?
      @user = current_user
      @task = Task.create(title: params[:title], due_date: params[:due_date], content: params[:content])
      @task.user_id = @user.id
      @task.save
      erb :'/tasks/index'
    else redirect to :'/tasks/new'
    end
  end

  get '/tasks/:id' do
    if logged_in?
      @task = Task.find_by_id(params[:id])
      erb :'/tasks/new'
    else redirect to :'/login'
    end
  end

  delete '/tasks/:id/delete' do
    if logged_in?
      @task = Task.find_by(params[:title])
      @task.delete
      erb :'/tasks/index'
    else redirect to :'/login'
    end
  end

  get '/tasks/:id/edit' do
    if logged_in?
      @task = Task.find_by_id(params[:id])
      erb :'/tasks/edit'
    else redirect to :'/login'
    end
  end

  patch '/tasks/:id/edit' do
    if params[:title].present? && params[:due_date].present?
      @task = Task.find_by_id(params[:id])
      @task.title = params[:title]
      @task.due_date = params[:due_date]
      @task.content = params[:content]
      @task.save
      erb :'/tasks/index'
    else erb :'/tasks/edit'
    end
  end

end
