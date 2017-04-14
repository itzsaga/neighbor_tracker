class HousesController < ApplicationController

  get '/houses' do
    if is_logged_in?(session)
      @houses = current_user(session).houses
      erb :'houses/houses'
    else
      erb :'error'
    end
  end

  get '/houses/new' do
    if is_logged_in?(session)
      erb :'houses/new'
    else
      erb :'error'
    end
  end

  post '/houses' do
    if is_logged_in?(session)
      house = House.new(address: params[:address], user_id: session[:id])
      if house.save
        binding.pry
        redirect 'houses'
      else
        redirect 'houses/new'
      end
    else
      erb :'error'
    end
  end

end
