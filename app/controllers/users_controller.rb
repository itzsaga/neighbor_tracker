class UsersController < ApplicationController

  get '/login' do
    if is_logged_in?(session)
      redirect 'houses'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if !!@user
      session[:id] = @user[:id]
      redirect 'houses'
    else
      redirect 'login'
    end
  end

  get '/signup' do
    if is_logged_in?(session)
      redirect 'houses'
    else
      erb :'users/create_user'
    end
  end

  post '/signup' do
    @user = User.new(params)
    if @user.save
      session[:id] = @user.id
      redirect 'houses'
    else
      erb :'users/create_user'
    end
  end

end
