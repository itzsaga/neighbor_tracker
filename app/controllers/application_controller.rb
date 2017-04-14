class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_super_secret_session"
  end

  helpers do
    def current_user(session)
      @user = User.find(session[:id])
      @user
    end

    def is_logged_in?(session)
      !!session[:id] ? true : false
    end
  end

  get '/' do
    erb :'index'
  end

end
