class HousesController < ApplicationController

  get '/houses' do
    if is_logged_in?(session)
      @houses = current_user(session).houses
      erb :'houses/houses'
    else
      erb :'error'
    end
  end

end
