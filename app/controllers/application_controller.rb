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

    def current_user_parents
      parents = []
      current_user(session).houses.each do |house|
        Parent.where(house_id: house.id).each do |parent|
          parents << parent
        end
      end
      parents
    end

    def logged_in_auth
      is_logged_in?(session) && session[:id] == @house.user_id
    end

    def logged_in_not_auth
      is_logged_in?(session) && session[:id] != @house.user_id
    end
  end

  get '/' do
    erb :index
  end

  get '/error' do
    erb :error
  end

  get '/logout' do
    if is_logged_in?(session)
      session.clear
      redirect 'login'
    else
      redirect '/'
    end
  end

end
