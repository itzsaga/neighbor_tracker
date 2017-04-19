class ChildrenController < ApplicationController

  get '/children' do
    if is_logged_in?(session)
      @children = current_user_parents.collect {|parent| parent.children}.flatten.uniq
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

  get '/children/:id' do
    @child = Child.find(params[:id])
    @house = House.find(@child.parents.first.house_id)
    if is_logged_in?(session) && session[:id] == @house.user_id
      @parents = @child.parents
      erb :'children/show'
    else
      erb :'error'
    end
  end

  delete '/children/:id/delete' do
    @child = Child.find(params[:id])
    @house = House.find(@child.parents.first.house_id)
    if is_logged_in?(session) && session[:id] == @house.user_id
      @child.delete
      redirect to '/children'
    else
      erb :error
    end
  end
end
