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
        redirect 'houses'
      else
        redirect 'houses/new'
      end
    else
      erb :'error'
    end
  end

  get '/houses/:id/edit' do
    @house = House.find(params[:id])
    if is_logged_in?(session) && session[:id] == @house.user_id
      erb :'houses/edit'
    else
      erb :'error'
    end
  end

  get '/houses/:id' do
    @house = House.find(params[:id])
    if is_logged_in?(session) && session[:id] == @house.user_id
      @parents = @house.parents
      @children = @house.children
      erb :'houses/show'
    else
      erb :'error'
    end
  end

  patch '/houses/:id' do
    if params[:address] == ""
      redirect "/houses/#{params[:id]}/edit"
    else
      @house = House.find(params[:id])
      @house.update(address: params[:address])
    end
    redirect "/houses/#{@house.id}"
  end

  delete '/houses/:id/delete' do
    @house = House.find(params[:id])
    if is_logged_in?(session) && session[:id] == @house.id
      @house.delete
      redirect to '/houses'
    else
      erb :error
    end
  end

end
