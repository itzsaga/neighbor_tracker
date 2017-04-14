require './config/environment'

class ApplicationController < Sinatra::Base
  register Sinatra::Twitter::Bootstrap::Assets

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_super_secret_session"
  end

  get '/' do
    erb :'index'
  end

end