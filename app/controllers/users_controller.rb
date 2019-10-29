class UsersController < ApplicationController

  get '/login' do
    erb 'users/login'
  end

  post '/login' do
    login
    erb :index
  end

  get '/signup' do
    erb 'users/signup'
  end

  post '/signup' do
    erb :index
  end

  get '/logout' do
    logout
  end

end
