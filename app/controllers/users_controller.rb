class UsersController < ApplicationController

  get '/login' do
    if is_logged_in?(session)
      "You're logged in"
    else
      erb :'users/login'
    end
  end

  get '/signup' do
    if is_logged_in?(session)
      "You're logged in"
    else
      erb :'users/create_user'
    end
  end

end
