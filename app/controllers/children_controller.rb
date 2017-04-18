class ChildrenController < ApplicationController

  get '/children' do
    if is_logged_in?(session)
      @parents = current_user_parents
      erb 'children/children'
    else
      erb :'error'
    end
  end

end
