class ChildrenController < ApplicationController

  get '/children' do
    if is_logged_in?(session)
      @parents = current_user_parents
      @children = @parents.collect {|parent| parent.children}.flatten
      erb :'children/children'
    else
      erb :'error'
    end
  end

  get '/children/new' do
    if is_logged_in?(session)
      @houses = current_user(session).houses
      @parents = current_user_parents
      binding.pry
      erb :'children/new'
    else
      erb :'error'
    end
  end
end
