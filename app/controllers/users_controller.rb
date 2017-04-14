class UsersController < ApplicationController

  get '/login' do
    if is_logged_in?(session)
      "You're logged in"
    else
      erb :'users/login'
    end
  end

end
