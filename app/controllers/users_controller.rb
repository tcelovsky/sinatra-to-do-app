class UsersController < ApplicationController
  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    if params[:name].present? && params[:email].present? && params[:password].present?
      @user = User.create(name: params[:name], email: params[:email], password_digest: params[:password])
      session[:id] = @user.id
      redirect to :'/login'
      # login(params[:email], params[:password])
    else redirect to :'/signup'
    end
    erb :'/tasks/index'
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    login(params[:email], params[:password])
    erb :'/tasks/index'
  end

  get '/logout' do
    logout
  end

end
