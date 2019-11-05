class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :home
  end

  helpers do

    def login(email, password)
      #check if user with this email actually exits
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(password)
        #if so, set the session
        session[:email] = @user.email
      #otherwise, redirect
      else redirect to :'/login'
      end
    end

    def current_user
      # find the current user by email in the session hash
      @current_user ||= User.find_by(email: session[:email]) if session[:email]
    end

    def logged_in?
      # check that the user is logged in by making sure that the session hash exists
      !!current_user
    end

    def logout
      # clear session to log out the user
      session.clear
    end
  end

end
