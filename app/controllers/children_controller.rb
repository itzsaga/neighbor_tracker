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
      erb :'children/new'
    else
      erb :'error'
    end
  end

  post '/children' do
    if is_logged_in?(session)
      binding.pry
      child = Child.new(params)
      if child.save
        redirect 'children'
      else
        redirect 'child/new'
      end
    else
      erb :'error'
    end
  end
end
