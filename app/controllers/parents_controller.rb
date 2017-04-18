class ParentsController < ApplicationController

  get '/parents' do
    if is_logged_in?(session)
      @parents = current_user(session).houses
      erb :'parents/parents'
    else
      erb :'error'
    end
  end

end
